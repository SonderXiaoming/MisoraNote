import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/card/unit_card.dart';
import 'package:misora_note/features/component/custom_icon.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/enemy_search/clan_battle.dart';
import 'package:misora_note/l10n/app_localizations.dart';

class EnemySearch extends StatefulWidget {
  final EnemyType searchType;

  const EnemySearch({super.key, this.searchType = EnemyType.all});

  @override
  State<EnemySearch> createState() => _EnemySearchState();
}

class _EnemySearchState extends State<EnemySearch> {
  final SearchController searchController = SearchController();
  final FocusNode searchFocusNode = FocusNode();
  late EnemyType searchType;
  String searchQuery = '';
  bool isSearchById = false;
  bool isAscending = false;
  int? clanBattleId;

  bool get _isClanBattle => searchType == EnemyType.clan;
  bool get _useNumericKeyboard => _isClanBattle || isSearchById;

  @override
  void initState() {
    super.initState();
    searchType = widget.searchType;
    isSearchById = searchType == EnemyType.clan;
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchSubmit(String value) {
    final query = value.trim();
    final numericId = int.tryParse(query);
    if (searchType == EnemyType.all &&
        numericId != null &&
        numericId >= 1000 &&
        numericId <= 9999) {
      setState(() {
        searchType = EnemyType.clan;
        isSearchById = true;
        searchQuery = query;
        clanBattleId = numericId;
      });
      return;
    }
    if (_isClanBattle) {
      setState(() {
        searchQuery = query;
        clanBattleId = numericId != null && numericId > 0 ? numericId : null;
      });
      return;
    }

    setState(() => searchQuery = query);
    if (!isSearchById) return;

    final enemyId = numericId;
    if (enemyId == null || enemyId <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请输入有效的敌人ID')));
      return;
    }
    final width = MediaQuery.sizeOf(context).width;
    context.push(
      AppRoutes.unitDetail,
      extra: UnitCard(
        unitId: enemyId,
        unitType: UnitType.enemy,
        enemyType: searchType,
        size: (width, 200),
      ),
    );
  }

  void _toggleSearchMode() {
    if (_isClanBattle) return;
    setState(() {
      isSearchById = !isSearchById;
      searchQuery = '';
      searchController.clear();
    });
    searchFocusNode.requestFocus();
  }

  void _changeEnemyType(EnemyType newType) {
    if (newType == searchType) return;
    setState(() {
      searchType = newType;
      searchQuery = '';
      clanBattleId = null;
      isSearchById = newType == EnemyType.clan;
      searchController.clear();
    });
  }

  void _clearSearch() {
    searchController.clear();
    setState(() {
      searchQuery = '';
      clanBattleId = null;
    });
    searchFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Scaffold(
      body: Column(
        children: [
          Material(
            color: colors.surface,
            elevation: 1,
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.paddingOf(context).top + 8,
                left: 12,
                right: 12,
                bottom: 10,
              ),
              child: Row(
                children: [
                  const CustomIconButton(backgroundSize: 40, paddingValue: 0),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SearchBar(
                      controller: searchController,
                      focusNode: searchFocusNode,
                      hintText: _isClanBattle
                          ? t.clan_battle_id_hint
                          : searchType == EnemyType.all
                          ? t.enemy_search_hint
                          : isSearchById
                          ? t.search_hit_id
                          : t.search_hit_name,
                      onChanged: (value) =>
                          setState(() => searchQuery = value.trim()),
                      onSubmitted: _onSearchSubmit,
                      textInputAction: TextInputAction.search,
                      keyboardType: _useNumericKeyboard
                          ? TextInputType.number
                          : TextInputType.text,
                      leading: Icon(Icons.search, color: colors.primary),
                      trailing: searchQuery.isNotEmpty
                          ? [
                              IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: _clearSearch,
                              ),
                            ]
                          : null,
                      backgroundColor: WidgetStatePropertyAll(
                        colors.surfaceContainerLowest,
                      ),
                      shadowColor: const WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                      side: WidgetStateProperty.resolveWith((states) {
                        return BorderSide(
                          color: states.contains(WidgetState.focused)
                              ? colors.primary
                              : colors.outlineVariant,
                          width: states.contains(WidgetState.focused) ? 2 : 1,
                        );
                      }),
                    ),
                  ),
                  const SizedBox(width: 4),
                  CustomIconButton(
                    backgroundColor: Colors.transparent,
                    onTap: _toggleSearchMode,
                    child: Icon(
                      _isClanBattle
                          ? Icons.groups_2_outlined
                          : isSearchById
                          ? Icons.tag
                          : Icons.person_search_outlined,
                      color: _isClanBattle
                          ? colors.onSurfaceVariant
                          : colors.primary,
                    ),
                  ),
                  PopupMenuButton<EnemyType>(
                    tooltip: searchType.getName(t),
                    onSelected: _changeEnemyType,
                    position: PopupMenuPosition.under,
                    color: colors.surfaceContainerHigh,
                    itemBuilder: (context) => [
                      for (final type in EnemyType.values)
                        PopupMenuItem(
                          value: type,
                          child: Row(
                            children: [
                              Icon(
                                type == searchType
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                size: 18,
                                color: type == searchType
                                    ? colors.primary
                                    : colors.outline,
                              ),
                              const SizedBox(width: 9),
                              Text(type.getName(t)),
                            ],
                          ),
                        ),
                    ],
                    icon: Icon(Icons.tune_rounded, color: colors.primary),
                  ),
                  IconButton(
                    tooltip: isAscending ? t.sort_descending : t.sort_ascending,
                    onPressed: () => setState(() => isAscending = !isAscending),
                    icon: Icon(
                      isAscending
                          ? Icons.arrow_upward_rounded
                          : Icons.arrow_downward_rounded,
                      color: colors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: _isClanBattle
                ? ClanBattleResults(
                    clanBattleId: clanBattleId,
                    ascending: isAscending,
                  )
                : searchQuery.isEmpty
                ? _EnemyIdHelp(searchType: searchType)
                : _EnemyParameterResults(
                    search: searchQuery,
                    searchType: searchType,
                    searchById: isSearchById,
                    ascending: isAscending,
                  ),
          ),
        ],
      ),
    );
  }
}

class _EnemyIdHelp extends StatelessWidget {
  final EnemyType searchType;

  const _EnemyIdHelp({required this.searchType});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.manage_search_rounded, size: 64, color: colors.primary),
            const SizedBox(height: 16),
            Text(
              searchType.getName(AppLocalizations.of(context)!),
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(
              t.enemy_search_help,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}

class _EnemyParameterResults extends ConsumerWidget {
  final String search;
  final EnemyType searchType;
  final bool searchById;
  final bool ascending;

  const _EnemyParameterResults({
    required this.search,
    required this.searchType,
    required this.searchById,
    required this.ascending,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final filter = (
      search: search,
      type: searchType,
      searchById: searchById,
      ascending: ascending,
    );
    final result = ref.watch(enemySearchProvider(filter));
    return result.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline_rounded, size: 48),
              const SizedBox(height: 12),
              Text(error.toString(), textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => ref.invalidate(enemySearchProvider(filter)),
                icon: const Icon(Icons.refresh_rounded),
                label: Text(t.retry),
              ),
            ],
          ),
        ),
      ),
      data: (items) {
        if (items.isEmpty) return Center(child: Text(t.no_search_result));
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 32),
          itemCount: items.length,
          separatorBuilder: (_, _) => const SizedBox(height: 8),
          itemBuilder: (context, index) => _EnemySearchTile(item: items[index]),
        );
      },
    );
  }
}

class _EnemySearchTile extends StatelessWidget {
  final EnemySearchResult item;

  const _EnemySearchTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final displayName = item.name.trim().isEmpty
        ? t.enemy_name_unknown
        : item.name;
    return Card.filled(
      margin: EdgeInsets.zero,
      color: colors.surfaceContainerLow,
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        leading: CachedImage(
          url: FetchUrl.unitIconUrl(item.unitId),
          width: 56,
          height: 56,
          borderRadius: BorderRadius.circular(12),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                displayName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: colors.secondaryContainer,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                item.type.getName(t),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colors.onSecondaryContainer,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            'Enemy ID ${item.enemyId}  ·  Unit ID ${item.unitId}'
            '  ·  ${t.enemy_level(item.level)}  ·  HP ${_formatNumber(item.hp)}',
          ),
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () {
          final width = MediaQuery.sizeOf(context).width;
          context.push(
            AppRoutes.unitDetail,
            extra: UnitCard(
              unitId: item.enemyId,
              unitType: UnitType.enemy,
              enemyType: item.type,
              size: (width, 200),
            ),
          );
        },
      ),
    );
  }
}

String _formatNumber(int value) {
  final digits = value.toString();
  return digits.replaceAllMapped(
    RegExp(r'(?<=\d)(?=(\d{3})+(?!\d))'),
    (_) => ',',
  );
}
