import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/core/di/di_parameter.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/component/skill/skill_info.dart';
import 'package:misora_note/features/component/skill/skill_type.dart';

class DbNotifier extends Notifier<AppDb> {
  // 初始构建：默认 CN
  @override
  AppDb build() {
    final db = AppDb(FilePath.db(Area.cn));
    return db;
  }

  void switchArea(Area area) {
    if (_currentArea == area) return;

    final old = state;
    final next = AppDb(FilePath.db(area));
    state = next;

    try {
      old.close();
    } catch (_) {}

    _currentArea = area;
  }

  Area _currentArea = Area.cn;
}

final dbProvider = NotifierProvider<DbNotifier, AppDb>(DbNotifier.new);

final dominantColorProvider =
    FutureProvider.family<(Color?, Color?), CachedImage>((ref, image) async {
  return await image.getDominantColor();
});

final unitInfoProvider = FutureProvider.family<UnitInfo?, int>((
  ref,
  unitId,
) async {
  final db = ref.watch(dbProvider);
  return db.getUnitInfo(unitId);
});

final unitUniqueEquipProvider =
    FutureProvider.family<UniqueEquipInfo?, UnitUniqueEquipParameter>((
  ref,
  parameter,
) async {
  final db = ref.watch(dbProvider);
  return db.getUniqueEquipInfo(
    parameter.unitId,
    slot: parameter.solt,
    lv: parameter.lv,
  );
});

final unitSkillListProvider =
    FutureProvider.family<UnitSkillList, UnitSkillListParameter>((
  ref,
  parameter,
) async {
  final db = ref.watch(dbProvider);
  return getUnitSkillList(
    db,
    parameter.unitId,
    levelMap: parameter.levelMap,
  );
});

final unitAttackPatternProvider =
    FutureProvider.family<List<UnitAttackPatternData>, int>((
  ref,
  unitId,
) async {
  final db = ref.watch(dbProvider);
  return db.getAttackPattern(unitId);
});
