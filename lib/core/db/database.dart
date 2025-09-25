import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/features/component/base.dart';
import 'dart:io';
import 'model.dart';
import 'table.dart'; // 里面有 class UnitProfile extends Table

part 'database.g.dart';

int _toIntOrNull(String? s) => s == null ? -1 : int.tryParse(s.trim()) ?? -1;
final kannaIds = [170101, 170201];

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
  ],
)
class AppDb extends _$AppDb {
  late List<int> exCharacter; // 可兑换角色列表
  late List<int> r6Units; // 所有 6 星角色列表
  late List<int> unique1Units; // 所有专一1角色列表
  late List<int> unique2Units; // 所有专一2角色列表
  late (int, int) maxUniqueEquipLv; // 最大的专一2等级

  AppDb(String sqliteFile) : super(NativeDatabase(File(sqliteFile)));

  Future<void> init() async {
    exCharacter = await getExUnitsList();
    maxUniqueEquipLv = (
      await getMaxUniqueEquipLv(1),
      await getMaxUniqueEquipLv(2),
    );
    r6Units = await getR6Units();
    unique1Units = (await getallUniqueEquip(slot: 1))
        .map((e) => e.unitId)
        .toSet()
        .toList();
    unique2Units = (await getallUniqueEquip(slot: 2))
        .map((e) => e.unitId)
        .toSet()
        .toList();
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

  Future<List<UnitDataData>> getUnitsData(
      {UnitRankType? type,
      int? limit,
      bool? isDesc,
      UnitSearchData? searchData}) {
    var sql = select(unitData).join([
      innerJoin(
        unlockUnitCondition,
        unlockUnitCondition.unitId.equalsExp(unitData.unitId),
      ),
    ]);

    final orderMode =
        isDesc == null || isDesc == true ? OrderingMode.desc : OrderingMode.asc;
    switch (type) {
      case UnitRankType.lastUpdate:
        sql = sql
          ..orderBy([
            OrderingTerm(
              expression: unitData.startTime,
              mode: orderMode,
            ),
          ]);
      case UnitRankType.unitId:
        sql = sql
          ..orderBy([
            OrderingTerm(
              expression: unitData.unitId,
              mode: orderMode,
            ),
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
            OrderingTerm(
              expression: unitData.searchAreaWidth,
              mode: orderMode,
            ),
          ]);
      case null:
        break;
    }
    if (limit != null && limit > 0) {
      sql = sql..limit(limit);
    }
    if (searchData != null) {
      if (searchData.unitId != null) {
        sql = sql..where(unitData.unitId.equals(searchData.unitId!));
      }
      if (searchData.unitName != null && searchData.unitName!.isNotEmpty) {
        sql = sql..where(unitData.unitName.like('%${searchData.unitName!}%'));
      }
      if (searchData.searchAreaWidth != null) {
        final range = SearchAreaWidthType.getRange(
          searchData.searchAreaWidth!,
        );
        sql = sql
          ..where(unitData.searchAreaWidth
              .isBetween(Constant(range.$1), Constant(range.$2)));
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
    }
    return sql
        .get()
        .then((rows) => rows.map((row) => row.readTable(unitData)).toList());
  }

  Future<UnitInfo?> getUnitInfo(int unitId) async {
    final u = unitProfile; // 表 getter：unit_profile
    final d = unitData; // 表 getter：unit_data
    final a = actualUnitBackground; // 表 getter：actual_unit_background
    final limitTypeExpr = CaseWhenExpression(
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
    ) as Expression<int>;
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
      ])
      ..join([
        leftOuterJoin(d, d.unitId.equalsExp(u.unitId)),
        leftOuterJoin(
          a,
          ((a.unitId - d.unitId).abs().isSmallerThan(Constant(100))),
        ),
      ])
      ..where(d.unitId.equals(unitId))
      ..limit(1);

    final row = await join.getSingleOrNull();
    if (row == null) return null;

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
    );

    if (kannaIds.contains(info.unitId)) {
      info.limitType = 2;
    } else if (exCharacter.contains(info.unitId)) {
      info.limitType = 4;
    }

    return info;
  }

  // ORM：按 id 查询
  Future<UnitProfileData?> getUnitById(int id) =>
      (select(unitProfile)..where((t) => t.unitId.equals(id)))
          .getSingleOrNull();

  Future<int> getMaxUniqueEquipLv(int slot) async {
    final maxExpr = uniqueEquipmentEnhanceData.enhanceLevel.max();

    final query = selectOnly(uniqueEquipmentEnhanceData)
      ..addColumns([maxExpr])
      ..where(uniqueEquipmentEnhanceData.equipSlot.equals(slot));

    final row = await query.getSingleOrNull();

    final maxValue = row?.read(maxExpr);

    return maxValue ?? 1;
  }

  Future<UnitSkillDataData?> getUnitSkills(int unitId) =>
      (select(unitSkillData)..where((t) => t.unitId.equals(unitId)))
          .getSingleOrNull();

  Future<SkillDataData?> getSkill(int skillId) =>
      (select(skillData)..where((t) => t.skillId.equals(skillId)))
          .getSingleOrNull();

  Future<List<SkillActionInfo>> getSkillActions(
    List<int> actionIds, {
    bool isRfSkill = true,
    bool isOtherRfSkill = true,
  }) async {
    if (actionIds.isEmpty) return [];
    final query = select(skillAction).join([
      leftOuterJoin(
        ailmentData,
        (skillAction.actionType.equalsExp(ailmentData.ailmentAction) &
            ((skillAction.actionDetail1.equalsExp(
                  ailmentData.ailmentDetail1,
                )) |
                ailmentData.ailmentDetail1.equals(-1))),
      ),
    ])
      ..where(skillAction.actionId.isIn(actionIds))
      ..addColumns([ailmentData.ailmentName]);

    final result = await query.get();

    return result.map((row) {
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
    }).toList();
  }

  Future<List<UnitAttackPatternData>> getAttackPattern(int unitId) async {
    final query = select(unitAttackPattern)
      ..where((t) => t.unitId.equals(unitId));
    return query.get();
  }

  Future<SpSkillLabelDataData?> getSpSkillLabel(int unitId) =>
      (select(spSkillLabelData)..where((t) => t.unitId.equals(unitId)))
          .getSingleOrNull();

  Future<UnitSkillDataRFData?> getRfSkillId(int skillId) async {
    final query = select(unitSkillDataRF)
      ..where((t) => t.skillId.equals(skillId));
    return query.getSingleOrNull();
  }

  Future<List<UnitUniqueEquipmentData>> getallUniqueEquip(
      {int slot = 1}) async {
    return (select(unitUniqueEquipment)
          ..where((t) => CustomExpression<int>(
                '${unitUniqueEquipment.tableName}.${unitUniqueEquipment.equipId.name} % 10',
              ).equals(slot))
          ..orderBy([
            (t) => OrderingTerm(
                  expression: t.equipId,
                  mode: OrderingMode.desc,
                )
          ]))
        .get();
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
}
