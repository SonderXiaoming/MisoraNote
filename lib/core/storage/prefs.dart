import 'package:shared_preferences/shared_preferences.dart';

class PrefsKeys {
  static const themeMode = 'theme_mode';
}

class Prefs {
  static Future<SharedPreferences> get _i async =>
      SharedPreferences.getInstance();

  static Future<void> setThemeMode(int mode) async {
    final p = await _i;
    await p.setInt(PrefsKeys.themeMode, mode);
  }

  static Future<int?> themeMode() async {
    final p = await _i;
    return p.getInt(PrefsKeys.themeMode);
  }
}
