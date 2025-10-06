import 'package:path/path.dart' as p;

const githubOwner = 'YourUser';
const githubRepo = 'YourRepo';

enum Area {
  jp("jp"),
  tw("tw"),
  cn("cn");

  const Area(this.name);
  final String name;

  static Area getType(String name) {
    switch (name) {
      case "jp":
        return Area.jp;
      case "tw":
        return Area.tw;
      case "cn":
        return Area.cn;
      default:
        return Area.cn;
    }
  }
}

enum Language {
  zh("zh"),
  en("en"),
  ja("ja");

  const Language(this.code);
  final String code;

  static String getDisplayName(Language language) {
    switch (language) {
      case Language.zh:
        return "中文";
      case Language.en:
        return "English";
      case Language.ja:
        return "日本語";
    }
  }

  static Language getType(String code) {
    switch (code) {
      case "zh":
        return Language.zh;
      case "en":
        return Language.en;
      case "ja":
        return Language.ja;
      default:
        return Language.zh;
    }
  }
}

final double ratioGolden = 0.618;

class FetchUrl {
  static const estertionBase = "https://redive.estertion.win";
  static const wtheeBase = "https://wthee.xyz";

  static String dbVersion = "${FetchUrl.wtheeBase}/pcr/api/v1/db/info/v2";

  static String dbLatestVersion = "${FetchUrl.wtheeBase}/pcr/api/v1/db/info/v2";

  static String db(Area area) {
    /*
    if (area == Area.cn) {
      return "${FetchUrl.estertionBase}/db/redive_${area.name}.db.br";
    }
    */
    return "${FetchUrl.wtheeBase}/db/redive_${area.name}.db.br";
  }

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
  static const function = '/function';
  static const settings = '/settings';
  static const about = '/about';
  static const unitDetail = '/unitDetail';
  static const unitSearch = '/unitSearch';
  static const enemySearch = '/enemySearch';
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
