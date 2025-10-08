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

  static String getName(AppLocalizations t, UnitRankType type) {
    switch (type) {
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
  front,
  middle,
  back;

  static SearchAreaWidthType getType(int width) {
    if (width < 300) {
      return SearchAreaWidthType.front;
    } else if (width > 600) {
      return SearchAreaWidthType.back;
    } else {
      return SearchAreaWidthType.middle;
    }
  }

  static String getName(AppLocalizations t, SearchAreaWidthType type) {
    switch (type) {
      case SearchAreaWidthType.front:
        return t.position_front;
      case SearchAreaWidthType.back:
        return t.position_back;
      case SearchAreaWidthType.middle:
        return t.position_middle;
    }
  }

  static (int, int) getRange(SearchAreaWidthType type) {
    switch (type) {
      case SearchAreaWidthType.front:
        return (0, 299);
      case SearchAreaWidthType.back:
        return (601, 10000);
      case SearchAreaWidthType.middle:
        return (300, 600);
    }
  }

  static int getColor(SearchAreaWidthType type) {
    switch (type) {
      case SearchAreaWidthType.front:
        return CustomColors.colorOrange;
      case SearchAreaWidthType.back:
        return CustomColors.colorDeepBlue;
      case SearchAreaWidthType.middle:
        return CustomColors.colorGold;
    }
  }

  static LocalImage getIcon(
    SearchAreaWidthType type,
    double width,
    double height,
  ) {
    switch (type) {
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
  physical(1),
  magic(2);

  final int value;
  const AtkType(this.value);

  static int getColor(AtkType type) {
    switch (type) {
      case AtkType.physical:
        return CustomColors.colorGold;
      case AtkType.magic:
        return CustomColors.colorPurple;
    }
  }

  static LocalImage getIcon(AtkType type, double width, double height) {
    switch (type) {
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

  static LocalImage getSkillIcon(AtkType type, double width, double height) {
    switch (type) {
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

  static String getName(AppLocalizations t, AtkType type) {
    switch (type) {
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
  normal(1),
  limit(2),
  event(3),
  extra(4);

  final int value;
  const UnitGetType(this.value);

  static UnitGetType? fromValue(int value) {
    for (var type in UnitGetType.values) {
      if (type.value == value) {
        return type;
      }
    }
    return null;
  }

  static String getName(AppLocalizations t, UnitGetType type) {
    switch (type) {
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

  static int getColor(UnitGetType type) {
    switch (type) {
      case UnitGetType.normal:
        return CustomColors.colorGold;
      case UnitGetType.limit:
        return CustomColors.colorOrange;
      case UnitGetType.event:
        return CustomColors.colorGreen;
      case UnitGetType.extra:
        return CustomColors.colorDeepBlue;
    }
  }
}

enum EnemyType { all, normal, event, tower, shiori, sre, talentQuest }

enum UnitType { unit, enemy, summon, enemySummon }

enum Talent {
  fire(1),
  water(2),
  wind(3),
  light(4),
  dark(5);

  final int value;
  const Talent(this.value);

  static Talent fromValue(int value) {
    for (var type in Talent.values) {
      if (type.value == value) {
        return type;
      }
    }
    return Talent.fire; // 默认值
  }

  static String getName(AppLocalizations t, Talent type) {
    switch (type) {
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

  static int getColor(Talent type) {
    switch (type) {
      case Talent.fire:
        return CustomColors.colorRed;
      case Talent.water:
        return CustomColors.colorDeepBlue;
      case Talent.wind:
        return CustomColors.colorGreen;
      case Talent.light:
        return CustomColors.colorGold;
      case Talent.dark:
        return CustomColors.colorPurple;
    }
  }
}
