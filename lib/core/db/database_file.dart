import 'dart:io';
import 'dart:isolate';

import 'package:brotli/brotli.dart';
import 'package:sqlite3/sqlite3.dart';

/// Brotli 0.6.0 reuses its output buffer. Consume each chunk synchronously
/// inside the worker isolate, before the decoder overwrites it.
Future<void> decompressDatabaseBrotli(String source, String destination) =>
    Isolate.run(() async {
      final output = File(destination).openSync(mode: FileMode.write);
      try {
        final decoder = brotli.decoder.startChunkedConversion(
          _DatabaseFileSink(output),
        );
        await for (final chunk in File(source).openRead()) {
          decoder.add(chunk);
        }
        decoder.close();
        output.flushSync();
      } finally {
        output.closeSync();
      }
    });

class _DatabaseFileSink implements Sink<List<int>> {
  _DatabaseFileSink(this.file);

  final RandomAccessFile file;

  @override
  void add(List<int> data) => file.writeFromSync(data);

  @override
  void close() {}
}

/// Check the complete downloaded file without allowing SQLite to create or
/// migrate an empty/corrupt database. A valid header alone is insufficient.
Future<void> validateDatabaseFile(String path) => Isolate.run(() {
  final database = sqlite3.open(path, mode: OpenMode.readOnly);
  try {
    final result = database.select('PRAGMA quick_check');
    if (result.length != 1 || result.single.values.single != 'ok') {
      throw const FormatException('数据库完整性检查失败，请重新下载');
    }
  } finally {
    database.dispose();
  }
});

/// Keep a backup until the caller has successfully opened the replacement.
/// [beforeReplace] closes the current connection; if [afterReplace] fails,
/// it must close its new connection before throwing so rollback can proceed.
Future<void> installDatabaseFile(
  File staged,
  File target, {
  Future<void> Function()? beforeReplace,
  Future<void> Function()? afterReplace,
}) async {
  await validateDatabaseFile(staged.path);
  await beforeReplace?.call();
  final backup = File('${staged.path}.backup');
  if (target.existsSync()) target.renameSync(backup.path);
  try {
    staged.renameSync(target.path);
    await afterReplace?.call();
  } catch (_) {
    if (target.existsSync()) target.deleteSync();
    if (backup.existsSync()) backup.renameSync(target.path);
    rethrow;
  }
  if (backup.existsSync()) backup.deleteSync();
}
