import 'package:flutter/foundation.dart';

class UnitUniqueEquipParameter {
  final int unitId;
  final int solt;
  final int lv;

  const UnitUniqueEquipParameter({
    required this.unitId,
    required this.solt,
    this.lv = 1,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UnitUniqueEquipParameter &&
        other.unitId == unitId &&
        other.solt == solt;
  }

  @override
  int get hashCode => unitId.hashCode ^ solt.hashCode;
}

class UnitSkillListParameter {
  final int unitId;
  final Map<int, int>? levelMap;

  const UnitSkillListParameter({required this.unitId, this.levelMap});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UnitSkillListParameter &&
        other.unitId == unitId &&
        mapEquals(other.levelMap, levelMap);
  }

  @override
  int get hashCode => unitId.hashCode ^ levelMap.hashCode;
}
