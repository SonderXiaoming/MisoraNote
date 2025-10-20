import 'package:shared_preferences/shared_preferences.dart';
import 'package:misora_note/constants.dart';

enum PrefsKeys {
  themeMode('theme_mode', 0),
  language('language', Language.zh),
  databaseArea('database_area', Area.cn),
  autoUpdate('auto_update', true),
  useOldVersion('use_old_version', false),
  appAutoUpdate('app_auto_update', true);

  final String key;
  final Object defaultValue;
  const PrefsKeys(this.key, this.defaultValue);
}

class Prefs {
  static Future<SharedPreferences> get _i async =>
      SharedPreferences.getInstance();

  static Future<void> setThemeMode(int mode) async {
    final p = await _i;
    await p.setInt(PrefsKeys.themeMode.key, mode);
  }

  static Future<int> themeMode() async {
    final p = await _i;
    return p.getInt(PrefsKeys.themeMode.key) ??
        PrefsKeys.themeMode.defaultValue as int;
  }

  static Future<void> setAppAutoUpdate(bool value) async {
    final p = await _i;
    await p.setBool(PrefsKeys.appAutoUpdate.key, value);
  }

  static Future<bool> appAutoUpdate() async {
    final p = await _i;
    return p.getBool(PrefsKeys.appAutoUpdate.key) ??
        PrefsKeys.appAutoUpdate.defaultValue as bool;
  }

  // 语言设置
  static Future<void> setLanguage(Language l) async {
    final p = await _i;
    await p.setString(PrefsKeys.language.key, l.code);
  }

  static Future<Language> language() async {
    final p = await _i;
    return p.get(PrefsKeys.language.key) != null
        ? Language.getType(p.getString(PrefsKeys.language.key)!)
        : PrefsKeys.language.defaultValue as Language;
  }

  // 数据库区域设置
  static Future<void> setDatabaseArea(Area area) async {
    final p = await _i;
    await p.setString(PrefsKeys.databaseArea.key, area.name);
  }

  static Future<Area> databaseArea() async {
    final p = await _i;
    final areaName = p.getString(PrefsKeys.databaseArea.key);
    return areaName != null
        ? Area.getType(areaName)
        : PrefsKeys.databaseArea.defaultValue as Area;
  }

  static Future<bool> needAutoUpdate() async {
    final p = await _i;
    return p.getBool(PrefsKeys.autoUpdate.key) ??
        (PrefsKeys.autoUpdate.defaultValue as bool);
  }

  static Future<void> setAutoUpdate(bool value) async {
    final p = await _i;
    await p.setBool(PrefsKeys.autoUpdate.key, value);
  }

  static Future<bool> useOldVersion() async {
    final p = await _i;
    return p.getBool(PrefsKeys.useOldVersion.key) ??
        (PrefsKeys.useOldVersion.defaultValue as bool);
  }

  static Future<void> setUseOldVersion(bool value) async {
    final p = await _i;
    await p.setBool(PrefsKeys.useOldVersion.key, value);
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
    await setThemeMode(PrefsKeys.themeMode.defaultValue as int);
    await setLanguage(PrefsKeys.language.defaultValue as Language);
    await setDatabaseArea(PrefsKeys.databaseArea.defaultValue as Area);
    await setAutoUpdate(PrefsKeys.autoUpdate.defaultValue as bool);
    await setUseOldVersion(PrefsKeys.useOldVersion.defaultValue as bool);
    await setAppAutoUpdate(PrefsKeys.appAutoUpdate.defaultValue as bool);
  }
}
