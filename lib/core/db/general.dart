import 'package:misora_note/core/db/database.dart';

class AllUnitData {
  final int unitId;
  final String unitName;
  final String? kana;
  final int? prefabId;
  final int? prefabIdBattle;
  final int? isLimited;
  final int? rarity;
  final int? motionType;
  final int? seType;
  final int? moveSpeed;
  final int? searchAreaWidth;
  final int? atkType;
  final double? normalAtkCastTime;
  final int? cutin1;
  final int? cutin2;
  final int cutin1Star6;
  final int? cutin2Star6;
  final int? guildId;
  final int? exskillDisplay;
  final String? comment;
  final int? onlyDispOwned;
  final String? startTime;
  final String? endTime;
  final int? originalUnitId;

  final int cutin;
  final int cutinStar6;
  final int visualChangeFlag;
  const AllUnitData({
    required this.unitId,
    required this.unitName,
    this.kana,
    this.prefabId,
    this.prefabIdBattle,
    this.isLimited,
    this.rarity,
    this.motionType,
    this.seType,
    this.moveSpeed,
    this.searchAreaWidth,
    this.atkType,
    this.normalAtkCastTime,
    this.cutin1,
    this.cutin2,
    this.cutin1Star6 = 0,
    this.cutin2Star6,
    this.guildId,
    this.exskillDisplay,
    this.comment,
    this.onlyDispOwned,
    this.startTime,
    this.endTime,
    this.originalUnitId,
    this.cutin = 0,
    this.cutinStar6 = 0,
    this.visualChangeFlag = 0,
  });

  static AllUnitData fromUnitEnemyData(UnitEnemyDataData data) {
    return AllUnitData(
      unitId: data.unitId,
      unitName: data.unitName,
      kana: "",
      prefabId: data.prefabId,
      prefabIdBattle: 0,
      isLimited: 0,
      rarity: 0,
      motionType: data.motionType,
      seType: data.seType,
      moveSpeed: data.moveSpeed,
      searchAreaWidth: data.searchAreaWidth,
      atkType: data.atkType,
      normalAtkCastTime: data.normalAtkCastTime,
      cutin1: data.cutin,
      cutin2: data.cutin,
      cutin1Star6: data.cutinStar6,
      cutin2Star6: data.cutinStar6,
      guildId: 0,
      exskillDisplay: 0,
      comment: data.comment,
      onlyDispOwned: 0,
      startTime: null,
      endTime: null,
      originalUnitId: null,
      cutin: data.cutin,
      cutinStar6: data.cutinStar6,
      visualChangeFlag: data.visualChangeFlag,
    );
  }

  static AllUnitData fromUnitData(UnitDataData data) {
    return AllUnitData(
      unitId: data.unitId,
      unitName: data.unitName,
      rarity: data.rarity,
      searchAreaWidth: data.searchAreaWidth,
      atkType: data.atkType,
      normalAtkCastTime: data.normalAtkCastTime,
      cutin1: data.cutin1,
      cutin2: data.cutin2,
      cutin1Star6: data.cutin1Star6 ?? 0,
      cutin2Star6: data.cutin2Star6,
      kana: data.kana,
      prefabId: data.prefabId,
      prefabIdBattle: data.prefabIdBattle,
      isLimited: data.isLimited,
      motionType: data.motionType,
      seType: data.seType,
      moveSpeed: data.moveSpeed,
      guildId: data.guildId,
      exskillDisplay: data.exskillDisplay,
      comment: data.comment,
      onlyDispOwned: data.onlyDispOwned,
      startTime: data.startTime,
      endTime: data.endTime,
      originalUnitId: data.originalUnitId,
      cutin: data.cutin1 ?? 0,
      cutinStar6: data.cutin1Star6 ?? 0,
      visualChangeFlag: 0,
    );
  }
}

class AllUnitParameter {
  final int enemyId;
  final int unitId;
  final String name;
  final int level;
  final int rarity;
  final int promotionLevel;
  final int hp;
  final int atk;
  final int magicStr;
  final double def_;
  final int magicDef;
  final int physicalCritical;
  final int magicCritical;
  final int waveHpRecovery;
  final int waveEnergyRecovery;
  final int dodge;
  final int physicalPenetrate;
  final int magicPenetrate;
  final int lifeSteal;
  final int hpRecoveryRate;
  final int energyRecoveryRate;
  final int energyReduceRate;
  final int unionBurstLevel;
  final int mainSkillLv1;
  final int mainSkillLv2;
  final int mainSkillLv3;
  final int mainSkillLv4;
  final int mainSkillLv5;
  final int mainSkillLv6;
  final int mainSkillLv7;
  final int mainSkillLv8;
  final int mainSkillLv9;
  final int mainSkillLv10;
  final int exSkillLv1;
  final int exSkillLv2;
  final int exSkillLv3;
  final int exSkillLv4;
  final int exSkillLv5;
  final int resistStatusId;
  final int resistVariationId;
  final int accuracy;
  final int enemyColor;
  const AllUnitParameter({
    required this.enemyId,
    required this.unitId,
    required this.name,
    required this.level,
    required this.rarity,
    required this.promotionLevel,
    required this.hp,
    required this.atk,
    required this.magicStr,
    required this.def_,
    required this.magicDef,
    required this.physicalCritical,
    required this.magicCritical,
    required this.waveHpRecovery,
    required this.waveEnergyRecovery,
    required this.dodge,
    required this.physicalPenetrate,
    required this.magicPenetrate,
    required this.lifeSteal,
    required this.hpRecoveryRate,
    required this.energyRecoveryRate,
    required this.energyReduceRate,
    required this.unionBurstLevel,
    required this.mainSkillLv1,
    required this.mainSkillLv2,
    required this.mainSkillLv3,
    required this.mainSkillLv4,
    required this.mainSkillLv5,
    required this.mainSkillLv6,
    required this.mainSkillLv7,
    required this.mainSkillLv8,
    required this.mainSkillLv9,
    required this.mainSkillLv10,
    required this.exSkillLv1,
    required this.exSkillLv2,
    required this.exSkillLv3,
    required this.exSkillLv4,
    required this.exSkillLv5,
    required this.resistStatusId,
    required this.resistVariationId,
    required this.accuracy,
    required this.enemyColor,
  });

  static AllUnitParameter? fromEnemyParameter(EnemyParameterData? data) {
    if (data == null) return null;
    return AllUnitParameter(
      enemyId: data.enemyId,
      unitId: data.unitId,
      name: data.name,
      level: data.level,
      rarity: data.rarity,
      promotionLevel: data.promotionLevel,
      hp: data.hp,
      atk: data.atk,
      magicStr: data.magicStr,
      def_: data.def_,
      magicDef: data.magicDef,
      physicalCritical: data.physicalCritical,
      magicCritical: data.magicCritical,
      waveHpRecovery: data.waveHpRecovery,
      waveEnergyRecovery: data.waveEnergyRecovery,
      dodge: data.dodge,
      physicalPenetrate: data.physicalPenetrate,
      magicPenetrate: data.magicPenetrate,
      lifeSteal: data.lifeSteal,
      hpRecoveryRate: data.hpRecoveryRate,
      energyRecoveryRate: data.energyRecoveryRate,
      energyReduceRate: data.energyReduceRate,
      unionBurstLevel: data.unionBurstLevel,
      mainSkillLv1: data.mainSkillLv1,
      mainSkillLv2: data.mainSkillLv2,
      mainSkillLv3: data.mainSkillLv3,
      mainSkillLv4: data.mainSkillLv4,
      mainSkillLv5: data.mainSkillLv5,
      mainSkillLv6: data.mainSkillLv6,
      mainSkillLv7: data.mainSkillLv7,
      mainSkillLv8: data.mainSkillLv8,
      mainSkillLv9: data.mainSkillLv9,
      mainSkillLv10: data.mainSkillLv10,
      exSkillLv1: data.exSkillLv1,
      exSkillLv2: data.exSkillLv2,
      exSkillLv3: data.exSkillLv3,
      exSkillLv4: data.exSkillLv4,
      exSkillLv5: data.exSkillLv5,
      resistStatusId: data.resistStatusId,
      resistVariationId: data.resistVariationId,
      accuracy: data.accuracy,
      enemyColor: 0,
    );
  }

  static AllUnitParameter? fromEventEnemyParameter(
    EventEnemyParameterData? data,
  ) {
    if (data == null) return null;
    return AllUnitParameter(
      enemyId: data.enemyId,
      unitId: data.unitId,
      name: "",
      level: data.level,
      rarity: data.rarity,
      promotionLevel: data.promotionLevel,
      hp: data.hp,
      atk: data.atk,
      magicStr: data.magicStr,
      def_: data.def_,
      magicDef: data.magicDef,
      physicalCritical: data.physicalCritical,
      magicCritical: data.magicCritical,
      waveHpRecovery: data.waveHpRecovery,
      waveEnergyRecovery: data.waveEnergyRecovery,
      dodge: data.dodge,
      physicalPenetrate: data.physicalPenetrate,
      magicPenetrate: data.magicPenetrate,
      lifeSteal: data.lifeSteal,
      hpRecoveryRate: data.hpRecoveryRate,
      energyRecoveryRate: data.energyRecoveryRate,
      energyReduceRate: data.energyReduceRate,
      unionBurstLevel: data.unionBurstLevel,
      mainSkillLv1: data.mainSkillLv1,
      mainSkillLv2: data.mainSkillLv2,
      mainSkillLv3: data.mainSkillLv3,
      mainSkillLv4: data.mainSkillLv4,
      mainSkillLv5: data.mainSkillLv5,
      mainSkillLv6: data.mainSkillLv6,
      mainSkillLv7: data.mainSkillLv7,
      mainSkillLv8: data.mainSkillLv8,
      mainSkillLv9: data.mainSkillLv9,
      mainSkillLv10: data.mainSkillLv10,
      exSkillLv1: data.exSkillLv1,
      exSkillLv2: data.exSkillLv2,
      exSkillLv3: data.exSkillLv3,
      exSkillLv4: data.exSkillLv4,
      exSkillLv5: data.exSkillLv5,
      resistStatusId: data.resistStatusId,
      resistVariationId: data.resistVariationId,
      accuracy: data.accuracy,
      enemyColor: 0,
    );
  }

  static AllUnitParameter? fromTalentQuestEnemyParameter(
    TalentQuestEnemyParameterData? data,
  ) {
    if (data == null) return null;
    return AllUnitParameter(
      enemyId: data.enemyId,
      unitId: data.unitId,

      name: data.name,
      level: data.level,
      rarity: data.rarity,
      promotionLevel: data.promotionLevel,
      hp: data.hp,
      atk: data.atk,
      magicStr: data.magicStr,
      def_: data.def_,
      magicDef: data.magicDef,
      physicalCritical: data.physicalCritical,
      magicCritical: data.magicCritical,
      waveHpRecovery: data.waveHpRecovery,
      waveEnergyRecovery: data.waveEnergyRecovery,
      dodge: data.dodge,
      physicalPenetrate: data.physicalPenetrate,

      magicPenetrate: data.magicPenetrate,
      lifeSteal: data.lifeSteal,
      hpRecoveryRate: data.hpRecoveryRate,
      energyRecoveryRate: data.energyRecoveryRate,
      energyReduceRate: data.energyReduceRate,
      unionBurstLevel: data.unionBurstLevel,
      mainSkillLv1: data.mainSkillLv1,
      mainSkillLv2: data.mainSkillLv2,
      mainSkillLv3: data.mainSkillLv3,
      mainSkillLv4: data.mainSkillLv4,
      mainSkillLv5: data.mainSkillLv5,
      mainSkillLv6: data.mainSkillLv6,
      mainSkillLv7: data.mainSkillLv7,
      mainSkillLv8: data.mainSkillLv8,
      mainSkillLv9: data.mainSkillLv9,
      mainSkillLv10: data.mainSkillLv10,
      exSkillLv1: data.exSkillLv1,
      exSkillLv2: data.exSkillLv2,
      exSkillLv3: data.exSkillLv3,
      exSkillLv4: data.exSkillLv4,
      exSkillLv5: data.exSkillLv5,
      resistStatusId: data.resistStatusId,
      resistVariationId: data.resistVariationId,
      accuracy: data.accuracy,
      enemyColor: 0,
    );
  }

  static AllUnitParameter? fromShioriEnemyParameter(
    ShioriEnemyParameterData? data,
  ) {
    if (data == null) return null;
    return AllUnitParameter(
      enemyId: data.enemyId,
      unitId: data.unitId,
      name: "",
      level: data.level,
      rarity: data.rarity,
      promotionLevel: data.promotionLevel,
      hp: data.hp,
      atk: data.atk,
      magicStr: data.magicStr,
      def_: data.def_,
      magicDef: data.magicDef,
      physicalCritical: data.physicalCritical,
      magicCritical: data.magicCritical,
      waveHpRecovery: data.waveHpRecovery,
      waveEnergyRecovery: data.waveEnergyRecovery,
      dodge: data.dodge,
      physicalPenetrate: data.physicalPenetrate,
      magicPenetrate: data.magicPenetrate,
      lifeSteal: data.lifeSteal,
      hpRecoveryRate: data.hpRecoveryRate,
      energyRecoveryRate: data.energyRecoveryRate,
      energyReduceRate: data.energyReduceRate,
      unionBurstLevel: data.unionBurstLevel,
      mainSkillLv1: data.mainSkillLv1,
      mainSkillLv2: data.mainSkillLv2,
      mainSkillLv3: data.mainSkillLv3,
      mainSkillLv4: data.mainSkillLv4,
      mainSkillLv5: data.mainSkillLv5,
      mainSkillLv6: data.mainSkillLv6,
      mainSkillLv7: data.mainSkillLv7,
      mainSkillLv8: data.mainSkillLv8,
      mainSkillLv9: data.mainSkillLv9,
      mainSkillLv10: data.mainSkillLv10,
      exSkillLv1: data.exSkillLv1,
      exSkillLv2: data.exSkillLv2,
      exSkillLv3: data.exSkillLv3,
      exSkillLv4: data.exSkillLv4,
      exSkillLv5: data.exSkillLv5,
      resistStatusId: data.resistStatusId,
      resistVariationId: data.resistVariationId,
      accuracy: data.accuracy,
      enemyColor: 0,
    );
  }

  static AllUnitParameter? fromSreEnemyParameter(SreEnemyParameterData? data) {
    if (data == null) return null;
    return AllUnitParameter(
      enemyId: data.enemyId,
      unitId: data.unitId,
      name: data.name,
      level: data.level,
      rarity: data.rarity,
      promotionLevel: data.promotionLevel,
      hp: data.hp,
      atk: data.atk,
      magicStr: data.magicStr,
      def_: data.def_,
      magicDef: data.magicDef,
      physicalCritical: data.physicalCritical,
      magicCritical: data.magicCritical,
      waveHpRecovery: data.waveHpRecovery,
      waveEnergyRecovery: data.waveEnergyRecovery,
      dodge: data.dodge,
      physicalPenetrate: data.physicalPenetrate,
      magicPenetrate: data.magicPenetrate,
      lifeSteal: data.lifeSteal,
      hpRecoveryRate: data.hpRecoveryRate,
      energyRecoveryRate: data.energyRecoveryRate,
      energyReduceRate: data.energyReduceRate,
      unionBurstLevel: data.unionBurstLevel,
      mainSkillLv1: data.mainSkillLv1,
      mainSkillLv2: data.mainSkillLv2,
      mainSkillLv3: data.mainSkillLv3,
      mainSkillLv4: data.mainSkillLv4,
      mainSkillLv5: data.mainSkillLv5,
      mainSkillLv6: data.mainSkillLv6,
      mainSkillLv7: data.mainSkillLv7,
      mainSkillLv8: data.mainSkillLv8,
      mainSkillLv9: data.mainSkillLv9,
      mainSkillLv10: data.mainSkillLv10,
      exSkillLv1: data.exSkillLv1,
      exSkillLv2: data.exSkillLv2,
      exSkillLv3: data.exSkillLv3,
      exSkillLv4: data.exSkillLv4,
      exSkillLv5: data.exSkillLv5,
      resistStatusId: data.resistStatusId,
      resistVariationId: data.resistVariationId,

      accuracy: data.accuracy,
      enemyColor: 0,
    );
  }

  static AllUnitParameter? fromTowerEnemyParameter(
    TowerEnemyParameterData? data,
  ) {
    if (data == null) return null;
    return AllUnitParameter(
      enemyId: data.enemyId,
      unitId: data.unitId,
      name: data.name,
      level: data.level,
      rarity: data.rarity,
      promotionLevel: data.promotionLevel,
      hp: data.hp,
      atk: data.atk,
      magicStr: data.magicStr,
      def_: data.def_,
      magicDef: data.magicDef,
      physicalCritical: data.physicalCritical,
      magicCritical: data.magicCritical,
      waveHpRecovery: data.waveHpRecovery,
      waveEnergyRecovery: data.waveEnergyRecovery,
      dodge: data.dodge,
      physicalPenetrate: data.physicalPenetrate,
      magicPenetrate: data.magicPenetrate,
      lifeSteal: data.lifeSteal,
      hpRecoveryRate: data.hpRecoveryRate,
      energyRecoveryRate: data.energyRecoveryRate,
      energyReduceRate: data.energyReduceRate,
      unionBurstLevel: data.unionBurstLevel,
      mainSkillLv1: data.mainSkillLv1,
      mainSkillLv2: data.mainSkillLv2,
      mainSkillLv3: data.mainSkillLv3,
      mainSkillLv4: data.mainSkillLv4,
      mainSkillLv5: data.mainSkillLv5,
      mainSkillLv6: data.mainSkillLv6,
      mainSkillLv7: data.mainSkillLv7,
      mainSkillLv8: data.mainSkillLv8,
      mainSkillLv9: data.mainSkillLv9,
      mainSkillLv10: data.mainSkillLv10,
      exSkillLv1: data.exSkillLv1,
      exSkillLv2: data.exSkillLv2,
      exSkillLv3: data.exSkillLv3,
      exSkillLv4: data.exSkillLv4,
      exSkillLv5: data.exSkillLv5,
      resistStatusId: data.resistStatusId,
      resistVariationId: data.resistVariationId,
      accuracy: data.accuracy,
      enemyColor: data.enemyColor,
    );
  }

  static AllUnitParameter? fromSevenEnemyParameter(
    SevenEnemyParameterData? data,
  ) {
    if (data == null) return null;
    return AllUnitParameter(
      enemyId: data.enemyId,
      unitId: data.unitId,
      name: data.name,
      level: data.level,
      rarity: data.rarity,
      promotionLevel: data.promotionLevel,
      hp: data.hp,
      atk: data.atk,
      magicStr: data.magicStr,
      def_: data.def_,
      magicDef: data.magicDef,
      physicalCritical: data.physicalCritical,
      magicCritical: data.magicCritical,
      waveHpRecovery: data.waveHpRecovery,
      waveEnergyRecovery: data.waveEnergyRecovery,
      dodge: data.dodge,
      physicalPenetrate: data.physicalPenetrate,
      magicPenetrate: data.magicPenetrate,
      lifeSteal: data.lifeSteal,
      hpRecoveryRate: data.hpRecoveryRate,
      energyRecoveryRate: data.energyRecoveryRate,
      energyReduceRate: data.energyReduceRate,
      unionBurstLevel: data.unionBurstLevel,
      mainSkillLv1: data.mainSkillLv1,
      mainSkillLv2: data.mainSkillLv2,
      mainSkillLv3: data.mainSkillLv3,
      mainSkillLv4: data.mainSkillLv4,
      mainSkillLv5: data.mainSkillLv5,
      mainSkillLv6: data.mainSkillLv6,
      mainSkillLv7: data.mainSkillLv7,
      mainSkillLv8: data.mainSkillLv8,
      mainSkillLv9: data.mainSkillLv9,
      mainSkillLv10: data.mainSkillLv10,
      exSkillLv1: data.exSkillLv1,
      exSkillLv2: data.exSkillLv2,
      exSkillLv3: data.exSkillLv3,
      exSkillLv4: data.exSkillLv4,
      exSkillLv5: data.exSkillLv5,
      resistStatusId: data.resistStatusId,
      resistVariationId: data.resistVariationId,
      accuracy: data.accuracy,
      enemyColor: 0,
    );
  }
}
