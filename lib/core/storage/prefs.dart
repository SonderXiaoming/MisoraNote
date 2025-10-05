import 'package:shared_preferences/shared_preferences.dart';
import 'package:misora_note/constants.dart';

class PrefsKeys {
  static const themeMode = 'theme_mode';
  static const language = 'language';
  static const databaseArea = 'database_area';
}

/// 默认偏好设置值
class DefaultPrefs {
  /// 主题模式: 0-系统, 1-浅色, 2-深色
  static const int themeMode = 0;

  // 自动更新
  static const bool appAutoUpdate = true;

  /// 默认语言: 'zh'-中文, 'en'-英文, 'ja'-日文, ''-系统默认
  static const Language language = Language.zh;

  /// 默认数据库区域: 中国服务器
  static const Area databaseArea = Area.cn;

  /// 是否自动检查更新
  static const bool autoUpdate = true;

  /// 是否使用旧版本的数据库格式
  static const bool useOldVersion = false;
}

class Prefs {
  static Future<SharedPreferences> get _i async =>
      SharedPreferences.getInstance();

  static Future<void> setThemeMode(int mode) async {
    final p = await _i;
    await p.setInt(PrefsKeys.themeMode, mode);
  }

  static Future<int> themeMode() async {
    final p = await _i;
    return p.getInt(PrefsKeys.themeMode) ?? DefaultPrefs.themeMode;
  }

  static Future<void> setAppAutoUpdate(bool value) async {
    final p = await _i;
    await p.setBool('app_auto_update', value);
  }

  static Future<bool> appAutoUpdate() async {
    final p = await _i;
    return p.getBool('app_auto_update') ?? DefaultPrefs.appAutoUpdate;
  }

  // 语言设置
  static Future<void> setLanguage(String languageCode) async {
    final p = await _i;
    await p.setString(PrefsKeys.language, languageCode);
  }

  static Future<String> language() async {
    final p = await _i;
    return p.getString(PrefsKeys.language) ?? DefaultPrefs.language.code;
  }

  // 数据库区域设置
  static Future<void> setDatabaseArea(Area area) async {
    final p = await _i;
    await p.setString(PrefsKeys.databaseArea, area.name);
  }

  static Future<Area> databaseArea() async {
    final p = await _i;
    final areaName = p.getString(PrefsKeys.databaseArea);
    return Area.getType(areaName ?? DefaultPrefs.databaseArea.name);
  }

  static Future<bool> needAutoUpdate() async {
    final p = await _i;
    return p.getBool('auto_update') ?? true;
  }

  static Future<void> setAutoUpdate(bool value) async {
    final p = await _i;
    await p.setBool('auto_update', value);
  }

  static Future<bool> useOldVersion() async {
    final p = await _i;
    return p.getBool('use_old_version') ?? false;
  }

  static Future<void> setUseOldVersion(bool value) async {
    final p = await _i;
    await p.setBool('use_old_version', value);
  }

  static Future<String?> dbVersion(Area area) async {
    final p = await _i;
    return p.getString('db_version_${area.name}');
  }

  static Future<void> setDbVersion(Area area, String version) async {
    final p = await _i;
    await p.setString('db_version_${area.name}', version);
  }

  // 清除所有偏好设置
  static Future<void> clear() async {
    final p = await _i;
    await p.clear();
  }

  // 恢复所有设置到默认值
  static Future<void> resetToDefaults() async {
    final p = await _i;

    // 设置默认值而不是清空
    await p.setInt(PrefsKeys.themeMode, DefaultPrefs.themeMode);
    await p.setString(PrefsKeys.language, DefaultPrefs.language.code);
    await p.setString(PrefsKeys.databaseArea, DefaultPrefs.databaseArea.name);
    await p.setBool('auto_update', DefaultPrefs.autoUpdate); // 默认启用自动更新
    await p.setBool('use_old_version', DefaultPrefs.useOldVersion); // 默认不使用旧版本
  }
}
