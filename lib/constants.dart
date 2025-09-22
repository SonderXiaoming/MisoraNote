import 'package:path/path.dart' as p;
import 'package:misora_note/l10n/app_localizations.dart';
import 'package:misora_note/features/component/image.dart';

enum Area { jp, tw, cn }

enum UnitRankType { lastUpdate }

final double ratioGolden = 0.618;

class FetchUrl {
  static const estertionBase = "https://redive.estertion.win";
  static const wtheeBase = "https://wthee.xyz";

  static String db(Area area) =>
      "${FetchUrl.wtheeBase}/db/redive_${area.name}.db.br";

  static String teaser(Area area, int teaserId) =>
      "${FetchUrl.wtheeBase}/redive/${area.name}/resource/event/teaser/$teaserId.webp";

  static String fullcardUrl(int id, int star) =>
      "${FetchUrl.estertionBase}/card/full/$id${star}1.webp";

  static String skillIconUrl(int skillIconId) =>
      "${FetchUrl.estertionBase}/icon/skill/$skillIconId.webp";
  static String equipmentIconUrl(int equipmentIconId) =>
      "${FetchUrl.estertionBase}/icon/equipment/$equipmentIconId.webp";
  static String enemyIconUrl(int enemyIconId) =>
      "${FetchUrl.estertionBase}/icon/unit/$enemyIconId.webp";
}

class FilePath {
  static final base = "resources";
  static final img = p.join(base, 'img');
  static String db(Area area) => p.join(base, 'db', 'redive_${area.name}.db');
  static String fullcard(int id, int star) =>
      p.join(base, 'fullcard', 'fullcard_unit_$id${star}1.png');
  static String uniqueNumIcon(int num) => p.join(img, 'unique_$num.png');
  static String skillIcon(int skillIconId) =>
      p.join(img, 'skill', '$skillIconId.png');
  static String equipment(int equipmentIconId) =>
      p.join(img, 'equipment', '$equipmentIconId.png');
  static String enemyIcon(int enemyIconId) =>
      p.join(img, 'unit', '$enemyIconId.png');
  static String teaser(int teaserId) => p.join(base, 'teaser', '$teaserId.png');
}

class AppRoutes {
  static const splash = '/';
  static const home = '/home';
  static const settings = '/settings';
  static const unitDetail = '/unitDetail';
}

class CustomColors {
  static const colorPrimary = 0xFFa24072;
  static const colorWhite = 0xFFFFFCFE;
  static const colorBlack = 0xFF0D0F0F;
  static const colorGray = 0xFF9C9C9C;

  //遮罩颜色
  static const maskAlpha = 0.7;
  static const maskStartAlpha = 0.3;

  static const colorBlue = 0xFFB9E3F3; //浅蓝、Rank 1
  static const colorCopper = 0xFFC28662; //铜、Rank 2 ~ 3
  static const colorSilver = 0xFFB9C8DA; //银、Rank 4 ~ 6
  static const colorGold = 0xFFEBA827; //金、Rank 7 ~ 10
  static const colorPurple = 0xFFb86ada; //紫、Rank
  static const colorRed = 0xFFe65d49; //红、Rank 18 ~ 20
  static const colorGreen = 0xFF5EB56D; //绿、Rank
  static const colorOrange = 0xFFFF883E; //橙、Rank 24 ~ 27
  static const colorCyan = 0xFF65B0FA; //青、Rank 28 ~ 31
  static const colorPink = 0xFFFFB6C1; //粉、ex装备4星、Rank 32 ~ ？
  static const colorDeepBlue = 0xFF578DE6; //深蓝
  static const colorDeepPink = 0xFFD854CC; //深粉
}

class PCRLevelLimit {
  //属性变化等级，300级后，回避等属性转换为其他属性
  static const int otherLimitLevel = 300;
  //tp属性变化等级，260级后，tp回复将转化为攻击力
  static const int tpLimitLevel = 260;
}

class SkillTag {
  static const tagColorMap = {
    "<": 0xFFa24072,
    "[": 0xFF7aa57b,
    "『": 0xFFa24072,
    "{": 0xFFb476cd,
  };

  static const Map<String, String> tagPairs = {
    "<": ">",
    "[": "]",
    "『": "』",
    "{": "}",
  };

  static int tagColor(String tag) =>
      SkillTag.tagColorMap[tag] ?? CustomColors.colorBlack;

  static String getPair(String tag) => SkillTag.tagPairs[tag] ?? "";
}

enum SearchAreaWidthType {
  front,
  back,
  middle;

  static SearchAreaWidthType getType(int width) {
    if (width < 300) {
      return SearchAreaWidthType.front;
    } else if (width > 600) {
      return SearchAreaWidthType.back;
    } else {
      return SearchAreaWidthType.middle;
    }
  }

  static int getColor(SearchAreaWidthType type) {
    switch (type) {
      case SearchAreaWidthType.front:
        return CustomColors.colorOrange;
      case SearchAreaWidthType.back:
        return CustomColors.colorBlue;
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
  physical,
  magic;

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
