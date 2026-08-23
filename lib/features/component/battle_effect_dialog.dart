import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/skill/skill_info.dart';
import 'package:misora_note/l10n/app_localizations.dart';

Future<void> showBattleEffectDialog(
  BuildContext context, {
  required BattleEffectType type,
  required int questId,
  String? levelLabel,
  List<BattleEffectLevelOption> levels = const [],
}) {
  final options = levels.isEmpty
      ? [
          BattleEffectLevelOption(
            questId: questId,
            label: levelLabel ?? '当前关卡',
          ),
        ]
      : levels;
  return showDialog<void>(
    context: context,
    builder: (_) => _BattleEffectDialog(
      type: type,
      initialQuestId: questId,
      levels: options,
    ),
  );
}

class BattleEffectLevelOption {
  final int questId;
  final String label;

  const BattleEffectLevelOption({
    required this.questId,
    required this.label,
  });
}

class _BattleEffectDialog extends ConsumerStatefulWidget {
  final BattleEffectType type;
  final int initialQuestId;
  final List<BattleEffectLevelOption> levels;

  const _BattleEffectDialog({
    required this.type,
    required this.initialQuestId,
    required this.levels,
  });

  @override
  ConsumerState<_BattleEffectDialog> createState() =>
      _BattleEffectDialogState();
}

class _BattleEffectDialogState extends ConsumerState<_BattleEffectDialog> {
  late int _selectedQuestId;

  @override
  void initState() {
    super.initState();
    _selectedQuestId = widget.initialQuestId;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final selectedLevel = widget.levels
        .where((option) => option.questId == _selectedQuestId)
        .firstOrNull;
    final activeLevel = selectedLevel ?? widget.levels.first;
    final query = (type: widget.type, questId: activeLevel.questId);
    final result = ref.watch(battleEffectProvider(query));
    final dialogHeight = (MediaQuery.sizeOf(context).height * 0.72)
        .clamp(320.0, 620.0);
    return AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.auto_awesome_rounded),
          const SizedBox(width: 10),
          Expanded(child: Text(t.extra_effect)),
        ],
      ),
      content: SizedBox(
        width: 620,
        height: dialogHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.levels.length > 1) ...[
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final option in widget.levels) ...[
                      ChoiceChip(
                        selected: option.questId == activeLevel.questId,
                        showCheckmark: false,
                        label: Text(option.label),
                        onSelected: (_) => setState(
                          () => _selectedQuestId = option.questId,
                        ),
                      ),
                      const SizedBox(width: 7),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
            Expanded(
              child: result.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, _) => Center(
                  child: Text(error.toString(), textAlign: TextAlign.center),
                ),
                data: (details) {
                  if (details.controllers.isEmpty) {
                    return Center(
                      child: Text(
                        t.no_extra_effect,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                  return ListView(
                    children: [
                      for (final controller in details.controllers) ...[
                        for (final skill in controller.skills.normal)
                          SingleSkillInfo(
                            skill: skill.data,
                            actions: skill.actions,
                            skillType: skill.type,
                            level: skill.level,
                            atk: controller.atk,
                            unitType: UnitType.enemy,
                          ),
                        for (final skill in controller.skills.sp)
                          SingleSkillInfo(
                            skill: skill.data,
                            actions: skill.actions,
                            skillType: skill.type,
                            level: skill.level,
                            atk: controller.atk,
                            unitType: UnitType.enemy,
                          ),
                      ],
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(MaterialLocalizations.of(context).closeButtonLabel),
        ),
      ],
    );
  }
}
