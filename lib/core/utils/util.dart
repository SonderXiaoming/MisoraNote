import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:brotli/brotli.dart';

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

int longUnitId2Short(int longId) {
  return longId ~/ 100;
}

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
