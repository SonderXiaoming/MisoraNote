import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/settings_page.dart';
import 'package:misora_note/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('changing the seed color does not reuse a disposed controller', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(
      ProviderScope(
        child: Consumer(
          builder: (context, ref, _) {
            final color = ref.watch(themeSeedColorProvider).value ?? 0xFF4F6BED;
            return MaterialApp(
              locale: const Locale('zh'),
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: const [
                ...AppLocalizations.localizationsDelegates,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Color(color)),
              ),
              home: const Scaffold(
                body: ThemeColorSettings(colorValue: 0xFF4F6BED),
              ),
            );
          },
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(ThemeColorSettings));
    await tester.pumpAndSettle();
    await tester.tap(find.bySemanticsLabel('#6750A4'));
    await tester.tap(find.text('应用'));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}
