import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/tag.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/component/skill/skill_type.dart';
import 'package:misora_note/l10n/app_localizations.dart';

class PatternSkill extends StatelessWidget {
  final Widget skillIcon;
  final String? text;
  final SkillTextType skillType;
  final double coolDown;
  const PatternSkill({
    super.key,
    required this.skillIcon,
    required this.skillType,
    required this.coolDown,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final t = AppLocalizations.of(context)!;
    return Column(
      children: [
        text != null
            ? Text(
                text!,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              )
            : Text(
                "",
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
        skillIcon,
        Text(
          SkillTextType.getName(t, skillType),
          style: textTheme.bodySmall?.copyWith(
            color: Color(SkillTextType.getColor(skillType)),
          ),
        ),
        Text(t.cast_time(coolDown.toString()), style: textTheme.bodySmall),
      ],
    );
  }
}

class SinglePattern extends StatelessWidget {
  final UnitAttackPatternData unitAttackPatternData;
  final AtkType atkType;
  final int index;
  final UnitSkillList skillIdList;
  final double normalAttackCoolDown;
  const SinglePattern({
    super.key,
    required this.unitAttackPatternData,
    required this.normalAttackCoolDown,
    required this.skillIdList,
    required this.atkType,
    this.index = 0,
  });
  SkillFinalData? pattern2skillId(int patternId, UnitSkillList pureSkill) {
    if (patternId == 1 || patternId == 0) {
      return null; // 普攻不显示技能信息
    }
    if (patternId ~/ 1000 == 1) {
      final index = patternId % 100;
      return pureSkill.normal[index - 1];
    } else if (patternId ~/ 1000 == 2) {
      final index = patternId % 100;
      return pureSkill.sp[index - 1];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final t = AppLocalizations.of(context)!;
    final pattern = [
      unitAttackPatternData.atkPattern1,
      unitAttackPatternData.atkPattern2,
      unitAttackPatternData.atkPattern3,
      unitAttackPatternData.atkPattern4,
      unitAttackPatternData.atkPattern5,
      unitAttackPatternData.atkPattern6,
      unitAttackPatternData.atkPattern7,
      unitAttackPatternData.atkPattern8,
      unitAttackPatternData.atkPattern9,
      unitAttackPatternData.atkPattern10,
      unitAttackPatternData.atkPattern11,
      unitAttackPatternData.atkPattern12,
      unitAttackPatternData.atkPattern13,
      unitAttackPatternData.atkPattern14,
      unitAttackPatternData.atkPattern15,
      unitAttackPatternData.atkPattern16,
      unitAttackPatternData.atkPattern17,
      unitAttackPatternData.atkPattern18,
      unitAttackPatternData.atkPattern19,
      unitAttackPatternData.atkPattern20,
    ]
        .sublist(0, unitAttackPatternData.loopEnd ?? 1)
        .asMap()
        .entries
        .map((e) {
          if (e.value == null || e.value! == 0) {
            return null;
          }
          String? text;
          if (e.key == (unitAttackPatternData.loopEnd ?? 1) - 1 &&
              (unitAttackPatternData.loopEnd ?? 1) != 1) {
            text = t.skill_loop_end;
          } else if (e.key == (unitAttackPatternData.loopStart ?? 1) - 1 &&
              (unitAttackPatternData.loopEnd ?? 1) != 1) {
            text = t.skill_loop_start;
          }
          final skillInfo = pattern2skillId(
            e.value!,
            skillIdList.pureSkill,
          );
          return PatternSkill(
            skillIcon: e.value == 1
                ? AtkType.getSkillIcon(atkType, 50, 50)
                : CachedImage(
                    url: FetchUrl.skillIconUrl(
                      skillInfo?.data.iconType ?? 0,
                    ),
                    width: 50,
                    height: 50,
                  ),
            text: text,
            coolDown: skillInfo?.data.skillCastTime ?? normalAttackCoolDown,
            skillType: skillInfo?.type ?? SkillTextType.normal,
          );
        })
        .whereType<PatternSkill>()
        .toList();

    return BaseCard(
      border: Border.all(color: Color(CustomColors.colorGray).withAlpha(50)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8, width: double.infinity),
          TagBase(
            backgroundColor: Color(CustomColors.colorPrimary),
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Text(
              index != 0 ? "${t.skill_loop}$index" : t.skill_loop,
              style: style.titleMedium?.copyWith(
                color: Color(CustomColors.colorWhite),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Wrap(spacing: 12, runSpacing: 8, children: pattern),
        ],
      ),
    );
  }
}

class AllAtkPattern extends StatelessWidget {
  final List<UnitAttackPatternData> patterns;
  final UnitSkillList skillIdList;
  final AtkType atkType;
  final double normalAttackCoolDown;
  const AllAtkPattern({
    super.key,
    required this.patterns,
    required this.skillIdList,
    required this.atkType,
    required this.normalAttackCoolDown,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 16),
        Text(
          t.attack_pattern,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Color(CustomColors.colorPrimary),
                fontWeight: FontWeight.w700,
              ),
        ),
        ...patterns.asMap().entries.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SinglePattern(
                  unitAttackPatternData: e.value,
                  normalAttackCoolDown: normalAttackCoolDown,
                  skillIdList: skillIdList,
                  atkType: atkType,
                  index: patterns.length == 1 ? 0 : e.key + 1,
                ),
              ),
            ),
      ],
    );
  }
}
