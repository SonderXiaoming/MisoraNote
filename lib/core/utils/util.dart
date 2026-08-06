import 'dart:io';
import 'dart:async';
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

String? databaseVersionFromResponse(Object? data, Area area) {
  if (data is! Map) return null;
  final latest = data['latest'];
  if (latest is! Map) return null;
  final database = latest[area.name];
  if (database is! Map) return null;
  final version = database['version']?.toString().trim();
  return version == null || version.isEmpty ? null : version;
}

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
  final url = FetchUrl.db(area);
  await apiClient.download(
    url: url,
    path: path,
    allowCache: false,
    onProgress: onProgress,
  );
}
