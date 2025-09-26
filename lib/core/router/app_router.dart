import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/core/router/transition.dart';
import 'package:flutter/widgets.dart';
import 'package:misora_note/core/router/page_extra.dart';
import 'package:misora_note/features/unit_page.dart';
import 'package:misora_note/features/unit_search.dart';
import 'package:misora_note/core/navigation/responsive_navigation.dart';
import '../../features/home_page.dart';
import '../../features/settings_page.dart';
import '../../constants.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) => ResponsiveNavigation(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.home,
          pageBuilder: (ctx, state) =>
              FadeSlideScaleTransitionPage(child: HomePage()),
        ),
        GoRoute(
          path: AppRoutes.settings,
          pageBuilder: (ctx, state) =>
              FadeSlideScaleTransitionPage(child: SettingsPage()),
        ),
      ],
    ),
    GoRoute(
        path: AppRoutes.unitSearch,
        pageBuilder: (ctx, state) => FadeSlideScaleTransitionPage(
            child: UnitSearch(perUnitIds: state.extra as List<int>))),
    GoRoute(
      path: AppRoutes.unitDetail,
      pageBuilder: (ctx, state) {
        final data = state.extra as UnitPageExtra;
        return FadeSlideScaleTransitionPage(
            child: UnitPage(card: data.card, unitId: data.unitId));
      },
    ),
  ],
  errorPageBuilder: (ctx, state) => FadeSlideScaleTransitionPage(
    child: Center(child: Text('Route error: \\${state.error}')),
  ),
);
