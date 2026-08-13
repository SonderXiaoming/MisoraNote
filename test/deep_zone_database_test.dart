import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:misora_note/core/db/database.dart';

void main() {
  test('loads rewards from all five talent reward tables', () async {
    final directory = await Directory.systemTemp.createTemp(
      'misora_deep_zone_database_',
    );
    final db = AppDb('${directory.path}/deep-zone.db');
    addTearDown(() async {
      await db.close();
      await directory.delete(recursive: true);
    });

    await db.customSelect('SELECT 1').get();
    for (var talentId = 1; talentId <= 5; talentId++) {
      final questId = 280000000 + talentId * 1000000 + 1;
      final rewardGroupId = questId;
      final waveGroupId = 1000 + talentId;
      await db.customStatement(
        'INSERT INTO talent_quest_data '
        '(quest_id, area_id, quest_name, clear_reward_group, wave_group_id_1) '
        'VALUES (?, ?, ?, ?, ?)',
        [questId, 80001 + talentId * 1000, '深域 $talentId-1', rewardGroupId, waveGroupId],
      );
      await db.customStatement(
        'INSERT INTO talent_quest_clear_reward0$talentId '
        '(id, reward_group_id, reward_num_2, reward_num_3) '
        'VALUES (?, ?, ?, ?)',
        [talentId, rewardGroupId, 10 + talentId, 20 + talentId],
      );
      await db.customStatement(
        'INSERT INTO talent_quest_wave_group_data '
        '(id, wave_group_id, enemy_id_1, enemy_id_2, enemy_id_3, '
        'enemy_id_4, enemy_id_5) VALUES (?, ?, 0, 0, 0, 0, 0)',
        [talentId, waveGroupId],
      );
    }

    for (var talentId = 1; talentId <= 5; talentId++) {
      final quests = await db.getDeepZoneQuests(talentId);
      expect(quests, hasLength(1));
      expect(quests.single.stellarShardCount, 10 + talentId);
      expect(quests.single.crystalBallCount, 20 + talentId);
    }
  });
}
