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
  final int? cutin1Star6;
  int? limitType; // 1/2/3/4

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
