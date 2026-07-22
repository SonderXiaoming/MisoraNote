import 'package:flutter/foundation.dart';
import 'package:misora_note/core/db/general.dart';
import 'package:misora_note/features/component/base.dart';

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
        other.solt == solt &&
        other.lv == lv;
  }

  @override
  int get hashCode => Object.hash(unitId, solt, lv);
}

class UnitSkillListParameter {
  final int unitId;
  final Map<int, int>? levelMap;
  final AllUnitParameter? enemyParameter;
  final int atkType;
  final double normalAttackCastTime;

  const UnitSkillListParameter({
    required this.unitId,
    this.levelMap,
    this.enemyParameter,
    this.atkType = 0,
    this.normalAttackCastTime = 0,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UnitSkillListParameter &&
        other.unitId == unitId &&
        mapEquals(other.levelMap, levelMap) &&
        other.enemyParameter?.enemyId == enemyParameter?.enemyId &&
        other.atkType == atkType &&
        other.normalAttackCastTime == normalAttackCastTime;
  }

  @override
  int get hashCode => Object.hash(
    unitId,
    levelMap,
    enemyParameter?.enemyId,
    atkType,
    normalAttackCastTime,
  );
}

class EnemyParameterProviderParameter {
  final int enemyId;
  final EnemyType? enemyType;

  const EnemyParameterProviderParameter({
    required this.enemyId,
    this.enemyType,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EnemyParameterProviderParameter &&
        other.enemyId == enemyId &&
        other.enemyType == enemyType;
  }

  @override
  int get hashCode => enemyId.hashCode ^ enemyType.hashCode;
}
