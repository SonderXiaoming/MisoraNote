import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/l10n/app_localizations.dart';

enum UnitRankType {
  lastUpdate,
  age,
  height,
  weight,
  unitId,
  birthDay,
  searchAreaWidth;

  String getName(AppLocalizations t) {
    switch (this) {
      case UnitRankType.lastUpdate:
        return t.last_update;
      case UnitRankType.age:
        return t.age;
      case UnitRankType.height:
        return t.height;
      case UnitRankType.weight:
        return t.weight;
      case UnitRankType.unitId:
        return t.unit_id;
      case UnitRankType.birthDay:
        return t.birthday;
      case UnitRankType.searchAreaWidth:
        return t.position;
    }
  }
}

enum SearchAreaWidthType {
  front((0, 299), CustomColors.colorOrange),
  middle((300, 600), CustomColors.colorGold),
  back((601, 10000), CustomColors.colorDeepBlue);

  final (int, int) range;
  final int color;
  const SearchAreaWidthType(this.range, this.color);

  static SearchAreaWidthType getType(int width) {
    if (width < 300) {
      return SearchAreaWidthType.front;
    } else if (width > 600) {
      return SearchAreaWidthType.back;
    } else {
      return SearchAreaWidthType.middle;
    }
  }

  String getName(AppLocalizations t) {
    switch (this) {
      case SearchAreaWidthType.front:
        return t.position_front;
      case SearchAreaWidthType.back:
        return t.position_back;
      case SearchAreaWidthType.middle:
        return t.position_middle;
    }
  }

  LocalImage getIcon(double width, double height) {
    switch (this) {
      case SearchAreaWidthType.front:
        return LocalImage(
          path: "${FilePath.img}/front.svg",
          width: width,
          height: height,
        );
      case SearchAreaWidthType.back:
        return LocalImage(
          path: "${FilePath.img}/back.svg",
          width: width,
          height: height,
        );
      case SearchAreaWidthType.middle:
        return LocalImage(
          path: "${FilePath.img}/middle.svg",
          width: width,
          height: height,
        );
    }
  }
}

enum AtkType {
  physical(1, CustomColors.colorGold),
  magic(2, CustomColors.colorPurple);

  final int value;
  final int color;
  const AtkType(this.value, this.color);

  LocalImage getIcon(double width, double height) {
    switch (this) {
      case AtkType.physical:
        return LocalImage(
          path: "${FilePath.img}/physical.png",
          width: width,
          height: height,
        );
      case AtkType.magic:
        return LocalImage(
          path: "${FilePath.img}/magic.png",
          width: width,
          height: height,
        );
    }
  }

  LocalImage getSkillIcon(double width, double height) {
    switch (this) {
      case AtkType.physical:
        return LocalImage(
          path: "${FilePath.img}/attack.png",
          width: width,
          height: height,
        );
      case AtkType.magic:
        return LocalImage(
          path: "${FilePath.img}/attack.png",
          width: width,
          height: height,
        );
    }
  }

  String getName(AppLocalizations t) {
    switch (this) {
      case AtkType.physical:
        return t.physical;
      case AtkType.magic:
        return t.magic;
    }
  }

  static AtkType fromValue(int value) {
    switch (value) {
      case 1:
        return AtkType.physical;
      default:
        return AtkType.magic;
    }
  }
}

enum UnitGetType {
  normal(1, CustomColors.colorGold),
  limit(2, CustomColors.colorOrange),
  event(3, CustomColors.colorGreen),
  extra(4, CustomColors.colorDeepBlue);

  final int value;
  final int color;
  const UnitGetType(this.value, this.color);

  static UnitGetType? fromValue(int value) {
    for (var type in UnitGetType.values) {
      if (type.value == value) {
        return type;
      }
    }
    return null;
  }

  String getName(AppLocalizations t) {
    switch (this) {
      case UnitGetType.normal:
        return t.type_normal;
      case UnitGetType.limit:
        return t.type_limit;
      case UnitGetType.event:
        return t.type_event_limit;
      case UnitGetType.extra:
        return t.type_extra_character;
    }
  }
}

enum UnitRoleType {
  attacker(1, CustomColors.colorRed),
  breaker(2, CustomColors.colorGold),
  buffer(3, CustomColors.colorOrange),
  debuffer(4, CustomColors.colorDeepBlue),
  booster(5, CustomColors.colorCyan),
  healer(6, CustomColors.colorGreen),
  tank(7, CustomColors.colorPurple),
  jammer(8, CustomColors.colorDeepPink);

  final int value;
  final int color;

  const UnitRoleType(this.value, this.color);

  static UnitRoleType? fromValue(int value) {
    for (final type in UnitRoleType.values) {
      if (type.value == value) return type;
    }
    return null;
  }

  String getName(AppLocalizations t) {
    return switch (this) {
      UnitRoleType.attacker => t.role_attacker,
      UnitRoleType.breaker => t.role_breaker,
      UnitRoleType.buffer => t.role_buffer,
      UnitRoleType.debuffer => t.role_debuffer,
      UnitRoleType.booster => t.role_booster,
      UnitRoleType.healer => t.role_healer,
      UnitRoleType.tank => t.role_tank,
      UnitRoleType.jammer => t.role_jammer,
    };
  }
}

enum EnemyType {
  all,
  normal,
  event,
  tower,
  shiori,
  sre,
  sekai,
  seven,
  clan,
  talentQuest;

  String getName(AppLocalizations t) {
    switch (this) {
      case EnemyType.all:
        return '全部敌人';
      case EnemyType.normal:
        return '普通敌人';
      case EnemyType.event:
        return '活动敌人';
      case EnemyType.tower:
        return '塔敌人';
      case EnemyType.shiori:
        return '诗穗敌人';
      case EnemyType.sre:
        return 'SRE敌人';
      case EnemyType.sekai:
        return '次元断层敌人';
      case EnemyType.seven:
        return '七冠敌人';
      case EnemyType.talentQuest:
        return '天赋任务敌人';
      case EnemyType.clan:
        return '公会战';
    }
  }
}

enum UnitType { unit, enemy, summon, enemySummon }

enum Talent {
  fire(1, CustomColors.colorRed),
  water(2, CustomColors.colorDeepBlue),
  wind(3, CustomColors.colorGreen),
  light(4, CustomColors.colorGold),
  dark(5, CustomColors.colorPurple);

  final int value;
  final int color;
  const Talent(this.value, this.color);

  static Talent fromValue(int value) {
    for (var type in Talent.values) {
      if (type.value == value) {
        return type;
      }
    }
    return Talent.fire; // 默认值
  }

  String getName(AppLocalizations t) {
    switch (this) {
      case Talent.fire:
        return t.talent_fire;
      case Talent.water:
        return t.talent_water;
      case Talent.wind:
        return t.talent_wind;
      case Talent.light:
        return t.talent_light;
      case Talent.dark:
        return t.talent_dark;
    }
  }
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
  birthday;

  Color getColor() {
    return Color(switch (this) {
      ScheduleEventType.story => CustomColors.colorDeepPink,
      ScheduleEventType.gacha => CustomColors.colorRed,
      ScheduleEventType.freeGacha => CustomColors.colorGold,
      ScheduleEventType.campaign => CustomColors.colorDeepBlue,
      ScheduleEventType.clanBattle => CustomColors.colorOrange,
      ScheduleEventType.tower => CustomColors.colorDeepBlue,
      ScheduleEventType.specialDungeon => CustomColors.colorGold,
      ScheduleEventType.dimensionalFault => CustomColors.colorPurple,
      ScheduleEventType.colosseum => CustomColors.colorCyan,
      ScheduleEventType.abyss => CustomColors.colorRed,
      ScheduleEventType.dailyMission => CustomColors.colorGreen,
      ScheduleEventType.loginBonus => CustomColors.colorGold,
      ScheduleEventType.fortune => CustomColors.colorPink,
      ScheduleEventType.birthday => CustomColors.colorRed,
    });
  }

  IconData getIcon() {
    return switch (this) {
      ScheduleEventType.story => Icons.auto_stories_rounded,
      ScheduleEventType.gacha => Icons.stars_rounded,
      ScheduleEventType.freeGacha => Icons.redeem_rounded,
      ScheduleEventType.campaign => Icons.trending_up_rounded,
      ScheduleEventType.clanBattle => Icons.groups_2_rounded,
      ScheduleEventType.tower => Icons.apartment_rounded,
      ScheduleEventType.specialDungeon => Icons.landscape_rounded,
      ScheduleEventType.dimensionalFault => Icons.blur_circular_rounded,
      ScheduleEventType.colosseum => Icons.sports_martial_arts_rounded,
      ScheduleEventType.abyss => Icons.whatshot_rounded,
      ScheduleEventType.dailyMission => Icons.bolt_rounded,
      ScheduleEventType.loginBonus => Icons.card_giftcard_rounded,
      ScheduleEventType.fortune => Icons.emoji_events_rounded,
      ScheduleEventType.birthday => Icons.cake_rounded,
    };
  }
}
