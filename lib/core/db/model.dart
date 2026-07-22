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
  final int unitRoleId;

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
    required this.unitRoleId,
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

class UniqueEquipListItem {
  final int equipmentId;
  final String equipmentName;
  final String description;
  final int unitId;
  final String unitName;
  final int equipSlot;
  final int searchAreaWidth;
  final int atkType;
  final int limitType;
  final int talentId;
  final int roleId;

  const UniqueEquipListItem({
    required this.equipmentId,
    required this.equipmentName,
    required this.description,
    required this.unitId,
    required this.unitName,
    required this.equipSlot,
    required this.searchAreaWidth,
    required this.atkType,
    required this.limitType,
    required this.talentId,
    required this.roleId,
  });
}

class DeepZoneEnemy {
  final int enemyId;
  final int unitId;

  const DeepZoneEnemy({required this.enemyId, required this.unitId});

  int get iconUnitId {
    if (unitId ~/ 100000 == 6) {
      return ((unitId - 500000 + 30) ~/ 10) * 10 + 1;
    }
    return unitId;
  }
}

class DeepZoneQuest {
  final int questId;
  final int talentId;
  final String questName;
  final int stellarShardCount;
  final int crystalBallCount;
  final List<DeepZoneEnemy> enemies;

  const DeepZoneQuest({
    required this.questId,
    required this.talentId,
    required this.questName,
    required this.stellarShardCount,
    required this.crystalBallCount,
    required this.enemies,
  });

  String get displayName {
    final match = RegExp(r'(\d+)-(\d+)').firstMatch(questName);
    if (match == null) return questName;
    return '${match.group(1)}-${match.group(2)}';
  }

  int get stageOrder {
    final match = RegExp(r'(\d+)-(\d+)').firstMatch(questName);
    if (match == null) return questId;
    return int.parse(match.group(1)!) * 1000 + int.parse(match.group(2)!);
  }
}

enum DeepZoneSort { stage, stellarShard, crystalBall }

List<DeepZoneQuest> filterAndSortDeepZoneQuests(
  Iterable<DeepZoneQuest> quests, {
  String search = '',
  DeepZoneSort sort = DeepZoneSort.stage,
  bool ascending = false,
}) {
  final query = search.trim().toLowerCase();
  final result = quests.where((quest) {
    if (query.isEmpty) return true;
    return quest.questName.toLowerCase().contains(query) ||
        quest.displayName.toLowerCase().contains(query) ||
        quest.questId.toString().contains(query) ||
        quest.enemies.any(
          (enemy) =>
              enemy.enemyId.toString().contains(query) ||
              enemy.unitId.toString().contains(query),
        );
  }).toList();

  int compare(DeepZoneQuest a, DeepZoneQuest b) {
    final comparison = switch (sort) {
      DeepZoneSort.stage => a.stageOrder.compareTo(b.stageOrder),
      DeepZoneSort.stellarShard => a.stellarShardCount.compareTo(
        b.stellarShardCount,
      ),
      DeepZoneSort.crystalBall => a.crystalBallCount.compareTo(
        b.crystalBallCount,
      ),
    };
    final withTieBreak = comparison == 0
        ? a.questId.compareTo(b.questId)
        : comparison;
    return ascending ? withTieBreak : -withTieBreak;
  }

  result.sort(compare);
  return result;
}

class UnitSummary {
  final int unitId;
  final String unitName;

  const UnitSummary({required this.unitId, required this.unitName});
}

class EnemySearchResult {
  final int enemyId;
  final int unitId;
  final String name;
  final int level;
  final int hp;
  final EnemyType type;

  const EnemySearchResult({
    required this.enemyId,
    required this.unitId,
    required this.name,
    required this.level,
    required this.hp,
    required this.type,
  });
}

enum ScheduleEventType {
  story,
  gacha,
  freeGacha,
  campaign,
  clanBattle,
  tower,
  specialDungeon,
  dimensionalFault,
  colosseum,
  abyss,
  dailyMission,
  loginBonus,
  fortune,
}

class GameScheduleEvent {
  final String id;
  final String title;
  final String subtitle;
  final ScheduleEventType type;
  final DateTime startTime;
  final DateTime endTime;

  const GameScheduleEvent({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.startTime,
    required this.endTime,
  });

  bool isInProgressAt(DateTime now) =>
      !now.isBefore(startTime) && now.isBefore(endTime);

  bool isUpcomingAt(DateTime now) => now.isBefore(startTime);
}

class ScheduleOverview {
  final List<GameScheduleEvent> inProgress;
  final List<GameScheduleEvent> comingSoon;

  const ScheduleOverview({required this.inProgress, required this.comingSoon});

  const ScheduleOverview.empty() : inProgress = const [], comingSoon = const [];

  factory ScheduleOverview.fromEvents(
    Iterable<GameScheduleEvent> events, {
    DateTime? now,
    int maxInProgress = 20,
    int maxComingSoon = 20,
  }) {
    final current = now ?? DateTime.now().toUtc();
    final inProgress =
        events.where((event) => event.isInProgressAt(current)).toList()
          ..sort((a, b) => a.endTime.compareTo(b.endTime));
    final comingSoon =
        events.where((event) => event.isUpcomingAt(current)).toList()
          ..sort((a, b) => a.startTime.compareTo(b.startTime));

    return ScheduleOverview(
      inProgress: inProgress.take(maxInProgress).toList(growable: false),
      comingSoon: comingSoon.take(maxComingSoon).toList(growable: false),
    );
  }
}

class CharacterBondBonus {
  final int type;
  final int value;

  const CharacterBondBonus({required this.type, required this.value});
}

class CharacterBondStory {
  final int storyId;
  final String title;
  final String subTitle;
  final List<CharacterBondBonus> bonuses;

  const CharacterBondStory({
    required this.storyId,
    required this.title,
    required this.subTitle,
    required this.bonuses,
  });

  int get groupId => storyId ~/ 1000;
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

class EnemyWeaknessInfo {
  final int enemyId;
  final int resistId;
  final int talent1;
  final int talent2;
  final int talent3;
  final int talent4;
  final int talent5;

  EnemyWeaknessInfo({
    required this.enemyId,
    required this.resistId,
    required this.talent1,
    required this.talent2,
    required this.talent3,
    required this.talent4,
    required this.talent5,
  });
}

class ClanBattleData {
  final int clanBattleId;
  final int releaseMonth;
  final String startTime;
  final int minPhase;
  final int maxPhase;
  final List<int> enemyIds;
  final List<int> unitIds;
  final String? endTime;

  ClanBattleData({
    required this.clanBattleId,
    required this.releaseMonth,
    required this.startTime,
    required this.minPhase,
    required this.maxPhase,
    this.enemyIds = const [],
    this.unitIds = const [],
    this.endTime,
  });

  String get displayDate {
    final normalized = startTime.replaceAll('/', '-');
    final date = DateTime.tryParse(normalized);
    if (date == null) return startTime;
    return '${date.year}/${date.month.toString().padLeft(2, '0')}';
  }
}

class ClanBattlePhaseData {
  final int phase;
  final int lapFrom;
  final int lapTo;
  final List<ClanBattleBossData> bosses;

  const ClanBattlePhaseData({
    required this.phase,
    required this.lapFrom,
    required this.lapTo,
    required this.bosses,
  });

  String get phaseLabel {
    if (phase < 1 || phase > 26) return '$phase';
    return String.fromCharCode('A'.codeUnitAt(0) + phase - 1);
  }

  String get lapLabel => lapTo == -1 ? '$lapFrom+' : '$lapFrom-$lapTo';
}

class ClanBattleBossData {
  final int index;
  final int enemyId;
  final int unitId;
  final String name;
  final int hp;

  const ClanBattleBossData({
    required this.index,
    required this.enemyId,
    required this.unitId,
    required this.name,
    required this.hp,
  });

  List<FullCompensationLine> get fullCompensationLines =>
      calculateFullCompensationLines(hp);
}

class FullCompensationLine {
  final int count;
  final double damage;

  const FullCompensationLine({required this.count, required this.damage});
}

/// Ported from kanna_note's max-time-return calculation. Values below six
/// million are intentionally omitted because they are not useful as full
/// compensation thresholds.
List<FullCompensationLine> calculateFullCompensationLines(
  int bossHp, {
  int maxCount = 8,
  double minDamage = 6000000,
}) {
  final result = <FullCompensationLine>[];
  for (var count = 1; count <= maxCount; count++) {
    final damage = bossHp / (count + 21 / 90);
    if (damage <= minDamage) break;
    result.add(FullCompensationLine(count: count, damage: damage));
  }
  return result;
}
