import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:brotli/brotli.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/network/response_model.dart';
import 'package:misora_note/core/network/base.dart';
import 'package:misora_note/core/db/unhash.dart' as unhash_lib;

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

// TODO: 大文件分块解压
Future<void> decompress({
  required String brPath,
  required String outPath,
}) async {
  final brFile = File(brPath);
  if (!await brFile.exists()) {
    throw FileSystemException('Brotli file not found', brPath);
  }

  final outFile = File(outPath);
  await outFile.parent.create(recursive: true);

  // 一次性读取 + 解压
  final input = await brFile.readAsBytes();
  final output = brotli.decode(input);

  await outFile.writeAsBytes(output, flush: true);

  await brFile.delete();
}

void checkPathExists(String path) {
  final file = File(path);
  if (!file.existsSync()) {
    throw FileSystemException('文件不存在', path);
  }
}

Future<String?> checkDatabaseUpdate(Area area) async {
  try {
    final response = await dio.post(
      FetchUrl.dbLatestVersion,
      data: {'regionCode': area.name},
    );
    if (response.statusCode == 200) {
      final info = LatestDbVersionResponse.fromJson(response.data);
      return info.data.time ?? info.data.truthVersion;
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
  final brPath = '$path.br';
  final url = FetchUrl.db(area);
  await apiClient.download(
    url: url,
    path: brPath,
    allowCache: false,
    onProgress: onProgress,
  );
  await decompress(brPath: brPath, outPath: path);

  // 下载完成后尝试 unhash
  /*
  try {
    await unhash_lib.unhashDatabase(path);
  } catch (e) {
    print('⚠️  数据库 unhash 失败，将使用原始数据库: $e');
  }
  */
}
