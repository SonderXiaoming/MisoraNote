import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/core/utils/util.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/card/unit_card.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/component/tool_entry.dart';
import 'package:misora_note/l10n/app_localizations.dart';

class HomeScheduleSection extends ConsumerWidget {
  const HomeScheduleSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context)!;
    final area = ref.watch(areaProvider);
    final overview = ref.watch(scheduleOverviewProvider);
    final serverName = switch (area) {
      Area.cn => t.cn_server,
      Area.tw => t.tw_server,
      Area.jp => t.jp_server,
    };

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToolSectionTitle(
            icon: Icons.calendar_month_rounded,
            title: t.schedule,
            subtitle: t.schedule_server_time(serverName),
          ),
          const SizedBox(height: 8),
          overview.when(
            loading: () => const _ScheduleLoading(),
            error: (_, _) => _ScheduleError(
              onRetry: () => ref.invalidate(scheduleOverviewProvider),
            ),
            data: (data) => Column(
              children: [
                ScheduleLane(
                  title: t.schedule_in_progress,
                  emptyText: t.schedule_empty_in_progress,
                  icon: Icons.event_available_rounded,
                  events: data.inProgress,
                  area: area,
                  upcoming: false,
                ),
                const SizedBox(height: 22),
                ScheduleLane(
                  title: t.schedule_coming_soon,
                  emptyText: t.schedule_empty_coming,
                  icon: Icons.calendar_today_rounded,
                  events: data.comingSoon,
                  area: area,
                  upcoming: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleLane extends StatefulWidget {
  final String title;
  final String emptyText;
  final IconData icon;
  final List<GameScheduleEvent> events;
  final Area area;
  final bool upcoming;

  const ScheduleLane({
    super.key,
    required this.title,
    required this.emptyText,
    required this.icon,
    required this.events,
    required this.area,
    required this.upcoming,
  });

  @override
  State<ScheduleLane> createState() => _ScheduleLaneState();
}

class _ScheduleLaneState extends State<ScheduleLane> {
  bool _expanded = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 7),
              child: Row(
                children: [
                  Icon(widget.icon, size: 22, color: colors.onSurface),
                  const SizedBox(width: 9),
                  Text(
                    widget.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 9),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: colors.secondaryContainer,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      child: Text(
                        widget.events.length.toString(),
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colors.onSecondaryContainer,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 220),
          alignment: Alignment.topCenter,
          child: !_expanded
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: widget.events.isEmpty
                      ? Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 24,
                          ),
                          decoration: BoxDecoration(
                            color: colors.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            widget.emptyText,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                        )
                      : ScheduleColumns(
                          events: widget.events,
                          area: widget.area,
                          upcoming: widget.upcoming,
                        ),
                ),
        ),
      ],
    );
  }
}

class ScheduleColumns extends StatelessWidget {
  final List<GameScheduleEvent> events;
  final Area area;
  final bool upcoming;

  const ScheduleColumns({
    super.key,
    required this.events,
    required this.area,
    required this.upcoming,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columnCount = constraints.maxWidth >= 1180
            ? 3
            : constraints.maxWidth >= 760
            ? 2
            : 1;
        final columns = List.generate(
          columnCount,
          (_) => <GameScheduleEvent>[],
        );
        for (var index = 0; index < events.length; index++) {
          columns[index % columnCount].add(events[index]);
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var column = 0; column < columns.length; column++) ...[
              if (column > 0) const SizedBox(width: 14),
              Expanded(
                child: Column(
                  children: [
                    for (
                      var index = 0;
                      index < columns[column].length;
                      index++
                    ) ...[
                      if (index > 0) const SizedBox(height: 14),
                      ScheduleCard(
                        event: columns[column][index],
                        area: area,
                        upcoming: upcoming,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final GameScheduleEvent event;
  final Area area;
  final bool upcoming;

  const ScheduleCard({
    super.key,
    required this.event,
    required this.area,
    required this.upcoming,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final accent = event.type.getColor();
    final localStart = _serverTime(event.startTime, area);
    final countdownTarget = upcoming ? event.startTime : event.endTime;
    final hasTeaser =
        event.type == ScheduleEventType.story && event.visualId != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 6,
          runSpacing: 6,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            MetaPill(
              text: eventLabel(event, upcoming: upcoming),
              color: accent,
            ),
            MetaPill(
              text: DateFormat('yyyy/MM/dd').format(localStart),
              color: const Color(0xFF3478A8),
            ),
            MetaPill(
              text: formatDuration(event.endTime.difference(event.startTime)),
              color: const Color(0xFF3478A8),
            ),
            MetaPill(
              text: formatCountdown(countdownTarget.difference(DateTime.now())),
              color: upcoming
                  ? const Color(CustomColors.colorPurple)
                  : const Color(0xFF3478A8),
              icon: upcoming
                  ? Icons.hourglass_bottom_rounded
                  : Icons.schedule_rounded,
              tonal: true,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Card.filled(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          color: colors.surfaceContainerLow,
          child: InkWell(
            onTap: event.type == ScheduleEventType.clanBattle
                ? () =>
                      context.push(AppRoutes.enemySearch, extra: EnemyType.clan)
                : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (hasTeaser)
                  AspectRatio(
                    aspectRatio: 2.15,
                    child: LayoutBuilder(
                      builder: (context, constraints) => CachedImage(
                        url: FetchUrl.teaser(area, event.visualId!),
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!hasTeaser && event.unitIds.isNotEmpty) ...[
                        ScheduleIconRow(event: event),
                        const SizedBox(height: 12),
                      ],
                      if (event.title.isNotEmpty) ...[
                        Text(
                          event.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                          ),
                        ),
                      ],
                      if (event.subtitle.isNotEmpty) ...[
                        const SizedBox(height: 7),
                        Text(
                          event.subtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                      if (event.details.isNotEmpty) ...[
                        const SizedBox(height: 9),
                        ScheduleDetails(details: event.details, accent: accent),
                      ],
                      if (hasTeaser && event.unitIds.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        ScheduleIconRow(event: event),
                      ],
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Icon(
                            _footerIcon(event.type),
                            size: 17,
                            color: accent,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            _footerLabel(event.type),
                            style: theme.textTheme.labelLarge?.copyWith(
                              color: accent,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              DateFormat(
                                'yyyy/MM/dd HH:mm:ss',
                              ).format(_serverTime(event.endTime, area)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ScheduleDetails extends StatelessWidget {
  final List<String> details;
  final Color accent;

  const ScheduleDetails({
    super.key,
    required this.details,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var index = 0; index < details.length; index++) ...[
          if (index > 0) const SizedBox(height: 4),
          Builder(
            builder: (context) {
              final detail = details[index];
              final multiplierStart = detail.lastIndexOf(' ×');
              if (multiplierStart < 0) return Text(detail, style: textStyle);
              return Text.rich(
                TextSpan(
                  style: textStyle,
                  children: [
                    TextSpan(text: detail.substring(0, multiplierStart)),
                    TextSpan(
                      text: detail.substring(multiplierStart),
                      style: TextStyle(
                        color: accent,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ],
    );
  }
}

class ScheduleIconRow extends ConsumerWidget {
  final GameScheduleEvent event;

  const ScheduleIconRow({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const iconSize = 52.0;
    final ids = event.unitIds.take(5);
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final unitId in ids)
          if (event.type == ScheduleEventType.clanBattle)
            CachedImage(
              url: FetchUrl.unitIconUrl(unitId),
              width: iconSize,
              height: iconSize,
              borderRadius: BorderRadius.circular(9),
            )
          else
            Tooltip(
              message: '查看角色详情',
              child: InkResponse(
                onTap: () => openCharacterDetail(context, ref, unitId),
                radius: iconSize * .62,
                child: CachedImage(
                  url: FetchUrl.unitIconUrl(
                    int.parse('${longUnitId2Short(unitId)}31'),
                  ),
                  width: iconSize,
                  height: iconSize,
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
      ],
    );
  }
}

void openCharacterDetail(BuildContext context, WidgetRef ref, int unitId) {
  var isR6 = false;
  try {
    isR6 = ref.read(dbProvider).r6Units.contains(unitId);
  } catch (_) {
    // The base 3-star artwork remains a safe fallback during DB startup.
  }
  final width = MediaQuery.sizeOf(context).width;
  context.push(
    AppRoutes.unitDetail,
    extra: UnitCard(
      unitId: unitId,
      isR6: isR6,
      size: UnitCard.detailSizeForWidth(width),
    ),
  );
}

class MetaPill extends StatelessWidget {
  final String text;
  final Color color;
  final IconData? icon;
  final bool tonal;

  const MetaPill({
    super.key,
    required this.text,
    required this.color,
    this.icon,
    this.tonal = false,
  });

  @override
  Widget build(BuildContext context) {
    final foreground = tonal ? color : Colors.white;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: tonal ? color.withValues(alpha: .12) : color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 15, color: foreground),
              const SizedBox(width: 4),
            ],
            Text(
              text,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: foreground,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScheduleLoading extends StatelessWidget {
  const _ScheduleLoading();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 180,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class _ScheduleError extends StatelessWidget {
  final VoidCallback onRetry;

  const _ScheduleError({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Text(t.schedule_load_failed),
            const SizedBox(height: 6),
            TextButton.icon(
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

DateTime _serverTime(DateTime time, Area area) {
  return time.toUtc().add(Duration(hours: area == Area.jp ? 9 : 8));
}

String formatDuration(Duration duration) {
  final days = (duration.inMinutes / Duration.minutesPerDay).ceil().clamp(
    1,
    999,
  );
  return '$days天';
}

String formatCountdown(Duration duration) {
  if (duration.isNegative) return '即将结束';
  final days = duration.inDays;
  final hours = duration.inHours.remainder(24);
  final minutes = duration.inMinutes.remainder(60);
  if (days > 0) return '$days天$hours时$minutes分';
  if (hours > 0) return '$hours时$minutes分';
  return '$minutes分';
}

String eventLabel(GameScheduleEvent event, {required bool upcoming}) {
  return switch (event.type) {
    ScheduleEventType.story => upcoming ? '预告' : '活动',
    ScheduleEventType.gacha =>
      event.badgeLabel.isNotEmpty ? event.badgeLabel : '常驻',
    ScheduleEventType.freeGacha => '免费十连',
    ScheduleEventType.campaign => '掉落',
    ScheduleEventType.clanBattle => '公会战',
    ScheduleEventType.tower => '露娜塔',
    ScheduleEventType.specialDungeon => '特别地下城',
    ScheduleEventType.dimensionalFault => '次元断层',
    ScheduleEventType.colosseum => '斗技场',
    ScheduleEventType.abyss => '深渊',
    ScheduleEventType.dailyMission => '任务',
    ScheduleEventType.loginBonus => '登录',
    ScheduleEventType.fortune => '庆典',
    ScheduleEventType.birthday => '生日',
  };
}

String _footerLabel(ScheduleEventType type) {
  return switch (type) {
    ScheduleEventType.story => '剧情',
    ScheduleEventType.gacha || ScheduleEventType.freeGacha => '抽卡',
    ScheduleEventType.campaign => '活动加成',
    ScheduleEventType.clanBattle => '公会战',
    ScheduleEventType.birthday => '角色生日',
    _ => '活动日程',
  };
}

IconData _footerIcon(ScheduleEventType type) {
  return switch (type) {
    ScheduleEventType.story => Icons.image_rounded,
    ScheduleEventType.gacha ||
    ScheduleEventType.freeGacha => Icons.videogame_asset_rounded,
    ScheduleEventType.clanBattle => Icons.groups_2_rounded,
    ScheduleEventType.birthday => Icons.cake_rounded,
    _ => type.getIcon(),
  };
}
