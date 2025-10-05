import 'dart:io';

import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient(this.dio);

  Future<T> post<T>(
    String url, {
    Map<String, dynamic>? body,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final resp = await dio.post(url, data: body);
    if (resp.statusCode != 200) {
      throw Exception('请求失败: ${resp.statusCode}');
    }

    final data = resp.data;

    if (data is Map<String, dynamic>) {
      return fromJson(data);
    } else {
      throw Exception('响应不是对象: $data');
    }
  }

  Future<T> get<T>(
    String url, {
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final resp = await dio.get(url, options: Options(headers: headers));
    if (resp.statusCode != 200) {
      throw Exception('请求失败: ${resp.statusCode}');
    }

    final data = resp.data;

    if (data is Map<String, dynamic>) {
      return fromJson(data);
    } else {
      throw Exception('响应不是对象: $data');
    }
  }

  Future<void> download({
    required String url,
    required String path,
    Map<String, String>? extraHeaders,
    bool? allowCache = true,
    void Function(int received, int total)? onProgress,
    CancelToken? cancelToken,
  }) async {
    final file = File(path);
    if (file.existsSync() && allowCache == true) {
      // 已存在，直接返回
      return;
    }
    final partFile = File('$path.partial');
    partFile.parent.createSync(recursive: true);

    int existing = partFile.existsSync() ? partFile.lengthSync() : 0;

    // 构造请求头（断点续传）
    final headers = <String, String>{
      if (existing > 0) HttpHeaders.rangeHeader: 'bytes=$existing-',
      if (extraHeaders != null) ...extraHeaders,
      HttpHeaders.acceptEncodingHeader: 'identity', // 必须拿原始压缩字节
    };

    // 发起请求
    Response<ResponseBody> resp = await dio.get<ResponseBody>(
      url,
      options: Options(responseType: ResponseType.stream, headers: headers),
      cancelToken: cancelToken,
    );

    // 如果我们请求了 Range，但服务端返回 200（而非 206），需要从头覆盖写
    if (existing > 0 && resp.statusCode == 200) {
      existing = 0;
      if (partFile.existsSync()) partFile.deleteSync();
      // 重新发一次（干净的全量下载）
      resp = await dio.get<ResponseBody>(
        url,
        options: Options(
          responseType: ResponseType.stream,
          headers: extraHeaders,
        ),
        cancelToken: cancelToken,
      );
    }

    // 416：本地 partial 超过/不匹配源文件 => 清空后全量重下
    if (resp.statusCode == 416) {
      existing = 0;
      if (partFile.existsSync()) partFile.deleteSync();

      resp = await dio.get<ResponseBody>(
        url,
        options: Options(
          responseType: ResponseType.stream,
          headers: extraHeaders,
        ),
        cancelToken: cancelToken,
      );
    }

    // 计算总长（仅用于进度）
    final isPartial = resp.statusCode == 206;
    final contentLen =
        int.tryParse(resp.data?.headers['content-length']?.first ?? '') ?? -1;
    final total = (contentLen > 0)
        ? (isPartial ? existing + contentLen : contentLen)
        : -1;

    // 以 append 方式打开 partial 并写入
    final raf = partFile.openSync(mode: FileMode.append);
    int received = existing;

    try {
      await resp.data!.stream.listen((chunk) {
        raf.writeFromSync(chunk);
        received += chunk.length;
        if (onProgress != null && total > 0) {
          onProgress(received, total);
        }
      }).asFuture();
    } finally {
      await raf.close();
    }

    // 下载完成：原子替换最终文件
    if (file.existsSync()) file.deleteSync();
    partFile.renameSync(file.path);
  }
}

final apiClient = ApiClient(Dio());
