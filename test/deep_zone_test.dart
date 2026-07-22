import 'package:flutter_test/flutter_test.dart';
import 'package:misora_note/core/db/model.dart';

void main() {
  group('deep zone display data', () {
    test('extracts the stage number from the localized quest name', () {
      const quest = DeepZoneQuest(
        questId: 81001080,
        talentId: 1,
        questName: '红焰深域8-10',
        stellarShardCount: 43,
        crystalBallCount: 236,
        enemies: [],
      );

      expect(quest.displayName, '8-10');
    });

    test('normalizes playable character icons used as enemies', () {
      const character = DeepZoneEnemy(enemyId: 1, unitId: 605601);
      const monster = DeepZoneEnemy(enemyId: 2, unitId: 251100);

      expect(character.iconUnitId, 105631);
      expect(monster.iconUnitId, 251100);
    });

    test('filters by stage and enemy id, then sorts by rewards', () {
      const quests = [
        DeepZoneQuest(
          questId: 2,
          talentId: 1,
          questName: '深域2-1',
          stellarShardCount: 30,
          crystalBallCount: 100,
          enemies: [DeepZoneEnemy(enemyId: 9002, unitId: 2002)],
        ),
        DeepZoneQuest(
          questId: 1,
          talentId: 1,
          questName: '深域1-1',
          stellarShardCount: 10,
          crystalBallCount: 200,
          enemies: [DeepZoneEnemy(enemyId: 9001, unitId: 2001)],
        ),
      ];

      expect(
        filterAndSortDeepZoneQuests(quests, search: '9001').single.questId,
        1,
      );
      expect(
        filterAndSortDeepZoneQuests(
          quests,
          sort: DeepZoneSort.crystalBall,
          ascending: true,
        ).map((quest) => quest.questId),
        [2, 1],
      );
    });
  });
}
