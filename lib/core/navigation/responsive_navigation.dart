import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/l10n/app_localizations.dart';

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

/// 响应式导航组件
class ResponsiveNavigation extends StatelessWidget {
  final Widget child;

  const ResponsiveNavigation({
    super.key,
    required this.child,
  });

  // 获取导航项列表
  List<NavigationItem> _getNavigationItems(AppLocalizations t) {
    return [
      NavigationItem(
        label: "主页",
        icon: Icons.home_outlined,
        selectedIcon: Icons.home,
        route: AppRoutes.home,
      ),
      NavigationItem(
        label: '设置',
        icon: Icons.settings_outlined,
        selectedIcon: Icons.settings,
        route: AppRoutes.settings,
      ),
    ];
  }

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
    final navigationItems = _getNavigationItems(t);
    final currentIndex = _getCurrentIndex(currentRoute, navigationItems);

    // 窄屏（≤600px，手机）：BottomNavigationBar + 顶部 AppBar
    if (screenWidth <= 600) {
      return _buildMobileLayout(context, navigationItems, currentIndex);
    }
    // 中屏（600–1024px，平板/折叠屏）：NavigationRail（左侧窄栏）
    else if (screenWidth <= 1024) {
      return _buildTabletLayout(context, navigationItems, currentIndex);
    }
    // 宽屏（≥1024px，桌面）：NavigationRail extended（永久侧边栏）
    else {
      return _buildDesktopLayout(context, navigationItems, currentIndex);
    }
  }

  // 窄屏（≤600px，手机）：BottomNavigationBar + 顶部 AppBar
  Widget _buildMobileLayout(
    BuildContext context,
    List<NavigationItem> items,
    int currentIndex,
  ) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          _navigateToRoute(context, items[index].route);
        },
        destinations: items
            .map((item) => NavigationDestination(
                  icon: Icon(item.icon),
                  selectedIcon: item.selectedIcon != null
                      ? Icon(item.selectedIcon)
                      : null,
                  label: item.label,
                ))
            .toList(),
      ),
    );
  }

  // 中屏（600–1024px，平板/折叠屏）：NavigationRail（左侧窄栏，图标为主）
  Widget _buildTabletLayout(
    BuildContext context,
    List<NavigationItem> items,
    int currentIndex,
  ) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: currentIndex,
            onDestinationSelected: (index) {
              _navigateToRoute(context, items[index].route);
            },
            labelType: NavigationRailLabelType.selected, // 只显示选中项的文字
            groupAlignment: -0.8,
            destinations: items
                .map((item) => NavigationRailDestination(
                      icon: Icon(item.icon, size: 24),
                      selectedIcon: item.selectedIcon != null
                          ? Icon(item.selectedIcon, size: 24)
                          : Icon(item.icon, size: 24),
                      label: Text(
                        item.label,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ))
                .toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }

  // 宽屏（≥1024px，桌面）：NavigationRail extended（永久侧边栏）
  Widget _buildDesktopLayout(
    BuildContext context,
    List<NavigationItem> items,
    int currentIndex,
  ) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      body: Row(
        children: [
          // 扩展的 NavigationRail（永久侧边栏）
          NavigationRail(
            selectedIndex: currentIndex,
            onDestinationSelected: (index) {
              _navigateToRoute(context, items[index].route);
            },
            extended: true, // 扩展模式，显示完整文本
            minExtendedWidth: 200, // 最小宽度
            labelType: NavigationRailLabelType.none, // 扩展模式下不需要额外标签
            groupAlignment: -0.8,
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.auto_awesome,
                    color: Color(CustomColors.colorPrimary),
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    t.app_name,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Color(CustomColors.colorPrimary),
                    ),
                  ),
                ],
              ),
            ),
            destinations: items
                .map((item) => NavigationRailDestination(
                      icon: Icon(item.icon, size: 24),
                      selectedIcon: item.selectedIcon != null
                          ? Icon(item.selectedIcon, size: 24)
                          : Icon(item.icon, size: 24),
                      label: Text(
                        item.label,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ))
                .toList(),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }

  // 导航到指定路由
  void _navigateToRoute(BuildContext context, String route) {
    if (GoRouterState.of(context).matchedLocation != route) {
      context.go(route);
    }
  }
}
