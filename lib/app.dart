import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/l10n.dart';
import 'core/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final light = FlexThemeData.light(scheme: FlexScheme.blueM3);
    final dark = FlexThemeData.dark(scheme: FlexScheme.blueM3);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: light,
      darkTheme: dark,
      routerConfig: appRouter,
      locale: const Locale('zh'),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: const [
        ...L10n.localizationsDelegates,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
