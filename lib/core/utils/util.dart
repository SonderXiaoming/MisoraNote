import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:brotli/brotli.dart';
import 'package:dio/dio.dart';
import 'package:misora_note/constants.dart';
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

  const DatabaseDownloadInfo({
    required this.version,
    this.url,
    this.brotliUrl,
  });
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

Future<void> updatePcrDatabase(
  Area area, {
  void Function(int rec, int total)? onProgress,
}) async {
  final path = FilePath.db(area);
  final response = await dio.get(FetchUrl.dbInfo(area));
  if (response.statusCode != 200) {
    throw Exception('获取数据库下载信息失败: ${response.statusCode}');
  }
  final info = databaseDownloadInfoFromResponse(response.data, area);
  final brotliUrl = info?.brotliUrl;
  if (brotliUrl == null) {
    await apiClient.download(
      url: info?.url ?? FetchUrl.db(area),
      path: path,
      allowCache: false,
      onProgress: onProgress,
    );
    return;
  }

  final compressedPath = '$path.download.br';
  final stagedPath = '$path.download';
  final compressedFile = File(compressedPath);
  final stagedFile = File(stagedPath);
  try {
    await apiClient.download(
      url: brotliUrl,
      path: compressedPath,
      allowCache: false,
      onProgress: onProgress,
    );
    if (stagedFile.existsSync()) stagedFile.deleteSync();
    await _decompressBrotliFile(compressedPath, stagedPath);
    if (!await _hasSqliteHeader(stagedFile)) {
      throw const FormatException('Brotli 数据解压后不是有效的 SQLite 数据库');
    }
    await _replaceDatabase(stagedFile, File(path));
  } finally {
    if (compressedFile.existsSync()) compressedFile.deleteSync();
    if (stagedFile.existsSync()) stagedFile.deleteSync();
  }
}

Future<void> _decompressBrotliFile(String source, String destination) =>
    Isolate.run(() async {
      await brotli.decoder
          .bind(File(source).openRead())
          .pipe(File(destination).openWrite());
    });

Future<bool> _hasSqliteHeader(File file) async {
  if (!file.existsSync() || file.lengthSync() < 16) return false;
  final input = await file.open();
  try {
    final header = await input.read(16);
    const sqliteHeader = <int>[
      83,
      81,
      76,
      105,
      116,
      101,
      32,
      102,
      111,
      114,
      109,
      97,
      116,
      32,
      51,
      0,
    ];
    if (header.length != sqliteHeader.length) return false;
    for (var index = 0; index < sqliteHeader.length; index++) {
      if (header[index] != sqliteHeader[index]) return false;
    }
    return true;
  } finally {
    await input.close();
  }
}

Future<void> _replaceDatabase(File staged, File target) async {
  final backup = File('${target.path}.backup');
  if (backup.existsSync()) backup.deleteSync();
  if (target.existsSync()) target.renameSync(backup.path);
  try {
    staged.renameSync(target.path);
    if (backup.existsSync()) backup.deleteSync();
  } catch (_) {
    if (target.existsSync()) target.deleteSync();
    if (backup.existsSync()) backup.renameSync(target.path);
    rethrow;
  }
}
