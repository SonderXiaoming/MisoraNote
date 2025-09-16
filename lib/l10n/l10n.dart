import 'package:flutter/widgets.dart';
import 'app_localizations.dart';

class L10n {
  static const supportedLocales = AppLocalizations.supportedLocales;

  static const localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    AppLocalizations.delegate,
  ];
}
