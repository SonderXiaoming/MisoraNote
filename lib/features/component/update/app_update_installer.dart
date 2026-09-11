import 'dart:io';

import 'package:flutter/services.dart';
import 'package:misora_note/core/network/base.dart';
import 'package:misora_note/core/network/response_model.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

const _updateChannel = MethodChannel('misora_note/app_update');

Future<void> downloadAndOpenUpdate(
  AppAsset asset, {
  void Function(int received, int total)? onProgress,
}) async {
  final temporaryDirectory = await getTemporaryDirectory();
  final updateDirectory = Directory(
    path.join(temporaryDirectory.path, 'app_updates'),
  );
  await updateDirectory.create(recursive: true);

  final safeName = path
      .basename(asset.name)
      .replaceAll(RegExp(r'[:*?"<>|]'), '_');
  final updatePath = path.join(updateDirectory.path, safeName);
  await apiClient.download(
    url: asset.browserDownloadUrl,
    path: updatePath,
    allowCache: false,
    extraHeaders: const {
      'User-Agent': 'MisoraNote-app-updater',
      'Accept': 'application/octet-stream',
    },
    onProgress: onProgress,
  );

  final updateFile = File(updatePath);
  if (!await updateFile.exists() || await updateFile.length() == 0) {
    throw const FileSystemException('更新包下载不完整');
  }

  if (Platform.isAndroid) {
    await _updateChannel.invokeMethod<void>('installApk', {
      'path': updateFile.path,
    });
    return;
  }
  if (Platform.isWindows) {
    await Process.start('explorer.exe', [
      updateFile.path,
    ], mode: ProcessStartMode.detached);
    return;
  }
  if (Platform.isMacOS) {
    await Process.start('open', [
      updateFile.path,
    ], mode: ProcessStartMode.detached);
    return;
  }
  if (Platform.isLinux) {
    await Process.start('xdg-open', [
      updateFile.path,
    ], mode: ProcessStartMode.detached);
    return;
  }

  throw UnsupportedError('当前平台不支持应用内更新');
}
