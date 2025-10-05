import 'package:misora_note/features/component/base.dart';

class UnitInfo {
  final int unitId;
  final String unitName;
  final String kana;
  final int? rarity;
  final int? ageInt;
  final String? guild;
  final String? race;
  final String? voice;
  final String? bloodType;
  final String? favorite;
  final String? catchCopy;
  final String? selfText;
  final int? heightInt;
  final int? weightInt;
  final int? birthMonthInt;
  final int? birthDayInt;
  final int? searchAreaWidth;
  final int? atkType;
  final String intro;
  final String unitStartTime; // 'YYYY/MM/DD'
  final String actualName;
  final double normalAtkCastTime;
  final int? cutin1Star6;
  int? limitType; // 1/2/3/4
  int? talentId; // 天赋ID，可能为空

  UnitInfo({
    required this.unitId,
    required this.unitName,
    required this.kana,
    required this.rarity,
    required this.ageInt,
    required this.guild,
    required this.race,
    required this.voice,
    required this.bloodType,
    required this.favorite,
    required this.catchCopy,
    required this.selfText,
    required this.heightInt,
    required this.weightInt,
    required this.birthMonthInt,
    required this.birthDayInt,
    required this.searchAreaWidth,
    required this.atkType,
    required this.intro,
    required this.unitStartTime,
    required this.actualName,
    required this.cutin1Star6,
    required this.limitType,
    required this.normalAtkCastTime,
    required this.talentId,
  });
}

class SkillActionInfo {
  final int actionId;
  final int classId;
  final int actionType;
  final int actionDetail1;
  final int actionDetail2;
  final int actionDetail3;
  final double actionValue1;
  final double actionValue2;
  final double actionValue3;
  final double actionValue4;
  final double actionValue5;
  final double actionValue6;
  final double actionValue7;
  final int targetAssignment;
  final int targetArea;
  final int targetRange;
  final int targetType;
  final int targetNumber;
  final int targetCount;
  final String? description;
  final String? levelUpDisp;
  final String ailmentName;
  final bool isRfSkill;
  final bool isOtherRfSkill;

  SkillActionInfo({
    required this.actionId,
    required this.classId,
    required this.actionType,
    required this.actionDetail1,
    required this.actionDetail2,
    required this.actionDetail3,
    required this.actionValue1,
    required this.actionValue2,
    required this.actionValue3,
    required this.actionValue4,
    required this.actionValue5,
    required this.actionValue6,
    required this.actionValue7,
    required this.targetAssignment,
    required this.targetArea,
    required this.targetRange,
    required this.targetType,
    required this.targetNumber,
    required this.targetCount,
    required this.description,
    required this.levelUpDisp,
    required this.ailmentName,
    required this.isRfSkill,
    required this.isOtherRfSkill,
  });
}

class UniqueEquipInfo {
  int unitId;
  int equipmentId;
  String equipmentName;
  String description;
  double hp;
  double atk;
  double magicStr;
  double def_;
  double magicDef;
  double physicalCritical;
  double magicCritical;
  double waveHpRecovery;
  double waveEnergyRecovery;
  double dodge;
  double physicalPenetrate;
  double magicPenetrate;
  double lifeSteal;
  double hpRecoveryRate;
  double energyRecoveryRate;
  double energyReduceRate;
  double accuracy;
  int isTpLimitAction; // 固定值 0
  int isOtherLimitAction; // 固定值 0

  UniqueEquipInfo({
    this.unitId = 0,
    this.equipmentId = 0,
    this.equipmentName = "",
    this.description = "",
    this.hp = 0,
    this.atk = 0,
    this.magicStr = 0,
    this.def_ = 0,
    this.magicDef = 0,
    this.physicalCritical = 0,
    this.magicCritical = 0,
    this.waveHpRecovery = 0,
    this.waveEnergyRecovery = 0,
    this.dodge = 0,
    this.physicalPenetrate = 0,
    this.magicPenetrate = 0,
    this.lifeSteal = 0,
    this.hpRecoveryRate = 0,
    this.energyRecoveryRate = 0,
    this.energyReduceRate = 0,
    this.accuracy = 0,
    this.isTpLimitAction = 0,
    this.isOtherLimitAction = 0,
  });

  void add(UniqueEquipBonus other) {
    hp += other.hp;
    atk += other.atk;
    magicStr += other.magicStr;
    def_ += other.def_;
    magicDef += other.magicDef;
    physicalCritical += other.physicalCritical;
    magicCritical += other.magicCritical;
    waveHpRecovery += other.waveHpRecovery;
    waveEnergyRecovery += other.waveEnergyRecovery;
    dodge += other.dodge;
    physicalPenetrate += other.physicalPenetrate;
    magicPenetrate += other.magicPenetrate;
    lifeSteal += other.lifeSteal;
    hpRecoveryRate += other.hpRecoveryRate;
    energyRecoveryRate += other.energyRecoveryRate;
    energyReduceRate += other.energyReduceRate;
    accuracy = other.accuracy;
  }
}

class UniqueEquipBonus {
  double hp;
  double atk;
  double magicStr;
  double def_;
  double magicDef;
  double physicalCritical;
  double magicCritical;
  double waveHpRecovery;
  double waveEnergyRecovery;
  double dodge;
  double physicalPenetrate;
  double magicPenetrate;
  double lifeSteal;
  double hpRecoveryRate;
  double energyRecoveryRate;
  double energyReduceRate;
  double accuracy;
  UniqueEquipBonus({
    this.hp = 0,
    this.atk = 0,
    this.magicStr = 0,
    this.def_ = 0,
    this.magicDef = 0,
    this.physicalCritical = 0,
    this.magicCritical = 0,
    this.waveHpRecovery = 0,
    this.waveEnergyRecovery = 0,
    this.dodge = 0,
    this.physicalPenetrate = 0,
    this.magicPenetrate = 0,
    this.lifeSteal = 0,
    this.hpRecoveryRate = 0,
    this.energyRecoveryRate = 0,
    this.energyReduceRate = 0,
    this.accuracy = 0,
  });
}

class UnitSearchData {
  int? unitId;
  String? unitName;
  SearchAreaWidthType? searchAreaWidth;
  AtkType? atkType;
  bool? isR6;
  bool? hasUnique1;
  bool? hasUnique2;
  Talent? talent;

  UnitSearchData({
    this.unitId,
    this.unitName,
    this.searchAreaWidth,
    this.atkType,
    this.isR6,
    this.hasUnique1,
    this.hasUnique2,
    this.talent,
  });

  void clear() {
    unitId = null;
    unitName = null;
    searchAreaWidth = null;
    atkType = null;
    isR6 = null;
    hasUnique1 = null;
    hasUnique2 = null;
    talent = null;
  }

  bool isEmpty() {
    return unitId == null &&
        unitName == null &&
        searchAreaWidth == null &&
        atkType == null &&
        isR6 == null &&
        hasUnique1 == null &&
        hasUnique2 == null &&
        talent == null;
  }
}
