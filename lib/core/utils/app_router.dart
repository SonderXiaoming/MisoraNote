import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';
import 'package:kanna_note/core/component/image.dart';
import 'package:kanna_note/core/db/model.dart';
import 'package:kanna_note/features/unit_detail/unit_page.dart';
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
    GoRoute(
      path: AppRoutes.unitDetail,
      pageBuilder: (ctx, state) {
        final data = state.extra as UnitPageExtra;
        return NoTransitionPage(
          child: UnitPage(unitInfo: data.unitInfo, unitImage: data.cachedImage),
        );
      },
    ),
  ],
  errorPageBuilder:
      (ctx, state) => NoTransitionPage(
        child: Center(child: Text('Route error: \\${state.error}')),
      ),
);

class UnitPageExtra {
  final UnitInfo unitInfo;
  final CachedImage cachedImage;

  UnitPageExtra({required this.unitInfo, required this.cachedImage});
}
