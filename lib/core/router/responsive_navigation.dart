import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/l10n/app_localizations.dart';

enum NavigationType { mobile, tablet, desktop }

/// 导航项数据模型
class NavigationItem {
  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final String route;

  const NavigationItem({
    required this.label,
    required this.icon,
    this.selectedIcon,
    required this.route,
  });
}

/// 导航布局配置
class NavigationLayout extends StatelessWidget {
  final NavigationType type; // 导航类型
  final double? railMinExtendedWidth; // NavigationRail 最小扩展宽度
  final int currentIndex; // 当前选中的索引
  final Widget child; // 主体内容
  final List<NavigationItem> items; // 导航项列表

  const NavigationLayout({
    super.key,
    this.type = NavigationType.mobile,
    this.railMinExtendedWidth,
    required this.child,
    required this.items,
    required this.currentIndex,
  });

  // 导航到指定路由
  void _navigateToRoute(BuildContext context, String route) {
    if (GoRouterState.of(context).matchedLocation != route) {
      context.go(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (type == NavigationType.mobile) {
      // 手机端：使用底部导航栏
      return Scaffold(
        body: child,
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            _navigateToRoute(context, items[index].route);
          },
          destinations: items
              .map(
                (item) => NavigationDestination(
                  icon: Icon(item.icon),
                  selectedIcon: item.selectedIcon != null
                      ? Icon(item.selectedIcon)
                      : null,
                  label: item.label,
                ),
              )
              .toList(),
        ),
      );
    } else {
      // 平板/桌面端：使用侧边导航栏
      bool showRailExtended = false;
      double? railMinExtendedWidth;
      NavigationRailLabelType labelType = NavigationRailLabelType.selected;
      if (type == NavigationType.desktop) {
        // 桌面端：扩展侧边栏
        showRailExtended = true;
        labelType = NavigationRailLabelType.none;
        railMinExtendedWidth = 150;
      }
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: currentIndex,
              onDestinationSelected: (index) {
                _navigateToRoute(context, items[index].route);
              },
              extended: showRailExtended,
              minExtendedWidth: railMinExtendedWidth,
              labelType: labelType,
              destinations: items
                  .map(
                    (item) => NavigationRailDestination(
                      padding: EdgeInsets.symmetric(
                        horizontal: showRailExtended ? 16 : 0,
                      ),
                      icon: Icon(item.icon, size: 24),
                      selectedIcon: item.selectedIcon != null
                          ? Icon(item.selectedIcon, size: 24)
                          : Icon(item.icon, size: 24),
                      label: Text(
                        item.label,
                        style: TextStyle(
                          fontSize: showRailExtended ? 16 : 12,
                          fontWeight: showRailExtended
                              ? FontWeight.w500
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: child),
          ],
        ),
      );
    }
  }
}

/// 响应式导航组件
class ResponsiveNavigation extends StatelessWidget {
  final Widget child;

  const ResponsiveNavigation({super.key, required this.child});

  // 获取当前选中的索引
  int _getCurrentIndex(String currentRoute, List<NavigationItem> items) {
    for (int i = 0; i < items.length; i++) {
      if (currentRoute == items[i].route) {
        return i;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;
    final currentRoute = GoRouterState.of(context).matchedLocation;
    final navigationItems = [
      NavigationItem(
        label: t.home_page,
        icon: Icons.home_outlined,
        selectedIcon: Icons.home,
        route: AppRoutes.home,
      ),
      NavigationItem(
        label: t.function_page,
        icon: Icons.dashboard_outlined,
        selectedIcon: Icons.dashboard,
        route: AppRoutes.function,
      ),
      NavigationItem(
        label: t.settings_page,
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings,
        route: AppRoutes.settings,
      ),
    ];
    final currentIndex = _getCurrentIndex(currentRoute, navigationItems);

    NavigationType type;

    if (screenWidth <= 600) {
      // 窄屏（≤600px，手机）：底部导航栏
      type = NavigationType.mobile;
    } else if (screenWidth <= 1024) {
      // 中屏（600–1024px，平板/折叠屏）：窄侧边栏
      type = NavigationType.tablet;
    } else {
      // 宽屏（≥1024px，桌面）：扩展侧边栏
      type = NavigationType.desktop;
    }

    return NavigationLayout(
      type: type,
      currentIndex: currentIndex,
      items: navigationItems,
      child: child,
    );
  }
}
