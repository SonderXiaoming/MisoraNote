import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:misora_note/core/db/database_file.dart';
import 'package:sqlite3/sqlite3.dart';

void main() {
  late Directory directory;

  setUp(() async {
    directory = await Directory.systemTemp.createTemp('misora_database_file_');
  });
  tearDown(() => directory.delete(recursive: true));

  File database(String name, int value) {
    final file = File('${directory.path}/$name.db');
    final db = sqlite3.open(file.path);
    try {
      db.execute('CREATE TABLE sample (value INTEGER NOT NULL)');
      db.execute('INSERT INTO sample VALUES (?)', [value]);
    } finally {
      db.dispose();
    }
    return file;
  }

  int readValue(File file) {
    final db = sqlite3.open(file.path, mode: OpenMode.readOnly);
    try {
      return db.select('SELECT value FROM sample').single['value'] as int;
    } finally {
      db.dispose();
    }
  }

  test('Brotli output remains exact across reused 16 KiB buffers', () async {
    // Python brotli.compress(bytes(i % 251 for i in range(100000))).
    // Six full output chunks plus a short final chunk expose buffer aliasing.
    const compressed =
        'W5+Ggf7iwI6VgTWkeuCoYePWDsTAtu1NVuvgvJD7TnFwXsl5xEGocIyQl48y5NFE'
        'AmKCTRy792O++gIARJhQxoVU2ljnQ0y51NbHXPvc9wEQghEUwwmSohmW4wVRkhVV'
        '0w3Tsh3X84MwipM0y4uyqpu264dxmpd124/zup/3+/0BBCMohhMkRTMsxwuiJCuq'
        'phumZTuu5wdhFCdplhdlVTdt1w/jNC/rth/ndT/v9wOIMKGMC6m0sc4HYRQnaZYX'
        'ZVU3bdcP4zQv67Yf53U/7/eDcjp7nwQ=';
    final source = File('${directory.path}/input.br');
    final output = File('${directory.path}/output');
    await source.writeAsBytes(base64Decode(compressed));

    await decompressDatabaseBrotli(source.path, output.path);

    expect(
      await output.readAsBytes(),
      orderedEquals(List<int>.generate(100000, (index) => index % 251)),
    );
  });

  test('rejects a damaged file even with a valid SQLite header', () async {
    final staged = database('staged', 2);
    final bytes = await staged.readAsBytes();
    // Page 1 b-tree type: corrupt schema data while preserving its header.
    bytes[100] = 0;
    await staged.writeAsBytes(bytes);
    final target = database('target', 1);
    var closed = false;

    await expectLater(
      installDatabaseFile(
        staged,
        target,
        beforeReplace: () async {
          closed = true;
        },
      ),
      throwsA(isA<SqliteException>()),
    );
    expect(closed, isFalse);
    expect(readValue(target), 1);
  });

  test('installs a validated database and removes its backup', () async {
    final target = database('target', 1);
    final staged = database('staged', 2);
    await installDatabaseFile(
      staged,
      target,
      beforeReplace: () async {
        expect(readValue(target), 1);
      },
      afterReplace: () async {
        expect(readValue(target), 2);
      },
    );
    expect(readValue(target), 2);
    expect(File('${staged.path}.backup').existsSync(), isFalse);
  });

  test('restores the old database when activation fails', () async {
    final target = database('target', 1);
    final staged = database('staged', 2);
    await expectLater(
      installDatabaseFile(
        staged,
        target,
        afterReplace: () async {
          throw StateError('initialization failed');
        },
      ),
      throwsStateError,
    );
    expect(readValue(target), 1);
  });

  test('a failed first installation leaves no active database', () async {
    final target = File('${directory.path}/missing.db');
    await expectLater(
      installDatabaseFile(
        database('staged', 2),
        target,
        afterReplace: () async {
          throw StateError('initialization failed');
        },
      ),
      throwsStateError,
    );
    expect(target.existsSync(), isFalse);
  });

  test('a fresh download replaces an already corrupt database', () async {
    final target = File('${directory.path}/target.db');
    await target.writeAsString('corrupt old database');
    await installDatabaseFile(database('staged', 2), target);
    expect(readValue(target), 2);
  });
}
