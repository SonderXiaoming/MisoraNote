import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/core/router/transition.dart';
import 'package:flutter/widgets.dart';
import 'package:misora_note/core/router/page_extra.dart';
import 'package:misora_note/features/unit_detail/unit_page.dart';
import '../../features/home/home_page.dart';
import '../../features/settings/settings_page.dart';
import '../../constants.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      pageBuilder:
          (ctx, state) => FadeSlideScaleTransitionPage(child: HomePage()),
    ),
    GoRoute(
      path: AppRoutes.settings,
      pageBuilder:
          (ctx, state) => FadeSlideScaleTransitionPage(child: SettingsPage()),
    ),
    GoRoute(
      path: AppRoutes.unitDetail,
      pageBuilder: (ctx, state) {
        final data = state.extra as UnitPageExtra;
        return FadeSlideScaleTransitionPage(
          child: UnitPage(unitInfo: data.unitInfo, card: data.card),
        );
      },
    ),
  ],
  errorPageBuilder:
      (ctx, state) => FadeSlideScaleTransitionPage(
        child: Center(child: Text('Route error: \\${state.error}')),
      ),
);
