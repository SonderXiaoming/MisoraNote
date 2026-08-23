import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/battle_effect_dialog.dart';
import 'package:misora_note/features/component/card/unit_card.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/l10n/app_localizations.dart';

class BattleQueryPage extends ConsumerStatefulWidget {
  final BattleQueryType type;

  const BattleQueryPage({super.key, required this.type});

  @override
  ConsumerState<BattleQueryPage> createState() => _BattleQueryPageState();
}

class _BattleQueryPageState extends ConsumerState<BattleQueryPage> {
  int? _selectedGroupId;
  final Map<String, int> _selectedStageIds = {};

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final result = ref.watch(battleQueryProvider(widget.type));
    return Scaffold(
      appBar: AppBar(
        title: Text(_title(t)),
        actions: [
          IconButton(
            tooltip: t.refresh,
            onPressed: () => ref.invalidate(battleQueryProvider(widget.type)),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: result.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _QueryError(
          error: error,
          onRetry: () => ref.invalidate(battleQueryProvider(widget.type)),
        ),
        data: (groups) {
          if (groups.isEmpty) {
            return Center(child: Text(t.no_battle_query_data));
          }
          final selected = groups
              .where((group) => group.id == _selectedGroupId)
              .firstOrNull;
          final active = selected ?? groups.first;
          final bossSections = _bossSections(active.stages);
          return Column(
            children: [
              _GroupSelector(
                groups: groups,
                selected: active,
                color: _accentColor,
                type: widget.type,
                onSelected: (id) => setState(() => _selectedGroupId = id),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () =>
                      ref.refresh(battleQueryProvider(widget.type).future),
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(12, 14, 12, 32),
                    children: [
                      Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 960),
                          child: _GroupHeader(
                            group: active,
                            bossCount: bossSections.length,
                            type: widget.type,
                            accent: _accentColor,
                            icon: _icon,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      for (final stages in bossSections) ...[
                        Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 960),
                            child: _BattleBossCard(
                              stages: stages,
                              selectedStageId:
                                  _selectedStageIds['${active.id}:${stages.first.bossKey}'],
                              accent: _accentColor,
                              effectType: switch (widget.type) {
                                BattleQueryType.remembrance =>
                                  BattleEffectType.mirage,
                                BattleQueryType.abyss => BattleEffectType.abyss,
                                BattleQueryType.dungeon => null,
                              },
                              onStageSelected: (stageId) => setState(() {
                                _selectedStageIds['${active.id}:${stages.first.bossKey}'] =
                                    stageId;
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String _title(AppLocalizations t) => switch (widget.type) {
    BattleQueryType.dungeon => t.dungeon_boss,
    BattleQueryType.remembrance => t.remembrance_battlefield,
    BattleQueryType.abyss => t.abyss_raid,
  };

  Color get _accentColor => switch (widget.type) {
    BattleQueryType.dungeon => const Color(CustomColors.colorGold),
    BattleQueryType.remembrance => const Color(CustomColors.colorPurple),
    BattleQueryType.abyss => const Color(CustomColors.colorRed),
  };

  IconData get _icon => switch (widget.type) {
    BattleQueryType.dungeon => Icons.landscape_rounded,
    BattleQueryType.remembrance => Icons.history_edu_rounded,
    BattleQueryType.abyss => Icons.whatshot_rounded,
  };
}

List<List<BattleQueryStage>> _bossSections(List<BattleQueryStage> stages) {
  final sections = <int, List<BattleQueryStage>>{};
  for (final stage in stages) {
    sections.putIfAbsent(stage.bossKey, () => []).add(stage);
  }
  for (final stages in sections.values) {
    stages.sort((a, b) => a.difficulty.compareTo(b.difficulty));
  }
  return sections.values.toList(growable: false);
}

class _GroupSelector extends StatelessWidget {
  final List<BattleQueryGroup> groups;
  final BattleQueryGroup selected;
  final Color color;
  final BattleQueryType type;
  final ValueChanged<int> onSelected;

  const _GroupSelector({
    required this.groups,
    required this.selected,
    required this.color,
    required this.type,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            alignment: Alignment.centerLeft,
          ),
          onPressed: () async {
            final id = await showModalBottomSheet<int>(
              context: context,
              isScrollControlled: true,
              showDragHandle: true,
              builder: (context) => _GroupPickerSheet(
                groups: groups,
                selectedId: selected.id,
                accent: color,
                type: type,
              ),
            );
            if (id != null) onSelected(id);
          },
          child: Row(
            children: [
              Container(
                width: 4,
                height: 36,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _NameWithTalentIcons(
                      name: selected.name,
                      talentIds: selected.talentIds,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    Text(
                      selected.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                _switchLabel(type),
                style: TextStyle(color: color, fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 3),
              Icon(Icons.unfold_more_rounded, color: color),
            ],
          ),
        ),
      ),
    );
  }

  String _switchLabel(BattleQueryType type) => switch (type) {
    BattleQueryType.dungeon => '切换地下城',
    BattleQueryType.remembrance => '切换领域',
    BattleQueryType.abyss => '切换期次',
  };
}

class _GroupPickerSheet extends StatefulWidget {
  final List<BattleQueryGroup> groups;
  final int selectedId;
  final Color accent;
  final BattleQueryType type;

  const _GroupPickerSheet({
    required this.groups,
    required this.selectedId,
    required this.accent,
    required this.type,
  });

  @override
  State<_GroupPickerSheet> createState() => _GroupPickerSheetState();
}

class _GroupPickerSheetState extends State<_GroupPickerSheet> {
  final TextEditingController _searchController = TextEditingController();
  String _search = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final groups = widget.groups
        .where((group) => group.matches(_search))
        .toList(growable: false);
    return SafeArea(
      child: FractionallySizedBox(
        heightFactor: 0.86,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 2, 18, 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Text('${widget.groups.length} 项'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => setState(() => _search = value),
                decoration: InputDecoration(
                  hintText: _hint,
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: _search.isEmpty
                      ? null
                      : IconButton(
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _search = '');
                          },
                          icon: const Icon(Icons.clear_rounded),
                        ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: groups.isEmpty
                  ? const Center(child: Text('没有匹配的结果'))
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(8, 6, 8, 24),
                      itemCount: groups.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 2),
                      itemBuilder: (context, index) {
                        final group = groups[index];
                        final selected = group.id == widget.selectedId;
                        return ListTile(
                          selected: selected,
                          selectedTileColor: widget.accent.withValues(
                            alpha: 0.1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          title: _NameWithTalentIcons(
                            name: group.name,
                            talentIds: group.talentIds,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          subtitle: Text(group.subtitle),
                          trailing: selected
                              ? Icon(
                                  Icons.check_circle_rounded,
                                  color: widget.accent,
                                )
                              : const Icon(Icons.chevron_right_rounded),
                          onTap: () => Navigator.pop(context, group.id),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  String get _title => switch (widget.type) {
    BattleQueryType.dungeon => '选择地下城',
    BattleQueryType.remembrance => '选择追忆战领域',
    BattleQueryType.abyss => '按时间选择讨伐战',
  };

  String get _hint => switch (widget.type) {
    BattleQueryType.dungeon => '搜索原名、Hard、VeryHard、EX1…',
    BattleQueryType.remembrance => '搜索领域、Boss、极或霸',
    BattleQueryType.abyss => '搜索名称、年份或月份',
  };
}

class _GroupHeader extends StatelessWidget {
  final BattleQueryGroup group;
  final int bossCount;
  final BattleQueryType type;
  final Color accent;
  final IconData icon;

  const _GroupHeader({
    required this.group,
    required this.bossCount,
    required this.type,
    required this.accent,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final leadingTalent = group.talentIds.firstOrNull;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: leadingTalent == null
                  ? accent.withValues(alpha: 0.12)
                  : Color(
                      Talent.fromValue(leadingTalent).color,
                    ).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: leadingTalent == null
                ? Icon(icon, color: accent)
                : _TalentIcons(talentIds: [leadingTalent], size: 30),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group.name,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
                ),
                Text(
                  group.subtitle,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              type == BattleQueryType.remembrance
                  ? '$bossCount 层'
                  : '$bossCount 个 Boss',
            ),
          ),
        ],
      ),
    );
  }
}

class _BattleBossCard extends StatelessWidget {
  final List<BattleQueryStage> stages;
  final int? selectedStageId;
  final Color accent;
  final BattleEffectType? effectType;
  final ValueChanged<int> onStageSelected;

  const _BattleBossCard({
    required this.stages,
    required this.selectedStageId,
    required this.accent,
    required this.effectType,
    required this.onStageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final selected = stages
        .where((stage) => stage.id == selectedStageId)
        .firstOrNull;
    final stage = selected ?? stages.first;
    final weaknessTalentIds = stage.enemies
        .expand((enemy) => enemy.weaknessTalentIds)
        .toSet()
        .toList()
      ..sort();
    final colors = Theme.of(context).colorScheme;
    return Card.filled(
      margin: EdgeInsets.zero,
      color: colors.surfaceContainerLow,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _NameWithTalentIcons(
                    name: stage.bossName,
                    talentIds: weaknessTalentIds,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                if (stage.effectQuestId != null && effectType != null)
                  _EffectButton(
                    effectType: effectType!,
                    selectedStage: stage,
                    stages: stages,
                  ),
              ],
            ),
            if (stages.length > 1) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 7,
                children: [
                  for (final option in stages)
                    ChoiceChip(
                      selected: option.id == stage.id,
                      showCheckmark: false,
                      selectedColor: accent,
                      labelStyle: TextStyle(
                        color: option.id == stage.id ? Colors.white : null,
                        fontWeight: FontWeight.w800,
                      ),
                      label: Text(option.label),
                      onSelected: (_) => onStageSelected(option.id),
                    ),
                ],
              ),
            ],
            const SizedBox(height: 12),
            if (stage.enemies.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 18),
                child: Center(child: Text('暂无敌人数据')),
              )
            else
              LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth = constraints.maxWidth < 560
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 12) / 2;
                  return Wrap(
                    spacing: 12,
                    runSpacing: 10,
                    children: [
                      for (final enemy in stage.enemies)
                        SizedBox(
                          width: itemWidth,
                          child: _BattleEnemyItem(enemy: enemy),
                        ),
                    ],
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _NameWithTalentIcons extends StatelessWidget {
  final String name;
  final List<int> talentIds;
  final TextStyle? style;

  const _NameWithTalentIcons({
    required this.name,
    required this.talentIds,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style,
          ),
        ),
        if (talentIds.isNotEmpty) ...[
          const SizedBox(width: 7),
          _TalentIcons(talentIds: talentIds),
        ],
      ],
    );
  }
}

class _TalentIcons extends StatelessWidget {
  final List<int> talentIds;
  final double size;

  const _TalentIcons({required this.talentIds, this.size = 21});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var index = 0; index < talentIds.length; index++) ...[
          if (index > 0) const SizedBox(width: 3),
          Tooltip(
            message: Talent.fromValue(talentIds[index]).getName(t),
            child: Image.asset(
              '${FilePath.img}/talent/'
              '${Talent.fromValue(talentIds[index]).name}.png',
              width: size,
              height: size,
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ],
    );
  }
}

class _EffectButton extends StatelessWidget {
  final BattleEffectType effectType;
  final BattleQueryStage selectedStage;
  final List<BattleQueryStage> stages;

  const _EffectButton({
    required this.effectType,
    required this.selectedStage,
    required this.stages,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return OutlinedButton.icon(
      onPressed: () => showBattleEffectDialog(
        context,
        type: effectType,
        questId: selectedStage.effectQuestId!,
        levels: [
          for (final stage in stages)
            if (stage.effectQuestId != null)
              BattleEffectLevelOption(
                questId: stage.effectQuestId!,
                label: stage.label,
              ),
        ],
      ),
      icon: const Icon(Icons.auto_awesome_rounded, size: 17),
      label: Text(t.extra_effect),
    );
  }
}

class _BattleEnemyItem extends StatelessWidget {
  final BattleQueryEnemy enemy;

  const _BattleEnemyItem({required this.enemy});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      borderRadius: BorderRadius.circular(13),
      onTap: () => context.push(
        AppRoutes.unitDetail,
        extra: UnitCard(
          unitId: enemy.enemyId,
          unitType: UnitType.enemy,
          enemyType: enemy.enemyType,
          size: (width, width * 792 / 1408),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            CachedImage(
              url: FetchUrl.unitIconUrl(enemy.iconUnitId),
              width: 72,
              height: 72,
              borderRadius: BorderRadius.circular(13),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    enemy.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 3),
                  Text('Lv.${enemy.level}  ·  HP ${_formatNumber(enemy.hp)}'),
                  Text(
                    'ID ${enemy.enemyId}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}

class _QueryError extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _QueryError({required this.error, required this.onRetry});

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

String _formatNumber(int value) {
  final digits = value.toString();
  return digits.replaceAllMapped(
    RegExp(r'(?<=\d)(?=(\d{3})+(?!\d))'),
    (_) => ',',
  );
}
