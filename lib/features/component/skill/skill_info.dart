import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/db/general.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/tag.dart';
import 'package:misora_note/features/component/skill/skill_text.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/component/card/unit_card.dart';
import 'package:misora_note/l10n/app_localizations.dart';
import 'package:misora_note/features/component/skill/skill_type.dart';

class SkillActionText extends StatelessWidget {
  final int actionId;
  final String tag;
  final String actionDesc;
  final int? summonUnitId;
  final bool showCoe;
  final int index;
  final UnitType unitType;
  const SkillActionText({
    super.key,
    required this.actionId,
    required this.tag,
    required this.actionDesc,
    required this.showCoe,
    required this.index,
    required this.unitType,
    this.summonUnitId,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final tagStack = <(String, Color)>[("root", colors.onSurface)];
    final parts = <(String, Color)>[];
    var buffer = "";
    final desc = actionDesc;
    for (var char in desc.characters) {
      if (SkillTag.tagPairs.containsKey(char)) {
        if (buffer.isNotEmpty) {
          parts.add((buffer, tagStack.last.$2));
          buffer = "";
        }
        final color = Color(SkillTag.tagColor(char.toString()));
        parts.add((char.toString(), color));
        tagStack.add((char.toString(), color));
      } else if (SkillTag.tagPairs.containsValue(char)) {
        if (tagStack.length > 1 &&
            SkillTag.tagPairs[tagStack.last.$1] == char) {
          if (buffer.isNotEmpty) {
            parts.add((buffer, tagStack.last.$2));
            buffer = "";
          }
          parts.add((char.toString(), tagStack.last.$2));
          tagStack.removeLast();
        } else {
          buffer += char;
        }
      } else {
        buffer += char;
      }
    }
    if (buffer.isNotEmpty) {
      parts.add((buffer, tagStack.last.$2));
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.secondaryContainer.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colors.outlineVariant.withValues(alpha: 0.7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Text(
                  '$index',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: colors.onPrimaryContainer,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (tag.isNotEmpty)
                Expanded(
                  child: Text(
                    tag,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: colors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              else
                const Spacer(),
              Tooltip(
                message: 'Action ID: $actionId',
                child: Icon(
                  showCoe ? Icons.functions_rounded : Icons.bolt_rounded,
                  size: 17,
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
          SelectableText.rich(
            TextSpan(
              children: parts.map((e) {
                return TextSpan(
                  text: e.$1,
                  style: TextStyle(color: e.$2),
                );
              }).toList(),
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.55),
            ),
          ),
          if (summonUnitId != null) ...[
            const SizedBox(height: 8),
            FilledButton.tonalIcon(
              onPressed: () {
                final width = MediaQuery.of(context).size.width;
                context.push(
                  AppRoutes.unitDetail,
                  extra: UnitCard(
                    unitId: summonUnitId!,
                    unitType: unitType == UnitType.enemy
                        ? UnitType.enemySummon
                        : UnitType.summon,
                    size: (width, 150),
                  ),
                );
              },
              icon: const Icon(Icons.pets_outlined),
              label: Text(t.summon_unit),
            ),
          ],
        ],
      ),
    );
  }
}

class SingleSkillInfo extends StatelessWidget {
  final SkillDataData skill;
  final List<SkillActionInfo> actions;
  final SkillTextType skillType;
  final int? level;
  final int? atk;
  final UnitType unitType;
  const SingleSkillInfo({
    super.key,
    required this.skill,
    required this.actions,
    required this.skillType,
    required this.unitType,
    this.level,
    this.atk,
  });
  List<SkillActionText> getActionDescList(ActionHandler actionHandler) {
    final descriptions = <String>[];
    final showCoeList = <bool>[];
    final tags = <String>[];
    for (var i = 0; i < actions.length; i++) {
      final action = actions[i];
      descriptions.add(
        actionHandler.formatDesc(action, skill, level ?? 0, atk ?? 0),
      );
      showCoeList.add(
        [
          SkillActionType.additive.value,
          SkillActionType.multiple.value,
          SkillActionType.divide.value,
          SkillActionType.rateDamage.value,
        ].contains(action.actionType),
      );
      final type = SkillActionType.getByType(action.actionType);
      String tag;
      if (type == SkillActionType.unknown) {
        tag = actionHandler.tag;
      } else {
        tag = type.getName(actionHandler.t);
      }
      tags.add(tag.isEmpty ? actionHandler.tag : tag);
    }

    hideUnusedCoefficients(descriptions, showCoeList, actionHandler.t);

    return [
      for (var i = 0; i < actions.length; i++)
        SkillActionText(
          actionId: actions[i].actionId,
          tag: tags[i],
          actionDesc: descriptions[i],
          summonUnitId: actions[i].actionType == SkillActionType.summon.value
              ? actions[i].actionDetail2
              : null,
          showCoe: showCoeList[i],
          index: i + 1,
          unitType: unitType,
        ),
    ];
  }

  void hideUnusedCoefficients(
    List<String> descriptions,
    List<bool> showCoeList,
    AppLocalizations t,
  ) {
    final references = <({int actionIndex, int type, String coefficient})>[];
    final coefficientPattern = RegExp(r'\{.*?\}');
    final actionPattern = RegExp(
      '${RegExp.escape(t.skill_action)}\\((\\d+)\\)',
    );

    for (var index = 0; index < descriptions.length; index++) {
      if (!showCoeList[index]) continue;
      final coefficient = coefficientPattern.firstMatch(descriptions[index]);
      if (coefficient == null) continue;
      final value = coefficient.group(0)!;
      references.add((actionIndex: index, type: 0, coefficient: value));
      for (final match in actionPattern.allMatches(descriptions[index])) {
        final actionIndex = int.tryParse(match.group(1) ?? '');
        if (actionIndex != null && actionIndex > 0) {
          references.add((
            actionIndex: actionIndex - 1,
            type: 1,
            coefficient: value,
          ));
        }
      }
    }

    for (var index = 0; index < descriptions.length; index++) {
      final related = references
          .where((reference) => reference.actionIndex == index)
          .toList();
      final original = descriptions[index];
      if (related.isEmpty) {
        descriptions[index] = original.replaceAll(coefficientPattern, '');
        continue;
      }

      var startIndex = original.indexOf('<');
      if (startIndex == -1) startIndex = original.indexOf('[');
      if (startIndex == -1) continue;

      var expression = original.substring(startIndex);
      for (final match in coefficientPattern.allMatches(original)) {
        final coefficient = match.group(0)!;
        if (related.first.type == 0 ||
            (related.first.type == 1 &&
                related.first.coefficient != coefficient)) {
          expression = expression.replaceAll(coefficient, '');
        }
      }
      descriptions[index] = original.substring(0, startIndex) + expression;
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final skillActionHandler = ActionHandler(t);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final borderColor = colors.outlineVariant.withValues(alpha: 0.72);
    final textTheme = theme.textTheme;
    final skillMeta = <String>[skillType.getName(t)];
    if (skill.skillCastTime > 0) {
      skillMeta.add(t.skill_cast_time(skill.skillCastTime.toString()));
    }
    if ((level ?? 0) > 0) {
      skillMeta.add(t.skill_level(level!));
    }
    final skillAction = getActionDescList(skillActionHandler);
    final tags = skillAction
        .map((e) => e.tag)
        .where((tag) => tag.isNotEmpty)
        .toSet()
        .toList();
    return BaseCard(
      margin: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
      borderRadius: 20,
      border: Border.all(color: borderColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: colors.secondaryContainer.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: borderColor),
                ),
                child: skillType == SkillTextType.normal
                    ? AtkType.fromValue(skill.skillType).getSkillIcon(50, 50)
                    : CachedImage(
                        url: FetchUrl.skillIconUrl(skill.iconType ?? 1001),
                      ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skill.name.isEmpty ? skillType.getName(t) : skill.name,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Color(skillType.color),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: skillMeta
                          .map(
                            (text) => Text(
                              text,
                              style: textTheme.bodySmall?.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// 正文描述
          if (skill.description != null && skill.description!.isNotEmpty) ...[
            SelectableText(
              skill.description!,
              style: textTheme.bodyLarge?.copyWith(height: 1.45),
            ),
            const SizedBox(height: 12),
          ],

          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: tags
                .map(
                  (e) => BaseTag(
                    backgroundColor: colors.primaryContainer,
                    borderRadius: BorderRadius.circular(9),
                    child: Text(
                      e,
                      style: textTheme.labelMedium?.copyWith(
                        color: colors.onPrimaryContainer,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 10),

          ...skillAction,
        ],
      ),
    );
  }
}

class AllSkillInfo extends StatefulWidget {
  final UnitSkillList skillIdList;
  final UnitType unitType;
  final int atk;

  const AllSkillInfo({
    super.key,
    required this.skillIdList,
    required this.unitType,
    this.atk = 0,
  });

  @override
  State<AllSkillInfo> createState() => _AllSkillInfoState();
}

class _AllSkillInfoState extends State<AllSkillInfo> {
  int? _customLevel;
  int? _customAtk;

  int get _databaseLevel {
    for (final skill in [
      ...widget.skillIdList.normal,
      ...widget.skillIdList.sp,
    ]) {
      if (skill.level > 0) return skill.level;
    }
    return 0;
  }

  Future<void> _editParameters(BuildContext context) async {
    final t = AppLocalizations.of(context)!;
    final levelController = TextEditingController(
      text: (_customLevel ?? _databaseLevel).toString(),
    );
    final atkController = TextEditingController(
      text: (_customAtk ?? widget.atk).toString(),
    );
    final result = await showDialog<({int? level, int? atk})>(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.calculate_outlined),
        title: Text(t.skill_parameters),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: levelController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: t.skill_level_text,
                  prefixIcon: const Icon(Icons.stairs_outlined),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: atkController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: t.skill_atk_text,
                  prefixIcon: const Icon(Icons.sports_martial_arts_outlined),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, (level: null, atk: null)),
            child: Text(t.reset),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, (
              level: int.tryParse(levelController.text)?.clamp(0, 9999),
              atk: int.tryParse(atkController.text)?.clamp(0, 99999999),
            )),
            child: Text(t.apply),
          ),
        ],
      ),
    );
    levelController.dispose();
    atkController.dispose();
    if (result == null || !mounted) return;
    setState(() {
      _customLevel = result.level;
      _customAtk = result.atk;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final effectiveAtk = _customAtk ?? widget.atk;
    final hasParameters =
        (_customLevel ?? _databaseLevel) > 0 || effectiveAtk > 0;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 920),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 22, 16, 2),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      t.skill_info,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: colors.primary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  FilledButton.tonalIcon(
                    onPressed: () => _editParameters(context),
                    icon: const Icon(Icons.tune_rounded),
                    label: Text(t.skill_parameters),
                  ),
                ],
              ),
            ),
            if (hasParameters)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 8,
                    children: [
                      if ((_customLevel ?? _databaseLevel) > 0)
                        Chip(
                          avatar: const Icon(Icons.stairs_outlined, size: 17),
                          label: Text(
                            t.skill_level(_customLevel ?? _databaseLevel),
                          ),
                        ),
                      if (effectiveAtk > 0)
                        Chip(
                          avatar: const Icon(
                            Icons.sports_martial_arts_outlined,
                            size: 17,
                          ),
                          label: Text('${t.skill_atk_text}：$effectiveAtk'),
                        ),
                    ],
                  ),
                ),
              ),
            ...widget.skillIdList.normal.map(
              (e) => SingleSkillInfo(
                skill: e.data,
                actions: e.actions,
                skillType: e.type,
                level: _customLevel ?? e.level,
                atk: effectiveAtk,
                unitType: widget.unitType,
              ),
            ),
            if (widget.skillIdList.sp.isNotEmpty)
              SectionTitle(
                title: t.sp_skill,
                icon: Icons.flash_on_outlined,
                count: widget.skillIdList.sp.length,
              ),
            ...widget.skillIdList.sp.map(
              (e) => SingleSkillInfo(
                skill: e.data,
                actions: e.actions,
                skillType: e.type,
                level: _customLevel ?? e.level,
                atk: effectiveAtk,
                unitType: widget.unitType,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<UnitSkillList> getUnitSkillList(
  AppDb db,
  int unitId, {
  Map<int, int>? levelMap,
  AllUnitParameter? enemyParameter,
  int atkType = 0,
  double normalAttackCastTime = 0,
}) async {
  final skillData = UnitSkillList();
  final normal = <int>[1];
  final sp = <int>[];
  final skillTypeDict = <int, SkillTextType>{1: SkillTextType.normal};
  final skill = (await db.getUnitSkills(unitId))!;
  final effectiveLevelMap =
      levelMap ?? _buildSkillLevelMap(skill, enemyParameter);
  if (skill.unionBurst != 0) {
    skillTypeDict[skill.unionBurst] = SkillTextType.ub;
    normal.add(skill.unionBurst);
  }
  if (skill.unionBurstEvolution != 0) {
    skillTypeDict[skill.unionBurstEvolution!] = SkillTextType.ubPlus;
    normal.add(skill.unionBurstEvolution!);
  }
  if (skill.mainSkill1 != 0) {
    skillTypeDict[skill.mainSkill1] = SkillTextType.skill1;
    normal.add(skill.mainSkill1);
  }
  if (skill.mainSkillEvolution1 != 0 &&
      (skill.spSkill1 != 1064101 ||
          skill.mainSkillEvolution1 != 1065012)) // 日服雪菲
  {
    skillTypeDict[skill.mainSkillEvolution1!] = SkillTextType.skill1Plus;
    normal.add(skill.mainSkillEvolution1!);
  }
  if ((skill.mainSkillEvolution1Pro ?? 0) != 0) {
    skillTypeDict[skill.mainSkillEvolution1Pro!] = SkillTextType.skill1PlusPlus;
    normal.add(skill.mainSkillEvolution1Pro!);
  }
  if (skill.mainSkill2 != 0) {
    skillTypeDict[skill.mainSkill2] = SkillTextType.skill2;
    normal.add(skill.mainSkill2);
  }
  if (skill.mainSkillEvolution2 != 0) {
    skillTypeDict[skill.mainSkillEvolution2!] = SkillTextType.skill2Plus;
    normal.add(skill.mainSkillEvolution2!);
  }
  if (skill.mainSkill3 != 0) {
    skillTypeDict[skill.mainSkill3] = SkillTextType.skill3;
    normal.add(skill.mainSkill3);
  }
  if (skill.mainSkill4 != 0) {
    skillTypeDict[skill.mainSkill4] = SkillTextType.skill4;
    normal.add(skill.mainSkill4);
  }
  if (skill.mainSkill5 != 0) {
    skillTypeDict[skill.mainSkill5] = SkillTextType.skill5;
    normal.add(skill.mainSkill5);
  }
  if (skill.mainSkill6 != 0) {
    skillTypeDict[skill.mainSkill6] = SkillTextType.skill6;
    normal.add(skill.mainSkill6);
  }
  if (skill.mainSkill7 != 0) {
    skillTypeDict[skill.mainSkill7] = SkillTextType.skill7;
    normal.add(skill.mainSkill7);
  }
  if (skill.mainSkill8 != 0) {
    skillTypeDict[skill.mainSkill8] = SkillTextType.skill8;
    normal.add(skill.mainSkill8);
  }
  if (skill.mainSkill9 != 0) {
    skillTypeDict[skill.mainSkill9] = SkillTextType.skill9;
    normal.add(skill.mainSkill9);
  }
  if (skill.mainSkill10 != 0) {
    skillTypeDict[skill.mainSkill10] = SkillTextType.skill10;
    normal.add(skill.mainSkill10);
  }
  if (skill.exSkill1 != 0) {
    skillTypeDict[skill.exSkill1] = SkillTextType.exSkill;
    normal.add(skill.exSkill1);
  }
  if (skill.exSkillEvolution1 != 0) {
    skillTypeDict[skill.exSkillEvolution1!] = SkillTextType.exSkillPlus;
    normal.add(skill.exSkillEvolution1!);
  }
  if (skill.exSkill2 != 0) {
    skillTypeDict[skill.exSkill2] = SkillTextType.exSkill2;
    normal.add(skill.exSkill2);
  }
  if (skill.exSkillEvolution2 != 0) {
    skillTypeDict[skill.exSkillEvolution2!] = SkillTextType.exSkill2Plus;
    normal.add(skill.exSkillEvolution2!);
  }
  if (skill.exSkill3 != 0) {
    skillTypeDict[skill.exSkill3] = SkillTextType.exSkill3;
    normal.add(skill.exSkill3);
  }
  if (skill.exSkillEvolution3 != 0) {
    skillTypeDict[skill.exSkillEvolution3!] = SkillTextType.exSkill3Plus;
    normal.add(skill.exSkillEvolution3!);
  }
  if (skill.exSkill4 != 0) {
    skillTypeDict[skill.exSkill4] = SkillTextType.exSkill4;
    normal.add(skill.exSkill4);
  }
  if (skill.exSkillEvolution4 != 0) {
    skillTypeDict[skill.exSkillEvolution4!] = SkillTextType.exSkill4Plus;
    normal.add(skill.exSkillEvolution4!);
  }
  if (skill.exSkill5 != 0) {
    skillTypeDict[skill.exSkill5] = SkillTextType.exSkill5;
    normal.add(skill.exSkill5);
  }
  if (skill.exSkillEvolution5 != 0) {
    skillTypeDict[skill.exSkillEvolution5!] = SkillTextType.exSkill5Plus;
    normal.add(skill.exSkillEvolution5!);
  }

  if (skill.spUnionBurst != 0) {
    skillTypeDict[skill.spUnionBurst] = SkillTextType.spUb;
    sp.add(skill.spUnionBurst);
  }
  if (skill.spSkill1 != 0) {
    skillTypeDict[skill.spSkill1] = SkillTextType.spSkill1;
    sp.add(skill.spSkill1);
  }
  if (skill.spSkillEvolution1 != 0) {
    skillTypeDict[skill.spSkillEvolution1!] = SkillTextType.spSkill1Plus;
    sp.add(skill.spSkillEvolution1!);
  }
  if ((skill.spSkillEvolution1Pro ?? 0) != 0) {
    skillTypeDict[skill.spSkillEvolution1Pro!] = SkillTextType.spSkill1PlusPlus;
    sp.add(skill.spSkillEvolution1Pro!);
  }
  if (skill.spSkill2 != 0) {
    skillTypeDict[skill.spSkill2] = SkillTextType.spSkill2;
    sp.add(skill.spSkill2);
  }
  if (skill.spSkillEvolution2 != 0) {
    skillTypeDict[skill.spSkillEvolution2!] = SkillTextType.spSkill2Plus;
    sp.add(skill.spSkillEvolution2!);
  }
  if (skill.spSkill3 != 0) {
    skillTypeDict[skill.spSkill3] = SkillTextType.spSkill3;
    sp.add(skill.spSkill3);
  }
  if (skill.spSkill4 != 0) {
    skillTypeDict[skill.spSkill4] = SkillTextType.spSkill4;
    sp.add(skill.spSkill4);
  }
  if (skill.spSkill5 != 0) {
    skillTypeDict[skill.spSkill5] = SkillTextType.spSkill5;
    sp.add(skill.spSkill5);
  }

  Future<void> loadSkills(List<int> ids, List<SkillFinalData> target) async {
    for (final id in ids) {
      final SkillDataData? data;
      if (id == 1) {
        data = _normalAttackData(atkType, normalAttackCastTime);
      } else {
        final rfSkillId = (await db.getRfSkillId(id))?.rfSkillId;
        data = await db.getSkill(rfSkillId ?? id);
      }
      if (data == null) continue;
      final actions = await db.getSkillActions(_skillActionIds(data));
      target.add(
        SkillFinalData(
          id: id,
          type: skillTypeDict[id]!,
          data: data,
          actions: actions,
          level: effectiveLevelMap[id] ?? 0,
        ),
      );
    }
  }

  await loadSkills(normal, skillData.normal);
  await loadSkills(sp, skillData.sp);
  return skillData;
}

SkillDataData _normalAttackData(int atkType, double castTime) {
  return SkillDataData(
    skillId: 1,
    name: '',
    skillType: atkType,
    skillAreaWidth: 0,
    skillCastTime: castTime,
    action1: 0,
    action2: 0,
    action3: 0,
    action4: 0,
    action5: 0,
    action6: 0,
    action7: 0,
    action8: 0,
    action9: 0,
    action10: 0,
    actionDepend1: 0,
    actionDepend2: 0,
    actionDepend3: 0,
    actionDepend4: 0,
    actionDepend5: 0,
    actionDepend6: 0,
    actionDepend7: 0,
    actionDepend8: 0,
    actionDepend9: 0,
    actionDepend10: 0,
    description: '',
  );
}

List<int> _skillActionIds(SkillDataData skill) {
  return [
    skill.action1,
    skill.action2,
    skill.action3,
    skill.action4,
    skill.action5,
    skill.action6,
    skill.action7,
    skill.action8,
    skill.action9,
    skill.action10,
    skill.action11,
    skill.action12,
    skill.action13,
    skill.action14,
    skill.action15,
    skill.action16,
    skill.action17,
    skill.action18,
    skill.action19,
    skill.action20,
  ].whereType<int>().where((id) => id != 0).toList();
}

Map<int, int> _buildSkillLevelMap(
  UnitSkillDataData skill,
  AllUnitParameter? parameter,
) {
  if (parameter == null) return const {};
  final result = <int, int>{};

  void add(int? id, int level) {
    if (id != null && id != 0) result[id] = level;
  }

  add(skill.unionBurst, parameter.unionBurstLevel);
  add(skill.unionBurstEvolution, parameter.unionBurstLevel);
  add(skill.mainSkill1, parameter.mainSkillLv1);
  add(skill.mainSkillEvolution1, parameter.mainSkillLv1);
  add(skill.mainSkillEvolution1Pro, parameter.mainSkillLv1);
  add(skill.mainSkill2, parameter.mainSkillLv2);
  add(skill.mainSkillEvolution2, parameter.mainSkillLv2);
  add(skill.mainSkill3, parameter.mainSkillLv3);
  add(skill.mainSkill4, parameter.mainSkillLv4);
  add(skill.mainSkill5, parameter.mainSkillLv5);
  add(skill.mainSkill6, parameter.mainSkillLv6);
  add(skill.mainSkill7, parameter.mainSkillLv7);
  add(skill.mainSkill8, parameter.mainSkillLv8);
  add(skill.mainSkill9, parameter.mainSkillLv9);
  add(skill.mainSkill10, parameter.mainSkillLv10);
  add(skill.exSkill1, parameter.exSkillLv1);
  add(skill.exSkillEvolution1, parameter.exSkillLv1);
  add(skill.exSkill2, parameter.exSkillLv2);
  add(skill.exSkillEvolution2, parameter.exSkillLv2);
  add(skill.exSkill3, parameter.exSkillLv3);
  add(skill.exSkillEvolution3, parameter.exSkillLv3);
  add(skill.exSkill4, parameter.exSkillLv4);
  add(skill.exSkillEvolution4, parameter.exSkillLv4);
  add(skill.exSkill5, parameter.exSkillLv5);
  add(skill.exSkillEvolution5, parameter.exSkillLv5);
  return result;
}

class SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final int? count;
  const SectionTitle({
    super.key,
    required this.title,
    required this.icon,
    this.count,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 4),
      child: Row(
        children: [
          Icon(icon, color: colors.primary),
          const SizedBox(width: 9),
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                color: colors.onSurface,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          if (count != null)
            Badge(
              backgroundColor: colors.secondaryContainer,
              textColor: colors.onSecondaryContainer,
              label: Text('$count'),
            ),
        ],
      ),
    );
  }
}
