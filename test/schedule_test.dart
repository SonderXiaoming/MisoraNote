import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/schedule_section.dart';
import 'package:misora_note/l10n/app_localizations.dart';

GameScheduleEvent event({
  required String id,
  required DateTime start,
  required DateTime end,
  ScheduleEventType type = ScheduleEventType.story,
  String? title,
  String subtitle = '',
  String badgeLabel = '',
}) {
  return GameScheduleEvent(
    id: id,
    title: title ?? id,
    subtitle: subtitle,
    type: type,
    startTime: start,
    endTime: end,
    badgeLabel: badgeLabel,
  );
}

void main() {
  group('ScheduleOverview', () {
    final now = DateTime.utc(2026, 7, 22, 12);

    test('splits active and future events and ignores expired events', () {
      final overview = ScheduleOverview.fromEvents([
        event(
          id: 'active',
          start: now.subtract(const Duration(hours: 1)),
          end: now.add(const Duration(hours: 2)),
        ),
        event(
          id: 'future',
          start: now.add(const Duration(days: 1)),
          end: now.add(const Duration(days: 2)),
        ),
        event(
          id: 'expired',
          start: now.subtract(const Duration(days: 2)),
          end: now.subtract(const Duration(days: 1)),
        ),
      ], now: now);

      expect(overview.inProgress.map((item) => item.id), ['active']);
      expect(overview.comingSoon.map((item) => item.id), ['future']);
    });

    test('treats start as inclusive and end as exclusive', () {
      final startingNow = event(
        id: 'starting',
        start: now,
        end: now.add(const Duration(hours: 1)),
      );
      final endingNow = event(
        id: 'ending',
        start: now.subtract(const Duration(hours: 1)),
        end: now,
      );

      expect(startingNow.isInProgressAt(now), isTrue);
      expect(endingNow.isInProgressAt(now), isFalse);
    });

    test('sorts active events by end and future events by start', () {
      final overview = ScheduleOverview.fromEvents([
        event(
          id: 'active-later',
          start: now.subtract(const Duration(hours: 1)),
          end: now.add(const Duration(hours: 4)),
        ),
        event(
          id: 'future-later',
          start: now.add(const Duration(days: 3)),
          end: now.add(const Duration(days: 4)),
        ),
        event(
          id: 'active-sooner',
          start: now.subtract(const Duration(hours: 1)),
          end: now.add(const Duration(hours: 1)),
        ),
        event(
          id: 'future-sooner',
          start: now.add(const Duration(days: 1)),
          end: now.add(const Duration(days: 2)),
        ),
      ], now: now);

      expect(overview.inProgress.map((item) => item.id), [
        'active-sooner',
        'active-later',
      ]);
      expect(overview.comingSoon.map((item) => item.id), [
        'future-sooner',
        'future-later',
      ]);
    });
  });

  testWidgets('renders both schedule lanes on a compact screen', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 700));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final now = DateTime.utc(2026, 7, 22, 12);
    final overview = ScheduleOverview(
      inProgress: [
        event(
          id: '剧情活动',
          start: now.subtract(const Duration(hours: 1)),
          end: now.add(const Duration(hours: 2)),
        ),
      ],
      comingSoon: [
        event(
          id: '公会战',
          start: now.add(const Duration(days: 1)),
          end: now.add(const Duration(days: 2)),
        ),
      ],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          scheduleOverviewProvider.overrideWith((ref) async => overview),
        ],
        child: MaterialApp(
          locale: const Locale('zh'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: const Scaffold(
            body: SingleChildScrollView(child: HomeScheduleSection()),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('日程'), findsOneWidget);
    expect(find.text('进行中活动'), findsOneWidget);
    expect(find.text('活动预告'), findsOneWidget);
    expect(find.text('剧情活动'), findsOneWidget);
    expect(find.text('公会战'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('shows limited and permanent labels on gacha cards', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(900, 700));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final now = DateTime.utc(2026, 7, 22, 12);
    final overview = ScheduleOverview(
      inProgress: [
        event(
          id: 'limited-gacha',
          title: '精选扭蛋',
          start: now.subtract(const Duration(hours: 1)),
          end: now.add(const Duration(days: 1)),
          type: ScheduleEventType.gacha,
          badgeLabel: '限定',
        ),
        event(
          id: 'permanent-gacha',
          title: '精选扭蛋',
          start: now.subtract(const Duration(hours: 1)),
          end: now.add(const Duration(days: 2)),
          type: ScheduleEventType.gacha,
          badgeLabel: '常驻',
        ),
      ],
      comingSoon: const [],
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          scheduleOverviewProvider.overrideWith((ref) async => overview),
        ],
        child: const MaterialApp(
          locale: Locale('zh'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(
            body: SingleChildScrollView(child: HomeScheduleSection()),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('限定'), findsOneWidget);
    expect(find.text('常驻'), findsOneWidget);
    expect(find.text('扭蛋'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
