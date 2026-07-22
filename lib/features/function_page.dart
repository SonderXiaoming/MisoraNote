import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/tool_entry.dart';
import 'package:misora_note/l10n/app_localizations.dart';

class FunctionPage extends StatelessWidget {
  const FunctionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final dataTools = [
      _ToolEntry(
        icon: Icons.people_alt_rounded,
        title: t.character_index,
        description: t.character_index_desc,
        color: colors.primary,
        onTap: () => context.push(AppRoutes.unitSearch, extra: <int>[]),
      ),
      _ToolEntry(
        icon: Icons.shield_rounded,
        title: t.unique_equip_list,
        description: t.unique_equip_desc,
        color: const Color(0xFFE8872E),
        onTap: () => context.push(AppRoutes.uniqueEquipList),
      ),
      _ToolEntry(
        icon: Icons.favorite_rounded,
        title: t.character_bond,
        description: t.character_bond_desc,
        color: const Color(0xFFD45A86),
        onTap: () => context.push(AppRoutes.characterBond),
      ),
    ];
    final battleTools = [
      _ToolEntry(
        icon: Icons.travel_explore_rounded,
        title: t.deep_zone,
        description: t.deep_zone_desc,
        color: const Color(CustomColors.colorRed),
        onTap: () => context.push(AppRoutes.deepZone),
      ),
      _ToolEntry(
        icon: Icons.groups_2_rounded,
        title: t.clan_battle_query,
        description: t.clan_battle_query_desc,
        color: const Color(0xFF8D5BD6),
        onTap: () => context.push(AppRoutes.enemySearch, extra: EnemyType.clan),
      ),
      _ToolEntry(
        icon: Icons.pest_control_rounded,
        title: t.enemy_search,
        description: t.enemy_search_desc,
        color: const Color(0xFF3B9B8F),
        onTap: () => context.push(AppRoutes.enemySearch),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.function_page,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
            sliver: SliverToBoxAdapter(
              child: ToolSectionTitle(
                icon: Icons.menu_book_rounded,
                title: t.game_data,
              ),
            ),
          ),
          _ToolGrid(entries: dataTools),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 26, 20, 8),
            sliver: SliverToBoxAdapter(
              child: ToolSectionTitle(
                icon: Icons.sports_martial_arts_rounded,
                title: t.battle_query,
              ),
            ),
          ),
          _ToolGrid(entries: battleTools),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}

class _ToolGrid extends StatelessWidget {
  final List<_ToolEntry> entries;

  const _ToolGrid({required this.entries});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 470,
          mainAxisExtent: 98,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final entry = entries[index];
          return ToolEntryCard(
            icon: entry.icon,
            title: entry.title,
            description: entry.description,
            accentColor: entry.color,
            onTap: entry.onTap,
          );
        }, childCount: entries.length),
      ),
    );
  }
}

class _ToolEntry {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final VoidCallback onTap;

  const _ToolEntry({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.onTap,
  });
}
