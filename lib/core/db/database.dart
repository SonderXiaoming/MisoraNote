import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'dart:io';
import 'model.dart';
import 'table.dart'; // 里面有 class UnitProfile extends Table

part 'database.g.dart';

int _toIntOrNull(String? s) => s == null ? -1 : int.tryParse(s.trim()) ?? -1;
final kannaIDs = [170101, 170201];

@DriftDatabase(
  tables: [
    UnitProfile,
    RedeemUnit,
    UnitData,
    UniqueEquipmentEnhanceData,
    ActualUnitBackground,
    Rarity6QuestData,
  ],
)
class AppDb extends _$AppDb {
  late List<int> exCharacter; // 可兑换角色列表
  late List<int> r6Units; // 所有 6 星角色列表
  late (int, int) maxUniqueEquipLv; // 最大的专一2等级

  AppDb(String sqliteFile) : super(NativeDatabase(File(sqliteFile)));

  Future<void> init() async {
    exCharacter = await getExUnitsList();
    maxUniqueEquipLv = (
      await getMaxUniqueEquipLv(1),
      await getMaxUniqueEquipLv(2),
    );
    r6Units = await getR6Units();
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

  Future<List<UnitDataData>> getUnitsData() => select(unitData).get();

  Future<UnitInfo?> getUnitInfo(int unitId) async {
    final u = unitProfile; // 表 getter：unit_profile
    final d = unitData; // 表 getter：unit_data
    final a = actualUnitBackground; // 表 getter：actual_unit_background
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
          orElse: const Constant(null),
        ).cast<int>();
    final join =
        selectOnly(u)
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
    );

    if (kannaIDs.contains(info.unitId)) {
      info.limitType = 2;
    } else if (exCharacter.contains(info.unitId)) {
      info.limitType = 4;
    }

    return info;
  }

  // ORM：按 id 查询
  Future<UnitProfileData?> getUnitById(int id) =>
      (select(unitProfile)
        ..where((t) => t.unitId.equals(id))).getSingleOrNull();

  Future<int> getMaxUniqueEquipLv(int slot) async {
    final maxExpr = uniqueEquipmentEnhanceData.enhanceLevel.max();

    final query =
        selectOnly(uniqueEquipmentEnhanceData)
          ..addColumns([maxExpr])
          ..where(uniqueEquipmentEnhanceData.equipSlot.equals(slot));

    final row = await query.getSingleOrNull();

    final maxValue = row?.read(maxExpr);

    return maxValue ?? 1;
  }
}
