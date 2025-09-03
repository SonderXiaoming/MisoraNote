import 'package:flutter/widgets.dart';

class L10n {
  static const supportedLocales = [Locale('en'), Locale('zh')];

  static const localizationsDelegates = <LocalizationsDelegate<dynamic>>[];
  // 若后续接入 Flutter gen_l10n：把生成的 AppLocalizations.delegate 放进来
}
