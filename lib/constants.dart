import 'package:path/path.dart' as p;

enum Area { jp, tw, cn }

enum UnitRankType { lastUpdate }

const double ratioGolden = 0.618;

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
  static const base = "resources";
  static String db(Area area) => p.join(base, 'db', 'redive_${area.name}.db');
  static String fullcard(int id, int star) =>
      p.join(base, 'fullcard', 'fullcard_unit_$id${star}1.png');
  static String skillIcon(int skillIconId) =>
      p.join(base, 'icon', 'skill', '$skillIconId.png');
  static String equipment(int equipmentIconId) =>
      p.join(base, 'icon', 'equipment', '$equipmentIconId.png');
  static String enemyIcon(int enemyIconId) =>
      p.join(base, 'icon', 'unit', '$enemyIconId.png');
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

enum SkillTextType {
  ub("连结爆发"),
  ubPlus("连结爆发+"),
  skill1("技能1"),
  skill1Plus("技能1+"),
  skill2("技能2"),
  skill2Plus("技能2+"),
  skill3("技能3"),
  skill4("技能4"),
  skill5("技能5"),
  skill6("技能6"),
  skill7("技能7"),
  skill8("技能8"),
  skill9("技能9"),
  skill10("技能10"),
  exSkill("额外技能"),
  exSkillPlus("额外技能+"),
  exSkill2("额外技能2"),
  exSkill2Plus("额外技能2+"),
  exSkill3("额外技能3"),
  exSkill3Plus("额外技能3+"),
  exSkill4("额外技能4"),
  exSkill4Plus("额外技能4+"),
  exSkill5("额外技能5"),
  exSkill5Plus("额外技能5+"),
  spUb("SP连结爆发"),
  spSkill1("SP技能1"),
  spSkill1Plus("SP技能1+"),
  spSkill2("SP技能2"),
  spSkill2Plus("SP技能2+"),
  spSkill3("SP技能3");

  final String value;
  const SkillTextType(this.value);
  static SkillTextType? fromValue(String value) {
    for (var type in SkillTextType.values) {
      if (type.value == value) {
        return type;
      }
    }
    return null;
  }

  static int getColor(SkillTextType type) {
    switch (type) {
      case SkillTextType.ub:
      case SkillTextType.ubPlus:
      case SkillTextType.spUb:
        return CustomColors.colorGold;
      case SkillTextType.skill1:
      case SkillTextType.skill1Plus:
      case SkillTextType.spSkill1:
      case SkillTextType.spSkill1Plus:
        return CustomColors.colorPurple;
      case SkillTextType.skill2:
      case SkillTextType.skill2Plus:
      case SkillTextType.spSkill2:
      case SkillTextType.spSkill2Plus:
        return CustomColors.colorRed;
      case SkillTextType.exSkill:
      case SkillTextType.exSkillPlus:
      case SkillTextType.spSkill3:
        return CustomColors.colorOrange;
      default:
        return CustomColors.colorBlack;
    }
  }
}
