import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:misora_note/features/component/base.dart';
import 'dart:io';
import 'model.dart';
import 'table.dart';

part 'database.g.dart';

int _toIntOrNull(String? s) => s == null ? -1 : int.tryParse(s.trim()) ?? -1;
const maxUnitId = 200000;
final kannaIds = [170101, 170201];

const _enemyParameterTables =
    <EnemyType, ({String tableName, String idColumn})>{
      EnemyType.normal: (tableName: 'enemy_parameter', idColumn: 'enemy_id'),
      EnemyType.event: (
        tableName: 'event_enemy_parameter',
        idColumn: 'enemy_id',
      ),
      EnemyType.talentQuest: (
        tableName: 'talent_quest_enemy_parameter',
        idColumn: 'enemy_id',
      ),
      EnemyType.shiori: (
        tableName: 'shiori_enemy_parameter',
        idColumn: 'enemy_id',
      ),
      EnemyType.sre: (tableName: 'sre_enemy_parameter', idColumn: 'enemy_id'),
      EnemyType.tower: (
        tableName: 'tower_enemy_parameter',
        idColumn: 'enemy_id',
      ),
      EnemyType.seven: (
        tableName: 'seven_enemy_parameter',
        idColumn: 'enemy_id',
      ),
      EnemyType.sekai: (
        tableName: 'sekai_enemy_parameter',
        idColumn: 'sekai_enemy_id',
      ),
    };

@DriftDatabase(
  tables: [
    UnitProfile,
    RedeemUnit,
    UnitData,
    UniqueEquipmentEnhanceData,
    ActualUnitBackground,
    Rarity6QuestData,
    SkillData,
    UnitSkillData,
    SkillAction,
    AilmentData,
    UnitAttackPattern,
    SpSkillLabelData,
    UnitSkillDataRF,
    UnitUniqueEquip,
    UnitUniqueEquipment,
    UniqueEquipEnhanceRate,
    UniqueEquipmentData,
    UniqueEquipmentEnhanceData,
    UnlockUnitCondition,
    UnitTalent,
    UnitEnemyData,
    EventEnemyParameter,
    TalentQuestEnemyParameter,
    ShioriEnemyParameter,
    SreEnemyParameter,
    TowerEnemyParameter,
    SevenEnemyParameter,
    EnemyParameter,
    EnemyTalentWeakness,
    TalentWeakness,
    EnemyMParts,
    ClanBattle2MapData,
    ClanBattleSchedule,
    WaveGroupData,
  ],
)
class AppDb extends _$AppDb {
  late List<int> exCharacter; // 可兑换角色列表
  late List<int> r6Units; // 所有 6 星角色列表
  late List<int> unique1Units; // 所有专一1角色列表
  late List<int> unique2Units; // 所有专一2角色列表
  late (int, int) maxUniqueEquipLv; // 最大的专一，二等级
  late File dbFile;
  int unitNum = 0;
  Set<String>? _knownTables;

  AppDb(String sqliteFile)
    : dbFile = File(sqliteFile),
      super(NativeDatabase(File(sqliteFile)));

  Future<void> init() async {
    await _ensureSkillColumns();
    unitNum = (await getUnitsData()).length;
    exCharacter = await getExUnitsList();
    maxUniqueEquipLv = (
      await getMaxUniqueEquipLv(1),
      await getMaxUniqueEquipLv(2),
    );
    r6Units = await getR6Units();
    unique1Units = (await getallUniqueEquip(
      slot: 1,
    )).map((e) => e.unitId).toSet().toList();
    unique2Units = (await getallUniqueEquip(
      slot: 2,
    )).map((e) => e.unitId).toSet().toList();
  }

  /// New skill columns reach the three regional databases at different times.
  /// Keep downloaded older databases queryable while exposing the newest data.
  Future<void> _ensureSkillColumns() async {
    final unitSkillColumns = await _tableColumns('unit_skill_data');
    if (!unitSkillColumns.contains('main_skill_evolution_1_pro')) {
      await customStatement(
        'ALTER TABLE unit_skill_data '
        'ADD COLUMN main_skill_evolution_1_pro INTEGER DEFAULT 0',
      );
    }
    if (!unitSkillColumns.contains('sp_skill_evolution_1_pro')) {
      await customStatement(
        'ALTER TABLE unit_skill_data '
        'ADD COLUMN sp_skill_evolution_1_pro INTEGER DEFAULT 0',
      );
    }

    final skillColumns = await _tableColumns('skill_data');
    for (var index = 11; index <= 20; index++) {
      if (!skillColumns.contains('action_$index')) {
        await customStatement(
          'ALTER TABLE skill_data ADD COLUMN action_$index INTEGER',
        );
      }
      if (!skillColumns.contains('depend_action_$index')) {
        await customStatement(
          'ALTER TABLE skill_data ADD COLUMN depend_action_$index INTEGER',
        );
      }
    }
  }

  Future<Set<String>> _tableColumns(String tableName) async {
    final rows = await customSelect('PRAGMA table_info($tableName)').get();
    return rows.map((row) => row.data['name']).whereType<String>().toSet();
  }

  Future<Set<String>> _databaseTables() async {
    final cached = _knownTables;
    if (cached != null) return cached;
    final rows = await customSelect(
      "SELECT name FROM sqlite_master WHERE type = 'table'",
    ).get();
    return _knownTables = rows.map((row) => row.read<String>('name')).toSet();
  }

  DateTime? _parseScheduleTime(String value, int utcOffsetHours) {
    final match = RegExp(
      r'^(\d{4})[/-](\d{1,2})[/-](\d{1,2})(?:\s+(\d{1,2}):(\d{1,2})(?::(\d{1,2}))?)?$',
    ).firstMatch(value.trim().replaceAll(RegExp(r'\s+'), ' '));
    if (match == null) return null;

    final serverTime = DateTime.utc(
      int.parse(match.group(1)!),
      int.parse(match.group(2)!),
      int.parse(match.group(3)!),
      int.parse(match.group(4) ?? '0'),
      int.parse(match.group(5) ?? '0'),
      int.parse(match.group(6) ?? '0'),
    );
    return serverTime.subtract(Duration(hours: utcOffsetHours));
  }

  Future<void> _appendScheduleRows(
    List<GameScheduleEvent> target, {
    required String sql,
    required ScheduleEventType type,
    required int utcOffsetHours,
  }) async {
    try {
      final rows = await customSelect(sql).get();
      for (final row in rows) {
        final startTime = _parseScheduleTime(
          row.read<String>('start_time'),
          utcOffsetHours,
        );
        var endTime = _parseScheduleTime(
          row.read<String>('end_time'),
          utcOffsetHours,
        );
        if (startTime == null || endTime == null) continue;
        if (type == ScheduleEventType.clanBattle) {
          endTime = startTime.add(
            const Duration(days: 5, hours: -5, seconds: -1),
          );
        }

        String cleanText(String value) => value
            .replaceAll(r'\n', ' ')
            .replaceAll('\n', ' ')
            .replaceAll(RegExp(r'\s+'), ' ')
            .trim();

        target.add(
          GameScheduleEvent(
            id: row.read<String>('event_key'),
            title: cleanText(row.read<String>('title')),
            subtitle: cleanText(row.read<String>('subtitle')),
            type: type,
            startTime: startTime,
            endTime: endTime,
          ),
        );
      }
    } catch (_) {
      // Regional and older databases do not always contain the same schedule
      // schema. A missing source should not hide events from other sources.
    }
  }

  Future<List<GameScheduleEvent>> getScheduleEvents({
    required int utcOffsetHours,
  }) async {
    final tables = await _databaseTables();
    final events = <GameScheduleEvent>[];

    if (tables.containsAll({'hatsune_schedule', 'event_story_data'})) {
      await _appendScheduleRows(
        events,
        type: ScheduleEventType.story,
        utcOffsetHours: utcOffsetHours,
        sql: '''
          SELECT
            CAST(h.event_id AS TEXT) AS event_key,
            COALESCE(NULLIF(story.title, ''), '剧情活动') AS title,
            '' AS subtitle,
            h.start_time,
            h.end_time
          FROM hatsune_schedule AS h
          LEFT JOIN event_story_data AS story
            ON story.story_group_id =
              ((CASE WHEN h.original_event_id = 0
                THEN h.event_id ELSE h.original_event_id END) % 10000 + 5000)
          ORDER BY h.event_id DESC
          LIMIT 20
        ''',
      );
    }

    if (tables.containsAll({'seven_schedule', 'seven_event_setting'})) {
      await _appendScheduleRows(
        events,
        type: ScheduleEventType.story,
        utcOffsetHours: utcOffsetHours,
        sql: '''
          SELECT
            CAST(s.event_id AS TEXT) AS event_key,
            COALESCE(NULLIF(setting.title, ''), '剧情活动') AS title,
            '' AS subtitle,
            s.start_time,
            s.end_time
          FROM seven_schedule AS s
          LEFT JOIN seven_event_setting AS setting
            ON setting.event_id = s.event_id
          ORDER BY s.event_id DESC
          LIMIT 20
        ''',
      );
    }

    if (tables.contains('gacha_data')) {
      await _appendScheduleRows(
        events,
        type: ScheduleEventType.gacha,
        utcOffsetHours: utcOffsetHours,
        sql: '''
          SELECT
            CAST(gacha_id AS TEXT) AS event_key,
            COALESCE(NULLIF(gacha_name, ''), '扭蛋') AS title,
            COALESCE(description, '') AS subtitle,
            start_time,
            end_time
          FROM gacha_data
          WHERE CAST(gacha_id AS TEXT) NOT LIKE '1%'
            AND CAST(gacha_id AS TEXT) NOT LIKE '2%'
            AND gacha_id < 60001
          ORDER BY start_time DESC
          LIMIT 100
        ''',
      );
    }

    if (tables.contains('campaign_schedule')) {
      await _appendScheduleRows(
        events,
        type: ScheduleEventType.campaign,
        utcOffsetHours: utcOffsetHours,
        sql: '''
          SELECT
            CAST(MAX(id) AS TEXT) AS event_key,
            REPLACE(GROUP_CONCAT(DISTINCT CASE campaign_category
              WHEN 31 THEN '普通关卡'
              WHEN 41 THEN '普通关卡'
              WHEN 32 THEN '困难关卡'
              WHEN 42 THEN '困难关卡'
              WHEN 39 THEN '高难关卡'
              WHEN 49 THEN '高难关卡'
              WHEN 34 THEN '探索'
              WHEN 37 THEN '圣迹调查'
              WHEN 38 THEN '神殿调查'
              WHEN 45 THEN '地下城'
              ELSE '报酬加倍' END), ',', ' · ') AS title,
            '掉落/玛那 ×' || printf('%g', value / 1000.0) AS subtitle,
            start_time,
            end_time
          FROM campaign_schedule
          WHERE campaign_category IN (31, 41, 32, 42, 39, 49, 34, 37, 38, 45)
            AND lv_to = -1
          GROUP BY start_time, end_time, value
          ORDER BY MAX(id) DESC
          LIMIT 100
        ''',
      );
    }

    if (tables.containsAll({'daily_mission_data', 'mission_reward_data'})) {
      await _appendScheduleRows(
        events,
        type: ScheduleEventType.dailyMission,
        utcOffsetHours: utcOffsetHours,
        sql: '''
          SELECT
            CAST(m.daily_mission_id AS TEXT) AS event_key,
            '每日任务体力' AS title,
            CAST(reward.reward_num * 10 AS TEXT) || ' 体力' AS subtitle,
            m.start_time,
            m.end_time
          FROM daily_mission_data AS m
          INNER JOIN mission_reward_data AS reward
            ON reward.mission_reward_id = m.mission_reward_id
          WHERE reward.reward_type = 6 AND reward.reward_num > 100
          ORDER BY m.start_time DESC
          LIMIT 10
        ''',
      );
    }

    if (tables.containsAll({'login_bonus_data', 'login_bonus_detail'})) {
      await _appendScheduleRows(
        events,
        type: ScheduleEventType.loginBonus,
        utcOffsetHours: utcOffsetHours,
        sql: '''
          SELECT
            CAST(login.login_bonus_id AS TEXT) AS event_key,
            COALESCE(NULLIF(login.name, ''), '登录奖励') AS title,
            CAST(SUM(detail.reward_num) AS TEXT) || ' 宝石' AS subtitle,
            login.start_time,
            login.end_time
          FROM login_bonus_data AS login
          INNER JOIN login_bonus_detail AS detail
            ON detail.login_bonus_id = login.login_bonus_id
          WHERE detail.reward_id = 91002
            AND login.login_bonus_id % 10000 > 2
          GROUP BY login.login_bonus_id
          ORDER BY login.start_time DESC
          LIMIT 10
        ''',
      );
    }

    if (tables.contains('chara_fortune_schedule')) {
      await _appendScheduleRows(
        events,
        type: ScheduleEventType.fortune,
        utcOffsetHours: utcOffsetHours,
        sql: '''
          SELECT CAST(fortune_id AS TEXT) AS event_key,
            COALESCE(NULLIF(name, ''), '兰德索尔杯') AS title,
            '' AS subtitle, start_time, end_time
          FROM chara_fortune_schedule
          ORDER BY fortune_id DESC LIMIT 5
        ''',
      );
    }

    if (tables.contains('tower_schedule')) {
      await _appendScheduleRows(
        events,
        type: ScheduleEventType.tower,
        utcOffsetHours: utcOffsetHours,
        sql: '''
          SELECT CAST(tower_schedule_id AS TEXT) AS event_key,
            '露娜塔' AS title, '' AS subtitle, start_time, end_time
          FROM tower_schedule
          ORDER BY tower_schedule_id DESC LIMIT 10
        ''',
      );
    }

    if (tables.contains('secret_dungeon_schedule')) {
      await _appendScheduleRows(
        events,
        type: ScheduleEventType.specialDungeon,
        utcOffsetHours: utcOffsetHours,
        sql: '''
          SELECT CAST(dungeon_area_id AS TEXT) AS event_key,
            '特别地下城' AS title, '' AS subtitle, start_time, end_time
          FROM secret_dungeon_schedule
          ORDER BY dungeon_area_id DESC LIMIT 10
        ''',
      );
    }

    if (tables.contains('tdf_schedule')) {
      await _appendScheduleRows(
        events,
        type: ScheduleEventType.dimensionalFault,
        utcOffsetHours: utcOffsetHours,
        sql: '''
          SELECT CAST(schedule_id AS TEXT) AS event_key,
            '次元断层' AS title, '' AS subtitle, start_time, end_time
          FROM tdf_schedule
          ORDER BY schedule_id DESC LIMIT 10
        ''',
      );
    }

    final colosseumTable = tables.contains('dome_schedule_data')
        ? 'dome_schedule_data'
        : tables.contains('colosseum_schedule_data')
        ? 'colosseum_schedule_data'
        : null;
    if (colosseumTable != null) {
      await _appendScheduleRows(
        events,
        type: ScheduleEventType.colosseum,
        utcOffsetHours: utcOffsetHours,
        sql:
            '''
          SELECT CAST(schedule_id AS TEXT) AS event_key,
            '斗技场' AS title, '' AS subtitle, start_time, end_time
          FROM $colosseumTable
          ORDER BY schedule_id DESC LIMIT 10
        ''',
      );
    }

    if (tables.contains('abyss_schedule')) {
      await _appendScheduleRows(
        events,
        type: ScheduleEventType.abyss,
        utcOffsetHours: utcOffsetHours,
        sql: '''
          SELECT CAST(abyss_id AS TEXT) AS event_key,
            COALESCE(NULLIF(title, ''), '深渊讨伐战') AS title,
            '' AS subtitle, start_time, end_time
          FROM abyss_schedule
          ORDER BY abyss_id DESC LIMIT 10
        ''',
      );
    }

    if (tables.contains('campaign_freegacha')) {
      await _appendScheduleRows(
        events,
        type: ScheduleEventType.freeGacha,
        utcOffsetHours: utcOffsetHours,
        sql: '''
          SELECT CAST(a.id AS TEXT) AS event_key,
            '免费十连' AS title,
            CASE WHEN COALESCE(b.relation_count, 0) > 0
              THEN '最多 ' || CAST(b.relation_count AS TEXT) || ' 次'
              ELSE '' END AS subtitle,
            a.start_time,
            CASE WHEN b.end_time IS NOT NULL THEN b.end_time
              ELSE a.end_time END AS end_time
          FROM campaign_freegacha AS a
          LEFT JOIN campaign_freegacha AS b ON a.campaign_id = b.relation_id
          WHERE a.freegacha_10 = 1
          ORDER BY a.start_time DESC LIMIT 10
        ''',
      );
    }

    if (tables.contains('clan_battle_schedule')) {
      await _appendScheduleRows(
        events,
        type: ScheduleEventType.clanBattle,
        utcOffsetHours: utcOffsetHours,
        sql: '''
          SELECT CAST(clan_battle_id AS TEXT) AS event_key,
            CAST(release_month AS TEXT) || '月公会战' AS title,
            '第 ' || CAST(clan_battle_id AS TEXT) || ' 期' AS subtitle,
            start_time,
            start_time AS end_time
          FROM clan_battle_schedule
          ORDER BY clan_battle_id DESC LIMIT 5
        ''',
      );
    }

    final uniqueEvents = <String, GameScheduleEvent>{};
    for (final event in events) {
      uniqueEvents['${event.type.index}:${event.id}:${event.startTime.microsecondsSinceEpoch}'] =
          event;
    }
    return uniqueEvents.values.toList(growable: false);
  }

  @override
  int get schemaVersion => 1;

  Future<List<int>> getR6Units() async {
    final query = select(rarity6QuestData, distinct: true);
    final result = await query.get();
    return result.map((e) => e.unitId).toList();
  }

  Future<List<int>> getExUnitsList() async {
    final query = select(redeemUnit, distinct: true);
    final result = await query.get();
    return result.map((e) => e.unitId).toList();
  }

  Future<UnitDataData> getUnitData(int unitId) =>
      (select(unitData)..where((t) => t.unitId.equals(unitId))).getSingle();

  Future<List<UnitDataData>> getUnitsData({
    UnitRankType? type,
    int? limit,
    bool? isDesc,
    UnitSearchData? searchData,
  }) {
    var sql =
        select(unitData).join([
            innerJoin(
              unitProfile,
              unitProfile.unitId.equalsExp(unitData.unitId),
            ),
            innerJoin(unitTalent, unitTalent.unitId.equalsExp(unitData.unitId)),
          ])
          ..where(unitData.searchAreaWidth.isBiggerThanValue(0))
          ..where(unitData.unitId.isSmallerThanValue(maxUnitId));

    final orderMode = isDesc == null || isDesc == true
        ? OrderingMode.desc
        : OrderingMode.asc;
    switch (type) {
      case UnitRankType.lastUpdate:
        sql = sql
          ..orderBy([
            OrderingTerm(expression: unitData.startTime, mode: orderMode),
          ]);
      case UnitRankType.unitId:
        sql = sql
          ..orderBy([
            OrderingTerm(expression: unitData.unitId, mode: orderMode),
          ]);
      case UnitRankType.age:
        sql = sql
          ..orderBy([
            OrderingTerm(
              expression: unitProfile.age.cast<int>(),
              mode: orderMode,
            ),
          ]);
      case UnitRankType.height:
        sql = sql
          ..orderBy([
            OrderingTerm(
              expression: unitProfile.height.cast<int>(),
              mode: orderMode,
            ),
          ]);
      case UnitRankType.weight:
        sql = sql
          ..orderBy([
            OrderingTerm(
              expression: unitProfile.weight.cast<int>(),
              mode: orderMode,
            ),
          ]);
      case UnitRankType.birthDay:
        sql = sql
          ..orderBy([
            OrderingTerm(
              expression: unitProfile.birthMonth.cast<int>(),
              mode: orderMode,
            ),
            OrderingTerm(
              expression: unitProfile.birthDay.cast<int>(),
              mode: orderMode,
            ),
          ]);
      case UnitRankType.searchAreaWidth:
        sql = sql
          ..orderBy([
            OrderingTerm(expression: unitData.searchAreaWidth, mode: orderMode),
          ]);
      case null:
        break;
    }
    if (limit != null && limit > 0) {
      sql = sql..limit(limit);
    }
    if (searchData != null) {
      if (searchData.unitId != null) {
        final inputId = searchData.unitId!;
        final idString = inputId.toString();
        if (idString.length == 4) {
          // 4位数：后面加01
          sql = sql..where(unitData.unitId.equals(int.parse('${idString}01')));
        } else if (idString.length > 4) {
          sql = sql..where(unitData.unitId.equals(inputId));
        } else {
          // 小于4位数：生成两个数字，一个补0到四位数，一个补9
          final startId = int.parse(idString.padRight(4, '0')) * 100 + 1;
          final endId = int.parse(idString.padRight(4, '9')) * 100 + 1;
          sql = sql
            ..where(
              unitData.unitId.isBetween(Constant(startId), Constant(endId)),
            );
        }
      }
      if (searchData.unitName != null && searchData.unitName!.isNotEmpty) {
        sql = sql..where(unitData.unitName.like('%${searchData.unitName!}%'));
      }
      if (searchData.searchAreaWidth != null) {
        final range = searchData.searchAreaWidth!.range;
        sql = sql
          ..where(
            unitData.searchAreaWidth.isBetween(
              Constant(range.$1),
              Constant(range.$2),
            ),
          );
      }
      if (searchData.atkType != null) {
        sql = sql..where(unitData.atkType.equals(searchData.atkType!.value));
      }
      if (searchData.isR6 != null) {
        if (searchData.isR6 == true) {
          sql = sql..where(unitData.unitId.isIn(r6Units));
        } else {
          sql = sql..where(unitData.unitId.isNotIn(r6Units));
        }
      }
      if (searchData.hasUnique1 == true) {
        sql = sql..where(unitData.unitId.isIn(unique1Units));
      }

      if (searchData.hasUnique2 == true) {
        sql = sql..where(unitData.unitId.isIn(unique2Units));
      }
      if (searchData.talent != null) {
        sql = sql..where(unitTalent.talentId.equals(searchData.talent!.value));
      }
    }
    return sql.get().then(
      (rows) => rows.map((row) => row.readTable(unitData)).toList(),
    );
  }

  Future<UnitInfo?> getUnitInfo(int unitId) async {
    final u = unitProfile; // 表 getter：unit_profile
    final d = unitData; // 表 getter：unit_data
    final a = actualUnitBackground; // 表 getter：actual_unit_background
    final t = unitTalent; // 表 getter：unit_talent
    final limitTypeExpr =
        CaseWhenExpression(
              cases: [
                CaseWhen(d.isLimited.equals(0), then: Constant(1)),
                CaseWhen(
                  d.isLimited.equals(1) & d.rarity.equals(3),
                  then: Constant(2),
                ),
                CaseWhen(
                  d.isLimited.equals(1) & d.rarity.equals(1),
                  then: Constant(3),
                ),
                CaseWhen(d.isLimited.equals(1), then: Constant(4)),
              ],
              orElse: const Constant(0),
            )
            as Expression<int>;
    final join = selectOnly(u)
      ..addColumns([
        u.unitId, // 0
        d.unitName, // 1
        d.kana, // 2
        d.rarity, // 3
        u.age, // 4  (TEXT, Dart里转int)
        u.guild, // 5
        u.race, // 6
        u.voice, // 7
        u.bloodType, // 8
        u.favorite, // 9
        u.catchCopy, // 10
        u.selfText, // 11
        u.height, // 12 (TEXT->int)
        u.weight, // 13 (TEXT->int)
        u.birthMonth, // 14 (TEXT->int)
        u.birthDay, // 15 (TEXT->int)
        d.searchAreaWidth, // 16
        d.atkType, // 17
        d.comment, // 18
        d.startTime, // 19
        a.unitName, // 20
        d.cutin1Star6, // 21
        limitTypeExpr, // 22
        d.normalAtkCastTime, // 23
        t.talentId, // 24
      ])
      ..join([
        leftOuterJoin(d, d.unitId.equalsExp(u.unitId)),
        leftOuterJoin(
          a,
          ((a.unitId - d.unitId).abs().isSmallerThan(Constant(100))),
        ),
        leftOuterJoin(t, t.unitId.equalsExp(u.unitId)),
      ])
      ..where(d.unitId.equals(unitId))
      ..limit(1);

    final row = await join.getSingleOrNull();
    if (row == null) return null;
    final roleId = await getUnitRoleId(unitId);

    final info = UnitInfo(
      unitId: row.read(u.unitId)!,
      unitName: row.read(d.unitName) ?? '', // 某些库名字来自 UnitData
      kana: row.read(d.kana) ?? '',
      rarity: row.read(d.rarity),
      ageInt: _toIntOrNull(row.read(u.age)),
      guild: row.read(u.guild),
      race: row.read(u.race),
      voice: row.read(u.voice),
      bloodType: row.read(u.bloodType),
      favorite: row.read(u.favorite),
      catchCopy: row.read(u.catchCopy),
      selfText: row.read(u.selfText),
      heightInt: _toIntOrNull(row.read(u.height)),
      weightInt: _toIntOrNull(row.read(u.weight)),
      birthMonthInt: _toIntOrNull(row.read(u.birthMonth)),
      birthDayInt: _toIntOrNull(row.read(u.birthDay)),
      searchAreaWidth: row.read(d.searchAreaWidth),
      atkType: row.read(d.atkType),
      intro: row.read(d.comment) ?? '......',
      unitStartTime: row.read(d.startTime) ?? '2015/04/01',
      actualName: row.read(a.unitName) ?? '',
      cutin1Star6: row.read(d.cutin1Star6),
      limitType: row.read(limitTypeExpr),
      normalAtkCastTime: row.read(d.normalAtkCastTime) ?? 0.0,
      talentId: row.read(t.talentId) ?? 0,
      unitRoleId: roleId,
    );

    if (kannaIds.contains(info.unitId)) {
      info.limitType = 2;
    } else if (exCharacter.contains(info.unitId)) {
      info.limitType = 4;
    }

    return info;
  }

  Future<int> getUnitRoleId(int unitId) async {
    if (!(await _databaseTables()).contains('unit_role_data')) return 0;
    final row = await customSelect(
      'SELECT unit_role_id FROM unit_role_data WHERE unit_id = ? LIMIT 1',
      variables: [Variable<int>(unitId)],
    ).getSingleOrNull();
    return row?.read<int>('unit_role_id') ?? 0;
  }

  // ORM：按 id 查询
  Future<UnitProfileData?> getUnitById(int id) => (select(
    unitProfile,
  )..where((t) => t.unitId.equals(id))).getSingleOrNull();

  Future<int> getMaxUniqueEquipLv(int slot) async {
    final maxExpr = uniqueEquipmentEnhanceData.enhanceLevel.max();

    final query = selectOnly(uniqueEquipmentEnhanceData)
      ..addColumns([maxExpr])
      ..where(uniqueEquipmentEnhanceData.equipSlot.equals(slot));

    final row = await query.getSingleOrNull();

    final maxValue = row?.read(maxExpr);

    return maxValue ?? 1;
  }

  Future<UnitSkillDataData?> getUnitSkills(int unitId) => (select(
    unitSkillData,
  )..where((t) => t.unitId.equals(unitId))).getSingleOrNull();

  Future<SkillDataData?> getSkill(int skillId) => (select(
    skillData,
  )..where((t) => t.skillId.equals(skillId))).getSingleOrNull();

  Future<List<SkillActionInfo>> getSkillActions(
    List<int> actionIds, {
    bool isRfSkill = true,
    bool isOtherRfSkill = true,
  }) async {
    final validActionIds = actionIds.where((id) => id != 0).toList();
    if (validActionIds.isEmpty) return [];
    final query =
        select(skillAction).join([
            leftOuterJoin(
              ailmentData,
              (skillAction.actionType.equalsExp(ailmentData.ailmentAction) &
                  ((skillAction.actionDetail1.equalsExp(
                        ailmentData.ailmentDetail1,
                      )) |
                      ailmentData.ailmentDetail1.equals(-1))),
            ),
          ])
          ..where(skillAction.actionId.isIn(validActionIds.toSet().toList()))
          ..addColumns([ailmentData.ailmentName]);

    final result = await query.get();

    final actions = result.map((row) {
      final sa = row.readTable(skillAction);
      return SkillActionInfo(
        actionId: sa.actionId,
        classId: sa.classId,
        actionType: sa.actionType,
        actionDetail1: sa.actionDetail1,
        actionDetail2: sa.actionDetail2,
        actionDetail3: sa.actionDetail3,
        actionValue1: sa.actionValue1,
        actionValue2: sa.actionValue2,
        actionValue3: sa.actionValue3,
        actionValue4: sa.actionValue4,
        actionValue5: sa.actionValue5,
        actionValue6: sa.actionValue6,
        actionValue7: sa.actionValue7,
        targetAssignment: sa.targetAssignment,
        targetArea: sa.targetArea,
        targetRange: sa.targetRange,
        targetType: sa.targetType,
        targetNumber: sa.targetNumber,
        targetCount: sa.targetCount,
        ailmentName: row.read(ailmentData.ailmentName) ?? '',
        isRfSkill: isRfSkill,
        isOtherRfSkill: isOtherRfSkill,
        description: sa.description,
        levelUpDisp: sa.levelUpDisp,
      );
    });
    final actionById = {for (final action in actions) action.actionId: action};

    // SQLite does not preserve the order of values in an IN expression. Skill
    // action dependencies refer to their declared order, so restore it here.
    return [
      for (final actionId in validActionIds)
        if (actionById[actionId] case final action?) action,
    ];
  }

  Future<List<UnitAttackPatternData>> getAttackPattern(int unitId) async {
    final query = select(unitAttackPattern)
      ..where((t) => t.unitId.equals(unitId));
    return query.get();
  }

  Future<SpSkillLabelDataData?> getSpSkillLabel(int unitId) => (select(
    spSkillLabelData,
  )..where((t) => t.unitId.equals(unitId))).getSingleOrNull();

  Future<UnitSkillDataRFData?> getRfSkillId(int skillId) async {
    final query = select(unitSkillDataRF)
      ..where((t) => t.skillId.equals(skillId));
    return query.getSingleOrNull();
  }

  Future<List<UnitUniqueEquipmentData>> getallUniqueEquip({
    int slot = 1,
  }) async {
    return (select(unitUniqueEquipment)
          ..where(
            (t) => CustomExpression<int>(
              '${unitUniqueEquipment.tableName}.${unitUniqueEquipment.equipId.name} % 10',
            ).equals(slot),
          )
          ..orderBy([
            (t) => OrderingTerm(expression: t.equipId, mode: OrderingMode.desc),
          ]))
        .get();
  }

  Future<List<UniqueEquipListItem>> getUniqueEquipList({
    String search = '',
    int slot = 0,
    int unitId = 0,
  }) async {
    final keyword = '%${search.trim()}%';
    final rows = await customSelect(
      '''
      SELECT
        ued.equipment_id,
        COALESCE(ued.equipment_name, '') AS equipment_name,
        COALESCE(ued.description, '') AS description,
        ud.unit_id,
        COALESCE(ud.unit_name, '') AS unit_name,
        uue.equip_slot,
        COALESCE(ud.search_area_width, 0) AS search_area_width,
        COALESCE(ud.atk_type, 0) AS atk_type,
        CASE
          WHEN ud.is_limited = 0 THEN 1
          WHEN ud.rarity = 3 THEN 2
          WHEN ud.rarity = 1 THEN 3
          ELSE 4
        END AS limit_type,
        COALESCE(ut.talent_id, 0) AS talent_id,
        COALESCE(ur.unit_role_id, 0) AS role_id
      FROM unit_unique_equipment AS uue
      INNER JOIN unit_data AS ud ON ud.unit_id = uue.unit_id
      INNER JOIN unique_equipment_data AS ued
        ON ued.equipment_id = uue.equip_id
      LEFT JOIN unit_talent AS ut ON ut.unit_id = ud.unit_id
      LEFT JOIN unit_role_data AS ur ON ur.unit_id = ud.unit_id
      WHERE (? = '%%' OR ued.equipment_name LIKE ? OR ud.unit_name LIKE ?)
        AND (? = 0 OR uue.equip_slot = ?)
        AND (? = 0 OR ud.unit_id = ?)
      ORDER BY uue.equip_slot DESC, ued.equipment_id DESC
      ''',
      variables: [
        Variable<String>(keyword),
        Variable<String>(keyword),
        Variable<String>(keyword),
        Variable<int>(slot),
        Variable<int>(slot),
        Variable<int>(unitId),
        Variable<int>(unitId),
      ],
    ).get();

    return rows
        .map(
          (row) => UniqueEquipListItem(
            equipmentId: row.read<int>('equipment_id'),
            equipmentName: row.read<String>('equipment_name'),
            description: row.read<String>('description'),
            unitId: row.read<int>('unit_id'),
            unitName: row.read<String>('unit_name'),
            equipSlot: row.read<int>('equip_slot'),
            searchAreaWidth: row.read<int>('search_area_width'),
            atkType: row.read<int>('atk_type'),
            limitType: row.read<int>('limit_type'),
            talentId: row.read<int>('talent_id'),
            roleId: row.read<int>('role_id'),
          ),
        )
        .toList(growable: false);
  }

  Future<List<DeepZoneQuest>> getDeepZoneQuests(int talentId) async {
    final rows = await customSelect(
      '''
      WITH rewards AS (
        SELECT
          q.quest_id % 1000 AS stage_no,
          MAX(reward.reward_num_2) AS stellar_shard_count,
          MAX(reward.reward_num_3) AS crystal_ball_count
        FROM talent_quest_data AS q
        INNER JOIN talent_quest_clear_reward_01 AS reward
          ON reward.reward_group_id = q.clear_reward_group
        GROUP BY q.quest_id % 1000
      )
      SELECT
        quest.quest_id,
        quest.area_id / 1000 % 10 AS talent_id,
        COALESCE(quest.quest_name, '') AS quest_name,
        COALESCE(rewards.stellar_shard_count, 0) AS stellar_shard_count,
        COALESCE(rewards.crystal_ball_count, 0) AS crystal_ball_count,
        COALESCE(wave.enemy_id_1, 0) AS enemy_id_1,
        COALESCE(enemy_1.unit_id, 0) AS unit_id_1,
        COALESCE(wave.enemy_id_2, 0) AS enemy_id_2,
        COALESCE(enemy_2.unit_id, 0) AS unit_id_2,
        COALESCE(wave.enemy_id_3, 0) AS enemy_id_3,
        COALESCE(enemy_3.unit_id, 0) AS unit_id_3,
        COALESCE(wave.enemy_id_4, 0) AS enemy_id_4,
        COALESCE(enemy_4.unit_id, 0) AS unit_id_4,
        COALESCE(wave.enemy_id_5, 0) AS enemy_id_5,
        COALESCE(enemy_5.unit_id, 0) AS unit_id_5
      FROM talent_quest_data AS quest
      LEFT JOIN rewards ON rewards.stage_no = quest.quest_id % 1000
      LEFT JOIN talent_quest_wave_group_data AS wave
        ON wave.wave_group_id = quest.wave_group_id_1
      LEFT JOIN talent_quest_enemy_parameter AS enemy_1
        ON enemy_1.enemy_id = wave.enemy_id_1
      LEFT JOIN talent_quest_enemy_parameter AS enemy_2
        ON enemy_2.enemy_id = wave.enemy_id_2
      LEFT JOIN talent_quest_enemy_parameter AS enemy_3
        ON enemy_3.enemy_id = wave.enemy_id_3
      LEFT JOIN talent_quest_enemy_parameter AS enemy_4
        ON enemy_4.enemy_id = wave.enemy_id_4
      LEFT JOIN talent_quest_enemy_parameter AS enemy_5
        ON enemy_5.enemy_id = wave.enemy_id_5
      WHERE quest.area_id / 1000 % 10 = ?
      ORDER BY quest.quest_id DESC
      ''',
      variables: [Variable<int>(talentId)],
    ).get();

    return rows
        .map((row) {
          final enemies = <DeepZoneEnemy>[];
          for (var index = 1; index <= 5; index++) {
            final enemyId = row.read<int>('enemy_id_$index');
            final unitId = row.read<int>('unit_id_$index');
            if (enemyId != 0 && unitId != 0) {
              enemies.add(DeepZoneEnemy(enemyId: enemyId, unitId: unitId));
            }
          }
          return DeepZoneQuest(
            questId: row.read<int>('quest_id'),
            talentId: row.read<int>('talent_id'),
            questName: row.read<String>('quest_name'),
            stellarShardCount: row.read<int>('stellar_shard_count'),
            crystalBallCount: row.read<int>('crystal_ball_count'),
            enemies: enemies,
          );
        })
        .toList(growable: false);
  }

  Future<List<UnitSummary>> searchBondUnits(String search) async {
    final query = search.trim();
    final keyword = '%$query%';
    final idPrefix = '$query%';
    final rows = await customSelect(
      '''
      SELECT ud.unit_id, ud.unit_name
      FROM unit_data AS ud
      WHERE ud.search_area_width > 0
        AND ud.unit_id < $maxUnitId
        AND EXISTS (
          SELECT 1 FROM chara_identity AS ci WHERE ci.unit_id = ud.unit_id
        )
        AND (
          ? = ''
          OR ud.unit_name LIKE ?
          OR CAST(ud.unit_id AS TEXT) LIKE ?
        )
      ORDER BY ud.start_time DESC, ud.unit_id DESC
      LIMIT 80
      ''',
      variables: [
        Variable<String>(query),
        Variable<String>(keyword),
        Variable<String>(idPrefix),
      ],
    ).get();

    return rows
        .map(
          (row) => UnitSummary(
            unitId: row.read<int>('unit_id'),
            unitName: row.read<String>('unit_name'),
          ),
        )
        .toList(growable: false);
  }

  Future<List<CharacterBondStory>> getCharacterBondStories(int unitId) async {
    final rows = await customSelect(
      '''
      SELECT DISTINCT
        css.story_id,
        COALESCE(NULLIF(sd.title, ''), css.unlock_story_name, '') AS title,
        COALESCE(sd.sub_title, '') AS sub_title,
        css.status_type_1,
        css.status_rate_1,
        css.status_type_2,
        css.status_rate_2,
        css.status_type_3,
        css.status_rate_3,
        css.status_type_4,
        css.status_rate_4,
        css.status_type_5,
        css.status_rate_5
      FROM chara_story_status AS css
      INNER JOIN chara_identity AS ci
        ON CAST(ci.unit_id / 100 AS INTEGER) IN (
          css.chara_id_1, css.chara_id_2, css.chara_id_3,
          css.chara_id_4, css.chara_id_5, css.chara_id_6,
          css.chara_id_7, css.chara_id_8, css.chara_id_9,
          css.chara_id_10, css.chara_id_11, css.chara_id_12,
          css.chara_id_13, css.chara_id_14, css.chara_id_15,
          css.chara_id_16, css.chara_id_17, css.chara_id_18,
          css.chara_id_19, css.chara_id_20
        )
      LEFT JOIN story_detail AS sd ON sd.story_id = css.story_id
      WHERE ci.unit_id = ?
      ORDER BY css.story_id
      ''',
      variables: [Variable<int>(unitId)],
    ).get();

    return rows
        .map((row) {
          final bonuses = <CharacterBondBonus>[];
          for (var index = 1; index <= 5; index++) {
            final type = row.read<int>('status_type_$index');
            final value = row.read<int>('status_rate_$index');
            if (type > 0 && value != 0) {
              bonuses.add(CharacterBondBonus(type: type, value: value));
            }
          }
          return CharacterBondStory(
            storyId: row.read<int>('story_id'),
            title: row.read<String>('title'),
            subTitle: row.read<String>('sub_title'),
            bonuses: bonuses,
          );
        })
        .toList(growable: false);
  }

  Future<UniqueEquipInfo?> getUniqueEquipInfo(
    int unitId, {
    int lv = 1,
    int slot = 1,
  }) async {
    final lvOffset = lv - 1.0;
    final lvVar = Variable.withReal(lvOffset);

    // 别名简化
    final a = uniqueEquipmentData; // unique_equipment_data
    final b = uniqueEquipEnhanceRate; // unique_equip_enhance_rate
    final uu = unitUniqueEquipment; // unit_unique_equipment
    final ue = unitUniqueEquip; // unit_unique_equip

    // 构建 SELECT（只从 a 出发，左连 b/uu/ue）
    final query = selectOnly(a, distinct: true)
      ..join([
        leftOuterJoin(b, b.equipmentId.equalsExp(a.equipmentId)),
        // 两个“拥有关系”的表都左连到 a.equipment_id 上，
        // 下面 where 用 (uu.unit_id = unitId OR ue.unit_id = unitId) 来覆盖原 SQL 的 UNION 逻辑
        leftOuterJoin(uu, uu.equipId.equalsExp(a.equipmentId)),
        leftOuterJoin(ue, ue.equipId.equalsExp(a.equipmentId)),
      ])
      ..where(
        // (uu.unit_id == unitId) OR (ue.unit_id == unitId)
        uu.unitId.equals(unitId) | ue.unitId.equals(unitId),
      )
      ..where(
        // b.min_lv <= 2
        b.minLv.isSmallerOrEqualValue(2),
      )
      ..where(
        CustomExpression<int>(
          '${a.tableName}.${a.equipmentId.name} % 10',
        ).equals(slot),
      );

    query.addColumns([uu.unitId, ue.unitId]);

    // 基本信息
    query.addColumns([a.equipmentId, a.equipmentName, a.description]);

    // 定义一个小工具：c = base + rate * lvOffset
    Expression<double> scaled(RealColumn base, RealColumn rate) =>
        base + rate * lvVar;

    final hp = scaled(a.hp, b.hp);
    final atk = scaled(a.atk, b.atk);
    final magicStr = scaled(a.magicStr, b.magicStr);
    final def = scaled(a.def_, b.def_);
    final magicDef = scaled(a.magicDef, b.magicDef);
    final physicalCritical = scaled(a.physicalCritical, b.physicalCritical);
    final magicCritical = scaled(a.magicCritical, b.magicCritical);
    final waveHpRecovery = scaled(a.waveHpRecovery, b.waveHpRecovery);
    final waveEnergyRecovery = scaled(
      a.waveEnergyRecovery,
      b.waveEnergyRecovery,
    );
    final dodge = scaled(a.dodge, b.dodge);
    final physicalPenetrate = scaled(a.physicalPenetrate, b.physicalPenetrate);
    final magicPenetrate = scaled(a.magicPenetrate, b.magicPenetrate);
    final lifeSteal = scaled(a.lifeSteal, b.lifeSteal);
    final hpRecoveryRate = scaled(a.hpRecoveryRate, b.hpRecoveryRate);
    final energyRecoveryRate = scaled(
      a.energyRecoveryRate,
      b.energyRecoveryRate,
    );
    final energyReduceRate = scaled(a.energyReduceRate, b.energyReduceRate);
    final accuracy = scaled(a.accuracy, b.accuracy);

    // 加入这些表达式列
    query.addColumns([
      hp,
      atk,
      magicStr,
      def,
      magicDef,
      physicalCritical,
      magicCritical,
      waveHpRecovery,
      waveEnergyRecovery,
      dodge,
      physicalPenetrate,
      magicPenetrate,
      lifeSteal,
      hpRecoveryRate,
      energyRecoveryRate,
      energyReduceRate,
      accuracy,
    ]);

    // 读取一行
    final row = await query.getSingleOrNull();
    if (row == null) return null;

    // 组装 unit_id：优先 uu.unit_id，否则 ue.unit_id
    final unitIdFromUu = row.read(uu.unitId);
    final unitIdFromUe = row.read(ue.unitId);
    final pickedUnitId = unitIdFromUu ?? unitIdFromUe;

    return UniqueEquipInfo(
      unitId: pickedUnitId ?? unitId, // 冗余兜底
      equipmentId: row.read(a.equipmentId) ?? 0,
      equipmentName: row.read(a.equipmentName) ?? '',
      description: row.read(a.description) ?? '',
      hp: row.read(hp) ?? 0,
      atk: row.read(atk) ?? 0,
      magicStr: row.read(magicStr) ?? 0,
      def_: row.read(def) ?? 0,
      magicDef: row.read(magicDef) ?? 0,
      physicalCritical: row.read(physicalCritical) ?? 0,
      magicCritical: row.read(magicCritical) ?? 0,
      waveHpRecovery: row.read(waveHpRecovery) ?? 0,
      waveEnergyRecovery: row.read(waveEnergyRecovery) ?? 0,
      dodge: row.read(dodge) ?? 0,
      physicalPenetrate: row.read(physicalPenetrate) ?? 0,
      magicPenetrate: row.read(magicPenetrate) ?? 0,
      lifeSteal: row.read(lifeSteal) ?? 0,
      hpRecoveryRate: row.read(hpRecoveryRate) ?? 0,
      energyRecoveryRate: row.read(energyRecoveryRate) ?? 0,
      energyReduceRate: row.read(energyReduceRate) ?? 0,
      accuracy: row.read(accuracy) ?? 0,
      isTpLimitAction: 0, // 原 SQL 常量 0
    );
  }

  Future<UnitEnemyDataData?> getEnemyData(int unitId) async {
    return (select(
      unitEnemyData,
    )..where((t) => t.unitId.equals(unitId))).map((e) => e).getSingleOrNull();
  }

  Future<EnemyWeaknessInfo?> getEnemyTalentWeakness(int enemyId) async {
    final row =
        select(talentWeakness).join([
            leftOuterJoin(
              enemyTalentWeakness,
              enemyTalentWeakness.resistId.equalsExp(talentWeakness.resistId),
            ),
          ])
          ..addColumns([enemyTalentWeakness.enemyId])
          ..where(enemyTalentWeakness.enemyId.equals(enemyId))
          ..limit(1);
    final result = await row.getSingleOrNull();
    if (result == null) return null;
    final tw = result.readTable(talentWeakness);
    return EnemyWeaknessInfo(
      enemyId: result.read(enemyTalentWeakness.enemyId) ?? enemyId,
      resistId: tw.resistId,
      talent1: tw.talent1,
      talent2: tw.talent2,
      talent3: tw.talent3,
      talent4: tw.talent4,
      talent5: tw.talent5,
    );
  }

  Future<EnemyParameterData?> getEnemyParameters(int enemyId) async {
    return (select(
      enemyParameter,
    )..where((t) => t.enemyId.equals(enemyId))).getSingleOrNull();
  }

  Future<EnemyParameterData?> getEnemyParameter(int enemyId) async {
    return (select(
      enemyParameter,
    )..where((t) => t.enemyId.equals(enemyId))).map((e) => e).getSingleOrNull();
  }

  Future<EventEnemyParameterData?> getEventEnemyParameter(int enemyId) async {
    return (select(
      eventEnemyParameter,
    )..where((t) => t.enemyId.equals(enemyId))).map((e) => e).getSingleOrNull();
  }

  Future<TalentQuestEnemyParameterData?> getTalentQuestEnemyParameter(
    int enemyId,
  ) async {
    return (select(
      talentQuestEnemyParameter,
    )..where((t) => t.enemyId.equals(enemyId))).map((e) => e).getSingleOrNull();
  }

  Future<ShioriEnemyParameterData?> getShioriEnemyParameter(int enemyId) async {
    return (select(
      shioriEnemyParameter,
    )..where((t) => t.enemyId.equals(enemyId))).map((e) => e).getSingleOrNull();
  }

  Future<SreEnemyParameterData?> getSreEnemyParameter(int enemyId) async {
    return (select(
      sreEnemyParameter,
    )..where((t) => t.enemyId.equals(enemyId))).map((e) => e).getSingleOrNull();
  }

  Future<TowerEnemyParameterData?> getTowerEnemyParameter(int enemyId) async {
    return (select(
      towerEnemyParameter,
    )..where((t) => t.enemyId.equals(enemyId))).map((e) => e).getSingleOrNull();
  }

  Future<SevenEnemyParameterData?> getSevenEnemyParameter(int enemyId) async {
    return (select(
      sevenEnemyParameter,
    )..where((t) => t.enemyId.equals(enemyId))).map((e) => e).getSingleOrNull();
  }

  Future<Map<String, Object?>?> getSekaiEnemyParameter(int enemyId) async {
    if (!(await _databaseTables()).contains('sekai_enemy_parameter')) {
      return null;
    }
    final row = await customSelect(
      'SELECT * FROM sekai_enemy_parameter WHERE sekai_enemy_id = ?',
      variables: [Variable<int>(enemyId)],
    ).getSingleOrNull();
    return row?.data;
  }

  /// Searches every enemy-parameter source available in the downloaded DB.
  /// Missing regional tables and columns are handled at runtime so a database
  /// from one server does not prevent the remaining sources from being used.
  Future<List<EnemySearchResult>> searchEnemyParameters({
    required String search,
    EnemyType type = EnemyType.all,
    bool searchById = false,
    bool ascending = false,
  }) async {
    final query = search.trim();
    if (query.isEmpty || type == EnemyType.clan) return const [];

    final databaseTables = await _databaseTables();
    final sources = type == EnemyType.all
        ? _enemyParameterTables.entries
        : _enemyParameterTables.entries.where((entry) => entry.key == type);
    final selects = <String>[];
    final variables = <Variable<Object>>[];

    for (final source in sources) {
      final definition = source.value;
      if (!databaseTables.contains(definition.tableName)) continue;
      final columns = await _tableColumns(definition.tableName);
      if (!columns.contains(definition.idColumn) ||
          !columns.contains('unit_id')) {
        continue;
      }

      final parameterName = columns.contains('name')
          ? "NULLIF(p.name, '')"
          : 'NULL';
      final nameExpression =
          "COALESCE($parameterName, NULLIF(u.unit_name, ''), '')";
      final levelExpression = columns.contains('level') ? 'p.level' : '0';
      final hpExpression = columns.contains('hp') ? 'p.hp' : '0';
      final whereExpression = searchById
          ? '''
            instr(CAST(p.${definition.idColumn} AS TEXT), ?) > 0
            OR instr(CAST(p.unit_id AS TEXT), ?) > 0
          '''
          : '''
            instr(lower($nameExpression), lower(?)) > 0
            OR instr(CAST(p.${definition.idColumn} AS TEXT), ?) > 0
            OR instr(CAST(p.unit_id AS TEXT), ?) > 0
          ''';

      selects.add('''
        SELECT
          p.${definition.idColumn} AS enemy_id,
          p.unit_id AS unit_id,
          $nameExpression AS name,
          $levelExpression AS level,
          $hpExpression AS hp,
          '${source.key.name}' AS source_type
        FROM ${definition.tableName} AS p
        LEFT JOIN unit_enemy_data AS u ON u.unit_id = p.unit_id
        WHERE $whereExpression
      ''');
      variables.add(Variable<String>(query));
      variables.add(Variable<String>(query));
      if (!searchById) variables.add(Variable<String>(query));
    }

    if (selects.isEmpty) return const [];
    final direction = ascending ? 'ASC' : 'DESC';
    final rows = await customSelect('''
      SELECT * FROM (${selects.join(' UNION ALL ')})
      ORDER BY enemy_id $direction, source_type ASC
      ''', variables: variables).get();

    return rows
        .map(
          (row) => EnemySearchResult(
            enemyId: row.read<int>('enemy_id'),
            unitId: row.read<int>('unit_id'),
            name: row.read<String>('name'),
            level: row.read<int>('level'),
            hp: row.read<int>('hp'),
            type: EnemyType.values.byName(row.read<String>('source_type')),
          ),
        )
        .toList(growable: false);
  }

  Future<EnemyMPart?> getEnemyMParts(int enemyId) async {
    return (select(
      enemyMParts,
    )..where((t) => t.enemyId.equals(enemyId))).map((e) => e).getSingleOrNull();
  }

  Future<List<ClanBattleData>> getClanBattles({
    int? clanBattleId,
    int limit = 12,
  }) async {
    final idFilter = clanBattleId == null ? '' : 'AND m.clan_battle_id = ?';
    final variables = <Variable<Object>>[
      if (clanBattleId != null) Variable<int>(clanBattleId),
      Variable<int>(limit),
    ];
    final rows = await customSelect(
      '''
      WITH valid_maps AS (
        SELECT m.*
        FROM clan_battle_2_map_data m
        JOIN clan_battle_schedule s
          ON s.clan_battle_id = m.clan_battle_id
        WHERE (m.lap_num_from > 1 OR m.clan_battle_id < 1011)
          AND s.release_month IS NOT NULL
          $idFilter
      )
      SELECT
        m.clan_battle_id,
        s.release_month,
        s.start_time,
        s.end_time,
        MIN(m.phase) AS min_phase,
        MAX(m.phase) AS max_phase
      FROM valid_maps m
      JOIN clan_battle_schedule s
        ON s.clan_battle_id = m.clan_battle_id
      GROUP BY m.clan_battle_id
      ORDER BY m.clan_battle_id DESC, m.lap_num_from
      LIMIT ?
      ''',
      variables: variables,
      readsFrom: {clanBattle2MapData, clanBattleSchedule},
    ).get();

    return rows.map((row) {
      final data = row.data;
      return ClanBattleData(
        clanBattleId: (data['clan_battle_id'] as num).toInt(),
        releaseMonth: (data['release_month'] as num).toInt(),
        startTime: data['start_time'] as String,
        endTime: data['end_time'] as String?,
        minPhase: (data['min_phase'] as num).toInt(),
        maxPhase: (data['max_phase'] as num).toInt(),
      );
    }).toList();
  }

  Future<List<ClanBattlePhaseData>> getClanBattlePhases(
    int clanBattleId,
  ) async {
    final rows = await customSelect(
      '''
      WITH phase_maps AS (
        SELECT
          phase,
          MIN(CASE WHEN lap_num_from >= 1 THEN lap_num_from ELSE 1 END)
            AS lap_from,
          CASE WHEN MIN(lap_num_to) = -1 THEN -1 ELSE MAX(lap_num_to) END
            AS lap_to,
          MIN(wave_group_id_1) AS wave_1,
          MIN(wave_group_id_2) AS wave_2,
          MIN(wave_group_id_3) AS wave_3,
          MIN(wave_group_id_4) AS wave_4,
          MIN(wave_group_id_5) AS wave_5
        FROM clan_battle_2_map_data
        WHERE clan_battle_id = ?
          AND (lap_num_from >= 1 OR clan_battle_id < 1011)
        GROUP BY phase
      ), bosses AS (
        SELECT phase, lap_from, lap_to, 1 AS boss_index, wave_1 AS wave_id
          FROM phase_maps
        UNION ALL SELECT phase, lap_from, lap_to, 2, wave_2 FROM phase_maps
        UNION ALL SELECT phase, lap_from, lap_to, 3, wave_3 FROM phase_maps
        UNION ALL SELECT phase, lap_from, lap_to, 4, wave_4 FROM phase_maps
        UNION ALL SELECT phase, lap_from, lap_to, 5, wave_5 FROM phase_maps
      )
      SELECT
        b.phase,
        b.lap_from,
        b.lap_to,
        b.boss_index,
        w.enemy_id_1 AS enemy_id,
        e.unit_id,
        e.name,
        e.hp
      FROM bosses b
      JOIN wave_group_data w ON w.wave_group_id = b.wave_id
      JOIN enemy_parameter e ON e.enemy_id = w.enemy_id_1
      ORDER BY b.phase, b.boss_index
      ''',
      variables: [Variable<int>(clanBattleId)],
      readsFrom: {clanBattle2MapData, waveGroupData, enemyParameter},
    ).get();

    final bossesByPhase = <int, List<ClanBattleBossData>>{};
    final lapByPhase = <int, (int, int)>{};
    for (final row in rows) {
      final data = row.data;
      final phase = (data['phase'] as num).toInt();
      lapByPhase[phase] = (
        (data['lap_from'] as num).toInt(),
        (data['lap_to'] as num).toInt(),
      );
      bossesByPhase
          .putIfAbsent(phase, () => [])
          .add(
            ClanBattleBossData(
              index: (data['boss_index'] as num).toInt(),
              enemyId: (data['enemy_id'] as num).toInt(),
              unitId: (data['unit_id'] as num).toInt(),
              name: data['name'] as String,
              hp: (data['hp'] as num).toInt(),
            ),
          );
    }

    final phases = bossesByPhase.keys.toList()..sort();
    return [
      for (final phase in phases)
        ClanBattlePhaseData(
          phase: phase,
          lapFrom: lapByPhase[phase]!.$1,
          lapTo: lapByPhase[phase]!.$2,
          bosses: bossesByPhase[phase]!,
        ),
    ];
  }
}
