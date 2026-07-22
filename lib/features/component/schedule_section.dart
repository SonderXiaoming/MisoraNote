import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/core/di/di.dart';
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
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToolSectionTitle(
            icon: Icons.calendar_month_rounded,
            title: t.schedule,
            subtitle: t.schedule_server_time(serverName),
          ),
          const SizedBox(height: 6),
          overview.when(
            loading: () => const _ScheduleLoading(),
            error: (_, _) => _ScheduleError(
              onRetry: () => ref.invalidate(scheduleOverviewProvider),
            ),
            data: (data) => Column(
              children: [
                _ScheduleLane(
                  title: t.schedule_in_progress,
                  emptyText: t.schedule_empty_in_progress,
                  icon: Icons.event_available_rounded,
                  events: data.inProgress,
                  area: area,
                ),
                const SizedBox(height: 18),
                _ScheduleLane(
                  title: t.schedule_coming_soon,
                  emptyText: t.schedule_empty_coming,
                  icon: Icons.upcoming_rounded,
                  events: data.comingSoon,
                  area: area,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScheduleLane extends StatelessWidget {
  final String title;
  final String emptyText;
  final IconData icon;
  final List<GameScheduleEvent> events;
  final Area area;

  const _ScheduleLane({
    required this.title,
    required this.emptyText,
    required this.icon,
    required this.events,
    required this.area,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              Icon(icon, size: 19, color: colors.primary),
              const SizedBox(width: 8),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                events.length.toString(),
                style: theme.textTheme.labelLarge?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 9),
        if (events.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              emptyText,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          )
        else
          SizedBox(
            height: 132,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final cardWidth = min(
                  320.0,
                  max(252.0, constraints.maxWidth * .78),
                );
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: events.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 10),
                  itemBuilder: (context, index) => SizedBox(
                    width: cardWidth,
                    child: _ScheduleCard(event: events[index], area: area),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

class _ScheduleCard extends StatelessWidget {
  final GameScheduleEvent event;
  final Area area;

  const _ScheduleCard({required this.event, required this.area});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final accent = _eventColor(event.type);
    return Card.filled(
      margin: EdgeInsets.zero,
      color: colors.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: accent.withValues(alpha: .15),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Icon(_eventIcon(event.type), size: 19, color: accent),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    event.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      height: 1.15,
                    ),
                  ),
                ),
              ],
            ),
            if (event.subtitle.isNotEmpty) ...[
              const SizedBox(height: 7),
              Text(
                event.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
            const Spacer(),
            Row(
              children: [
                Icon(Icons.schedule_rounded, size: 15, color: colors.outline),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    _formatRange(event, area),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatRange(GameScheduleEvent event, Area area) {
    final offset = area == Area.jp ? 9 : 8;
    final start = event.startTime.toUtc().add(Duration(hours: offset));
    final end = event.endTime.toUtc().add(Duration(hours: offset));
    final startText = DateFormat('M月d日 HH:mm').format(start);
    final endText =
        start.year == end.year &&
            start.month == end.month &&
            start.day == end.day
        ? DateFormat('HH:mm').format(end)
        : DateFormat('M月d日 HH:mm').format(end);
    return '$startText – $endText';
  }
}

class _ScheduleLoading extends StatelessWidget {
  const _ScheduleLoading();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 132,
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

Color _eventColor(ScheduleEventType type) {
  return Color(switch (type) {
    ScheduleEventType.story => CustomColors.colorDeepPink,
    ScheduleEventType.gacha => CustomColors.colorPurple,
    ScheduleEventType.freeGacha => CustomColors.colorCyan,
    ScheduleEventType.campaign => CustomColors.colorOrange,
    ScheduleEventType.clanBattle => CustomColors.colorRed,
    ScheduleEventType.tower => CustomColors.colorDeepBlue,
    ScheduleEventType.specialDungeon => CustomColors.colorGold,
    ScheduleEventType.dimensionalFault => CustomColors.colorPurple,
    ScheduleEventType.colosseum => CustomColors.colorCyan,
    ScheduleEventType.abyss => CustomColors.colorRed,
    ScheduleEventType.dailyMission => CustomColors.colorGreen,
    ScheduleEventType.loginBonus => CustomColors.colorGold,
    ScheduleEventType.fortune => CustomColors.colorPink,
  });
}

IconData _eventIcon(ScheduleEventType type) {
  return switch (type) {
    ScheduleEventType.story => Icons.auto_stories_rounded,
    ScheduleEventType.gacha => Icons.stars_rounded,
    ScheduleEventType.freeGacha => Icons.redeem_rounded,
    ScheduleEventType.campaign => Icons.trending_up_rounded,
    ScheduleEventType.clanBattle => Icons.groups_2_rounded,
    ScheduleEventType.tower => Icons.apartment_rounded,
    ScheduleEventType.specialDungeon => Icons.landscape_rounded,
    ScheduleEventType.dimensionalFault => Icons.blur_circular_rounded,
    ScheduleEventType.colosseum => Icons.sports_martial_arts_rounded,
    ScheduleEventType.abyss => Icons.whatshot_rounded,
    ScheduleEventType.dailyMission => Icons.bolt_rounded,
    ScheduleEventType.loginBonus => Icons.card_giftcard_rounded,
    ScheduleEventType.fortune => Icons.emoji_events_rounded,
  };
}
