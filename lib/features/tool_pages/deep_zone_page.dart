import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/card/unit_card.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/l10n/app_localizations.dart';

class DeepZonePage extends ConsumerStatefulWidget {
  const DeepZonePage({super.key});

  @override
  ConsumerState<DeepZonePage> createState() => _DeepZonePageState();
}

class _DeepZonePageState extends ConsumerState<DeepZonePage> {
  Talent _talent = Talent.fire;
  final SearchController _searchController = SearchController();
  String _search = '';
  DeepZoneSort _sort = DeepZoneSort.stage;
  bool _ascending = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final result = ref.watch(deepZoneQuestProvider(_talent.value));
    final accent = Color(_talent.color);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.deep_zone),
        actions: [
          IconButton(
            tooltip: t.refresh,
            onPressed: () =>
                ref.invalidate(deepZoneQuestProvider(_talent.value)),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          _TalentSelector(
            selected: _talent,
            onSelected: (value) => setState(() => _talent = value),
          ),
          _DeepZoneToolbar(
            controller: _searchController,
            search: _search,
            sort: _sort,
            ascending: _ascending,
            onSearchChanged: (value) => setState(() => _search = value.trim()),
            onClear: () {
              _searchController.clear();
              setState(() => _search = '');
            },
            onSortChanged: (value) => setState(() => _sort = value),
            onDirectionChanged: () => setState(() => _ascending = !_ascending),
          ),
          Expanded(
            child: result.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => _DeepZoneError(
                error: error,
                onRetry: () =>
                    ref.invalidate(deepZoneQuestProvider(_talent.value)),
              ),
              data: (quests) {
                if (quests.isEmpty) {
                  return Center(child: Text(t.no_deep_zone_data));
                }
                final visibleQuests = filterAndSortDeepZoneQuests(
                  quests,
                  search: _search,
                  sort: _sort,
                  ascending: _ascending,
                );
                if (visibleQuests.isEmpty) {
                  return Center(child: Text(t.no_search_result));
                }
                return RefreshIndicator(
                  onRefresh: () =>
                      ref.refresh(deepZoneQuestProvider(_talent.value).future),
                  child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 32),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 560,
                          mainAxisExtent: 174,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 10,
                        ),
                    itemCount: visibleQuests.length,
                    itemBuilder: (context, index) => _DeepZoneQuestCard(
                      quest: visibleQuests[index],
                      accent: accent,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DeepZoneToolbar extends StatelessWidget {
  final SearchController controller;
  final String search;
  final DeepZoneSort sort;
  final bool ascending;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onClear;
  final ValueChanged<DeepZoneSort> onSortChanged;
  final VoidCallback onDirectionChanged;

  const _DeepZoneToolbar({
    required this.controller,
    required this.search,
    required this.sort,
    required this.ascending,
    required this.onSearchChanged,
    required this.onClear,
    required this.onSortChanged,
    required this.onDirectionChanged,
  });

  String _sortName(DeepZoneSort value, AppLocalizations t) => switch (value) {
    DeepZoneSort.stage => t.deep_zone_sort_stage,
    DeepZoneSort.stellarShard => t.deep_zone_sort_stellar_shard,
    DeepZoneSort.crystalBall => t.deep_zone_sort_crystal_ball,
  };

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: colors.surface,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
        child: Row(
          children: [
            Expanded(
              child: SearchBar(
                controller: controller,
                hintText: t.deep_zone_search_hint,
                leading: const Icon(Icons.search_rounded),
                trailing: search.isEmpty
                    ? null
                    : [
                        IconButton(
                          tooltip: MaterialLocalizations.of(
                            context,
                          ).deleteButtonTooltip,
                          onPressed: onClear,
                          icon: const Icon(Icons.clear_rounded),
                        ),
                      ],
                onChanged: onSearchChanged,
                backgroundColor: WidgetStatePropertyAll(
                  colors.surfaceContainerLowest,
                ),
                elevation: const WidgetStatePropertyAll(0),
                side: WidgetStatePropertyAll(
                  BorderSide(color: colors.outlineVariant),
                ),
              ),
            ),
            const SizedBox(width: 6),
            PopupMenuButton<DeepZoneSort>(
              tooltip: t.deep_zone_sort_by(_sortName(sort, t)),
              onSelected: onSortChanged,
              itemBuilder: (context) => [
                for (final value in DeepZoneSort.values)
                  PopupMenuItem(
                    value: value,
                    child: Row(
                      children: [
                        Icon(
                          value == sort
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked,
                          size: 18,
                          color: value == sort
                              ? colors.primary
                              : colors.outline,
                        ),
                        const SizedBox(width: 9),
                        Text(_sortName(value, t)),
                      ],
                    ),
                  ),
              ],
              icon: const Icon(Icons.sort_rounded),
            ),
            IconButton(
              tooltip: ascending ? t.sort_descending : t.sort_ascending,
              onPressed: onDirectionChanged,
              icon: Icon(
                ascending
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TalentSelector extends StatelessWidget {
  final Talent selected;
  final ValueChanged<Talent> onSelected;

  const _TalentSelector({required this.selected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Material(
      color: Theme.of(context).colorScheme.surface,
      elevation: 1,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Row(
          children: [
            for (final talent in Talent.values) ...[
              ChoiceChip(
                selected: talent == selected,
                showCheckmark: false,
                avatar: Icon(
                  _talentIcon(talent),
                  size: 18,
                  color: talent == selected
                      ? Colors.white
                      : Color(talent.color),
                ),
                label: Text(talent.getName(t)),
                labelStyle: TextStyle(
                  color: talent == selected ? Colors.white : null,
                  fontWeight: FontWeight.w800,
                ),
                selectedColor: Color(talent.color),
                side: BorderSide(
                  color: Color(talent.color).withValues(alpha: 0.55),
                ),
                onSelected: (_) => onSelected(talent),
              ),
              if (talent != Talent.values.last) const SizedBox(width: 8),
            ],
          ],
        ),
      ),
    );
  }

  IconData _talentIcon(Talent talent) => switch (talent) {
    Talent.fire => Icons.local_fire_department_rounded,
    Talent.water => Icons.water_drop_rounded,
    Talent.wind => Icons.air_rounded,
    Talent.light => Icons.light_mode_rounded,
    Talent.dark => Icons.nightlight_round,
  };
}

class _DeepZoneQuestCard extends StatelessWidget {
  final DeepZoneQuest quest;
  final Color accent;

  const _DeepZoneQuestCard({required this.quest, required this.accent});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 7,
            runSpacing: 5,
            children: [
              _QuestTag(text: quest.displayName, color: accent),
              _QuestTag(
                text: t.stellar_shard_count(quest.stellarShardCount),
                color: accent,
              ),
              _QuestTag(
                text: t.crystal_ball_count(quest.crystalBallCount),
                color: accent,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Card.filled(
              margin: EdgeInsets.zero,
              color: colors.surfaceContainerLow,
              clipBehavior: Clip.antiAlias,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final iconSize = min(
                    70.0,
                    max(46.0, (constraints.maxWidth - 88) / 5),
                  );
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          for (
                            var index = 0;
                            index < quest.enemies.length;
                            index++
                          ) ...[
                            _EnemyIcon(
                              enemy: quest.enemies[index],
                              size: iconSize,
                            ),
                            if (index != quest.enemies.length - 1)
                              const SizedBox(width: 16),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuestTag extends StatelessWidget {
  final String text;
  final Color color;

  const _QuestTag({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _EnemyIcon extends StatelessWidget {
  final DeepZoneEnemy enemy;
  final double size;

  const _EnemyIcon({required this.enemy, required this.size});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'ID ${enemy.enemyId}',
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          final width = MediaQuery.sizeOf(context).width;
          context.push(
            AppRoutes.unitDetail,
            extra: UnitCard(
              unitId: enemy.enemyId,
              unitType: UnitType.enemy,
              enemyType: EnemyType.talentQuest,
              size: (width, width * 792 / 1408),
            ),
          );
        },
        child: CachedImage(
          url: FetchUrl.unitIconUrl(enemy.iconUnitId),
          width: size,
          height: size,
          borderRadius: BorderRadius.circular(13),
        ),
      ),
    );
  }
}

class _DeepZoneError extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _DeepZoneError({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Center(
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
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(t.retry),
            ),
          ],
        ),
      ),
    );
  }
}
