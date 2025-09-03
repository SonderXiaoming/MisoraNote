import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';
import '../../features/home/home_page.dart';
import '../../features/settings/settings_page.dart';
import '../../constants.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      pageBuilder: (ctx, state) => const NoTransitionPage(child: HomePage()),
    ),
    GoRoute(
      path: AppRoutes.settings,
      pageBuilder:
          (ctx, state) => const NoTransitionPage(child: SettingsPage()),
    ),
  ],
  errorPageBuilder:
      (ctx, state) => NoTransitionPage(
        child: Center(child: Text('Route error: \\${state.error}')),
      ),
);
