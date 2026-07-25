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

class ClanBattleResults extends ConsumerWidget {
  final int? clanBattleId;
  final bool ascending;

  const ClanBattleResults({
    super.key,
    this.clanBattleId,
    this.ascending = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final result = ref.watch(clanBattleListProvider(clanBattleId));
    return result.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => QueryError(
        message: error.toString(),
        onRetry: () => ref.invalidate(clanBattleListProvider(clanBattleId)),
      ),
      data: (items) {
        if (items.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.event_busy_outlined,
                    size: 52,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  const SizedBox(height: 12),
                  Text(t.no_clan_battle_data),
                ],
              ),
            ),
          );
        }

        final sorted = [...items];
        if (ascending) {
          sorted.sort((a, b) => a.clanBattleId.compareTo(b.clanBattleId));
        }
        return ListView(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 32),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 10),
              child: Text(
                clanBattleId == null
                    ? t.recent_clan_battles
                    : t.clan_battle_title(clanBattleId!),
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            for (final item in sorted)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ClanBattleCard(
                  data: item,
                  initiallyExpanded: clanBattleId != null,
                ),
              ),
          ],
        );
      },
    );
  }
}

class QueryError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const QueryError({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.storage_outlined,
              size: 48,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton.tonalIcon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('重试'),
            ),
          ],
        ),
      ),
    );
  }
}

class ClanBattleCard extends ConsumerStatefulWidget {
  final ClanBattleData data;
  final bool initiallyExpanded;

  const ClanBattleCard({
    super.key,
    required this.data,
    this.initiallyExpanded = false,
  });

  @override
  ConsumerState<ClanBattleCard> createState() => _ClanBattleCardState();
}

class _ClanBattleCardState extends ConsumerState<ClanBattleCard> {
  late bool _expanded;
  int? _selectedPhase;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
  }

  String _phaseLabel(int phase) {
    if (phase < 1 || phase > 26) return '$phase';
    return String.fromCharCode('A'.codeUnitAt(0) + phase - 1);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final phaseRange = widget.data.minPhase == widget.data.maxPhase
        ? _phaseLabel(widget.data.minPhase)
        : '${_phaseLabel(widget.data.minPhase)}-${_phaseLabel(widget.data.maxPhase)}';
    final phases = ref.watch(
      clanBattlePhasesProvider(widget.data.clanBattleId),
    );
    final dateParts = widget.data.displayDate.split('/');
    final displayDate = dateParts.length == 2
        ? '${dateParts[0]} 年 ${dateParts[1]} 月'
        : widget.data.displayDate;

    return Card.filled(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      color: colors.surfaceContainerLow,
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 10, 10),
              child: Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          InfoPill(
                            label: '#${widget.data.clanBattleId}',
                            color: colors.primary,
                          ),
                          const SizedBox(width: 7),
                          InfoPill(
                            label: displayDate,
                            color: const Color(CustomColors.colorDeepBlue),
                          ),
                          const SizedBox(width: 7),
                          InfoPill(
                            label: '$phaseRange 阶段',
                            color: const Color(CustomColors.colorPurple),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: colors.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
          phases.when(
            loading: () => const SizedBox(
              height: 104,
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, _) => Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: QueryError(
                message: error.toString(),
                onRetry: () => ref.invalidate(
                  clanBattlePhasesProvider(widget.data.clanBattleId),
                ),
              ),
            ),
            data: (data) {
              if (data.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 18),
                  child: Text(t.no_clan_battle_data),
                );
              }
              final selected =
                  data.any((phase) => phase.phase == _selectedPhase)
                  ? data.firstWhere((phase) => phase.phase == _selectedPhase)
                  : data.last;
              return AnimatedSize(
                duration: const Duration(milliseconds: 220),
                alignment: Alignment.topCenter,
                child: _expanded
                    ? DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: colors.outlineVariant),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: ClanBattleDetail(
                            phases: data,
                            selected: selected,
                            onSelect: (phase) =>
                                setState(() => _selectedPhase = phase),
                          ),
                        ),
                      )
                    : BossStrip(phase: selected),
              );
            },
          ),
        ],
      ),
    );
  }
}

class InfoPill extends StatelessWidget {
  final String label;
  final Color color;

  const InfoPill({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withValues(alpha: .14),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: color,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class BossStrip extends StatelessWidget {
  final ClanBattlePhaseData phase;

  const BossStrip({super.key, required this.phase});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 14),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = constraints.maxWidth / phase.bosses.length;
          final avatarSize = (itemWidth - 10).clamp(48.0, 76.0);
          return Row(
            children: [
              for (final boss in phase.bosses)
                Expanded(
                  child: Tooltip(
                    message: '${phase.phaseLabel}${boss.index} ${boss.name}',
                    child: InkResponse(
                      onTap: () => openBossDetail(context, boss),
                      radius: avatarSize * .64,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BossAvatar(boss: boss, size: avatarSize),
                          const SizedBox(height: 5),
                          Text(
                            '${phase.phaseLabel}${boss.index}',
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class ClanBattleDetail extends StatelessWidget {
  final List<ClanBattlePhaseData> phases;
  final ClanBattlePhaseData selected;
  final ValueChanged<int> onSelect;

  const ClanBattleDetail({
    super.key,
    required this.phases,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Column(
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final phase in phases)
              ChoiceChip(
                selected: phase.phase == selected.phase,
                avatar: Text(phase.phaseLabel),
                label: Text(t.clan_battle_laps(phase.lapLabel)),
                onSelected: (_) => onSelect(phase.phase),
              ),
          ],
        ),
        const SizedBox(height: 16),
        BossGrid(phase: selected),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calculate_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(
              t.full_compensation_line,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          t.full_compensation_formula,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 10),
        FullCompensationTable(
          phaseLabel: selected.phaseLabel,
          bosses: selected.bosses,
        ),
      ],
    );
  }
}

class BossGrid extends StatelessWidget {
  final ClanBattlePhaseData phase;

  const BossGrid({super.key, required this.phase});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 840
            ? 5
            : constraints.maxWidth >= 520
            ? 3
            : 2;
        const spacing = 10.0;
        final width =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final boss in phase.bosses)
              SizedBox(
                width: width,
                child: BossItem(phaseLabel: phase.phaseLabel, boss: boss),
              ),
          ],
        );
      },
    );
  }
}

class BossItem extends StatelessWidget {
  final String phaseLabel;
  final ClanBattleBossData boss;

  const BossItem({super.key, required this.phaseLabel, required this.boss});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: colors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => openBossDetail(context, boss),
        child: Tooltip(
          message: '${t.open_enemy_detail} · ${boss.enemyId}',
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                BossAvatar(boss: boss, size: 68),
                const SizedBox(height: 8),
                Text(
                  '$phaseLabel${boss.index} ${boss.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 3),
                Text(
                  formatDamage(boss.hp),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BossAvatar extends StatelessWidget {
  final ClanBattleBossData boss;
  final double size;

  const BossAvatar({super.key, required this.boss, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: Stack(
        children: [
          CachedImage(
            url: FetchUrl.unitIconUrl(boss.unitId),
            width: size,
            height: size,
            borderRadius: BorderRadius.circular(size * .16),
          ),
          if (boss.weaknessTalentIds.isNotEmpty)
            Positioned(
              left: 2,
              bottom: 2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (
                    var index = 0;
                    index < boss.weaknessTalentIds.length;
                    index++
                  ) ...[
                    if (index > 0) const SizedBox(width: 2),
                    Image.asset(
                      '${FilePath.img}/talent/'
                      '${Talent.fromValue(boss.weaknessTalentIds[index]).name}'
                      '.png',
                      width: size * .25,
                      height: size * .25,
                      filterQuality: FilterQuality.high,
                    ),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}

void openBossDetail(BuildContext context, ClanBattleBossData boss) {
  final width = MediaQuery.sizeOf(context).width;
  context.push(
    AppRoutes.unitDetail,
    extra: UnitCard(
      unitId: boss.enemyId,
      unitType: UnitType.enemy,
      enemyType: EnemyType.clan,
      size: (width, 200),
    ),
  );
}

class FullCompensationTable extends StatelessWidget {
  final String phaseLabel;
  final List<ClanBattleBossData> bosses;

  const FullCompensationTable({
    super.key,
    required this.phaseLabel,
    required this.bosses,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: ColoredBox(
        color: colors.surfaceContainerLow,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStatePropertyAll(colors.secondaryContainer),
            horizontalMargin: 14,
            columnSpacing: 24,
            columns: [
              const DataColumn(label: Text('BOSS')),
              const DataColumn(label: Text('HP'), numeric: true),
              for (var count = 1; count <= 8; count++)
                DataColumn(label: Text('$count+'), numeric: true),
            ],
            rows: [
              for (final boss in bosses)
                DataRow(
                  cells: [
                    DataCell(Text('$phaseLabel${boss.index}')),
                    DataCell(Text(formatDamage(boss.hp))),
                    for (var count = 1; count <= 8; count++)
                      DataCell(
                        Text(
                          boss.fullCompensationLines.any(
                                (line) => line.count == count,
                              )
                              ? formatDamage(
                                  boss.fullCompensationLines
                                      .firstWhere((line) => line.count == count)
                                      .damage,
                                )
                              : '—',
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

String formatDamage(num value) {
  if (value >= 100000000) {
    return '${(value / 100000000).toStringAsFixed(2)}亿';
  }
  if (value >= 10000) {
    return '${(value / 10000).toStringAsFixed(2)}万';
  }
  return value.round().toString();
}
