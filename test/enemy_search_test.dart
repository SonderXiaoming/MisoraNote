import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/features/component/base.dart';

void main() {
  test('searches normal and optional sekai enemy parameter tables', () async {
    final directory = await Directory.systemTemp.createTemp(
      'misora_enemy_search_',
    );
    final db = AppDb('${directory.path}/search.db');
    addTearDown(() async {
      await db.close();
      await directory.delete(recursive: true);
    });

    await db.customSelect('SELECT 1').get();
    final columns = await db
        .customSelect('PRAGMA table_info(enemy_parameter)')
        .get();
    final names = columns
        .map((row) => row.read<String>('name'))
        .toList(growable: false);
    String valueFor(String name) => switch (name) {
      'enemy_id' => '10001',
      'unit_id' => '20001',
      'name' => "'测试敌人'",
      _ => '0',
    };
    await db.customStatement(
      'INSERT INTO enemy_parameter (${names.join(', ')}) '
      'VALUES (${names.map(valueFor).join(', ')})',
    );
    await db.customStatement('''
      CREATE TABLE sekai_enemy_parameter (
        sekai_enemy_id INTEGER PRIMARY KEY,
        unit_id INTEGER NOT NULL,
        name TEXT NOT NULL,
        level INTEGER NOT NULL,
        hp INTEGER NOT NULL
      )
    ''');
    await db.customStatement(
      "INSERT INTO sekai_enemy_parameter VALUES (30001, 40001, '断层敌人', 10, 5000)",
    );

    final normal = await db.searchEnemyParameters(search: '测试');
    expect(normal.single.enemyId, 10001);
    expect(normal.single.type, EnemyType.normal);

    final sekai = await db.searchEnemyParameters(
      search: '30001',
      searchById: true,
    );
    expect(sekai.single.type, EnemyType.sekai);
    expect((await db.getSekaiEnemyParameter(30001))?['unit_id'], 40001);
  });
}
