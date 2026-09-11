import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/db/database_file.dart';
import 'package:misora_note/core/network/base.dart';

int longUnitId2Short(int longId) {
  return longId ~/ 100;
}

final Dio dio = Dio(
  BaseOptions(
    headers: {
      // 必须拿原始压缩字节
      HttpHeaders.acceptEncodingHeader: 'identity',
    },
    // 4xx 也先放行，方便我们自行处理 416 等
    validateStatus: (code) => code != null && code < 500,
  ),
);

void checkPathExists(String path) {
  final file = File(path);
  if (!file.existsSync()) {
    throw FileSystemException('文件不存在', path);
  }
}

class DatabaseDownloadInfo {
  final String version;
  final String? url;
  final String? brotliUrl;

  const DatabaseDownloadInfo({required this.version, this.url, this.brotliUrl});
}

DatabaseDownloadInfo? databaseDownloadInfoFromResponse(
  Object? data,
  Area area,
) {
  if (data is! Map) return null;
  final latest = data['latest'];
  if (latest is! Map) return null;
  final database = latest[area.name];
  if (database is! Map) return null;
  final version = database['version']?.toString().trim();
  if (version == null || version.isEmpty) return null;
  String? optionalUrl(String key) {
    final value = database[key]?.toString().trim();
    return value == null || value.isEmpty ? null : value;
  }

  return DatabaseDownloadInfo(
    version: version,
    url: optionalUrl('url'),
    brotliUrl: optionalUrl('br_url'),
  );
}

String? databaseVersionFromResponse(Object? data, Area area) =>
    databaseDownloadInfoFromResponse(data, area)?.version;

Future<String?> checkDatabaseUpdate(Area area) async {
  try {
    final response = await dio.get(FetchUrl.dbInfo(area));
    if (response.statusCode == 200) {
      return databaseVersionFromResponse(response.data, area);
    }
    return null;
  } catch (error) {
    // 处理错误
    throw Exception('检查数据库更新失败: $error');
  }
}

Future<String> updatePcrDatabase(
  Area area, {
  void Function(int rec, int total)? onProgress,
  Future<void> Function()? beforeReplace,
  Future<void> Function()? afterReplace,
}) async {
  final path = FilePath.db(area);
  final response = await dio.get(FetchUrl.dbInfo(area));
  if (response.statusCode != 200) {
    throw Exception('获取数据库下载信息失败: ${response.statusCode}');
  }
  final info = databaseDownloadInfoFromResponse(response.data, area);
  if (info == null) {
    throw const FormatException('数据库下载信息缺少版本号');
  }
  final brotliUrl = info.brotliUrl;
  final target = File(path);
  await target.parent.create(recursive: true);
  // A unique staging directory cannot resume a partial file from an older
  // server version. All downloaded data is checked before touching the old DB.
  final staging = await target.parent.createTemp('.database-update-');
  final compressedPath = '${staging.path}/database.br';
  final stagedPath = '${staging.path}/database.db';
  final stagedFile = File(stagedPath);
  try {
    await apiClient.download(
      url: brotliUrl ?? info.url ?? FetchUrl.db(area),
      path: brotliUrl == null ? stagedPath : compressedPath,
      allowCache: false,
      onProgress: onProgress,
    );
    if (brotliUrl != null) {
      await decompressDatabaseBrotli(compressedPath, stagedPath);
    }
    await installDatabaseFile(
      stagedFile,
      target,
      beforeReplace: () async {
        // Exercise the same queries/migrations as application startup while
        // the previous database is still available.
        final candidate = AppDb(stagedPath);
        try {
          await candidate.init();
        } finally {
          await candidate.close();
        }
        await beforeReplace?.call();
      },
      afterReplace: afterReplace,
    );
    return info.version;
  } finally {
    // Preserve the backup if an OS error prevented rollback.
    if (!File('$stagedPath.backup').existsSync()) {
      await staging.delete(recursive: true);
    }
  }
}
