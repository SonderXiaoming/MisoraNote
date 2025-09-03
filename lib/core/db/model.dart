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
