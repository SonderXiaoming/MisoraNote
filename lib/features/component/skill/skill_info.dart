import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/database.dart';
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
    List<(String, int)> tagStack = [("root", CustomColors.colorBlack)];
    List<(String, int)> parts = []; // 存储 (文本段, 对应颜色) 的列表
    String buffer = ""; // 缓冲普通文本
    final desc = '($index) $actionDesc';
    for (var char in desc.characters) {
      if (SkillTag.tagPairs.containsKey(char)) {
        // 遇到左开标记
        // 先将当前缓冲区内容 flush，按当前栈顶颜色输出
        if (buffer.isNotEmpty) {
          parts.add((buffer, tagStack.last.$2));
          buffer = "";
        }
        // 将左开字符也加入输出，并使用对应颜色
        parts.add((char.toString(), SkillTag.tagColor(char.toString())));
        // 入栈该标记以及新的颜色，后续文本使用新颜色
        tagStack.add((char.toString(), SkillTag.tagColor(char.toString())));
      } else if (SkillTag.tagPairs.containsValue(char)) {
        // 遇到闭合标记
        if (tagStack.length > 1 &&
            SkillTag.tagPairs[tagStack.last.$1] == char) {
          if (buffer.isNotEmpty) {
            parts.add((buffer, tagStack.last.$2));
            buffer = "";
          }
          // 输出闭合标记字符，并用当前颜色
          parts.add((char.toString(), tagStack.last.$2));
          // 弹出栈顶，恢复上一级颜色
          tagStack.removeLast();
        } else {
          // 如果不匹配，则当作普通字符处理
          buffer += char;
        }
      } else {
        buffer += char; // 普通字符加入缓冲区
      }
    }
    // 最后 flush 剩余缓冲区内容
    if (buffer.isNotEmpty) {
      parts.add((buffer, tagStack.last.$2));
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Color(CustomColors.colorPrimary).withAlpha(30),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: parts.map((e) {
                return TextSpan(
                  text: e.$1,
                  style: TextStyle(color: Color(e.$2)),
                );
              }).toList(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          if (summonUnitId != null) ...[
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: () {
                // 点击跳转到召唤物角色详情页
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
              icon: Icon(Icons.pets, color: Color(CustomColors.colorPrimary)),
              label: Text(
                t.summon_unit,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Color(CustomColors.colorPrimary),
                  fontWeight: FontWeight.w600,
                ),
              ),
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
    List<SkillActionText> skillActionTextList = [];
    late String desc;
    late bool showCoe;
    late String tag;
    for (var i = 0; i < actions.length; i++) {
      var action = actions[i];
      desc = actionHandler.formatDesc(action, skill, level ?? 0, atk ?? 0);
      showCoe = [
        SkillActionType.additive.value,
        SkillActionType.multiple.value,
        SkillActionType.divide.value,
        SkillActionType.rateDamage.value,
      ].contains(action.actionType);
      final type = SkillActionType.getByType(action.actionType);
      if (type == SkillActionType.unknown) {
        tag = actionHandler.tag;
      } else {
        tag = SkillActionType.getName(actionHandler.t, type);
      }
      tag = tag.isEmpty ? actionHandler.tag : tag;

      skillActionTextList.add(
        SkillActionText(
          actionId: action.actionId,
          tag: tag,
          actionDesc: desc,
          summonUnitId: action.actionType == SkillActionType.summon.value
              ? action.actionDetail2
              : null,
          showCoe: showCoe,
          index: i + 1,
          unitType: unitType,
        ),
      );
    }
    return skillActionTextList;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final skillActionHandler = ActionHandler(t);
    final borderColor = Color(CustomColors.colorGray).withAlpha(50);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    String skillSubTitle = SkillTextType.getName(t, skillType);
    if (skill.skillCastTime > 0) {
      skillSubTitle +=
          '\t\t\t${t.skill_cooltime(skill.skillCastTime.toString())}';
    }
    if ((level ?? 0) > 0) {
      skillSubTitle += '\t\t\t${t.skill_level(level!)}';
    }
    final skillAction = getActionDescList(skillActionHandler);
    final tags = skillAction
        .map((e) => e.tag)
        .where((tag) => tag.isNotEmpty)
        .toSet()
        .toList();
    return BaseCard(
      border: Border.all(color: borderColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),

          /// 行首：左图标 + 标题 + 副标题
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: borderColor),
                ),
                child: CachedImage(
                  url: FetchUrl.skillIconUrl(
                    skill.iconType ?? 1001,
                  ), // 默认图标ID为1001
                ),
              ),
              const SizedBox(width: 10),
              // 标题与副标题
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skill.name.isEmpty ? skillSubTitle : skill.name,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Color(SkillTextType.getColor(skillType)),
                      ),
                    ),
                    const SizedBox(height: 2),
                    // 副标题：“技能1   准备时间: 1.4s”
                    Text(skillSubTitle, style: textTheme.bodyMedium),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          /// 正文描述
          if (skill.description != null && skill.description!.isNotEmpty) ...[
            Text(
              skill.description!,
              style: textTheme.bodyLarge?.copyWith(height: 1.3),
            ),
            const SizedBox(height: 12),
          ],

          Row(
            spacing: 6,
            children: tags
                .map(
                  (e) => BaseTag(
                    backgroundColor: Color(CustomColors.colorPrimary),
                    borderRadius: BorderRadius.circular(6),
                    child: Text(
                      e,
                      style: textTheme.labelMedium?.copyWith(
                        color: Color(CustomColors.colorWhite),
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

class AllSkillInfo extends StatelessWidget {
  final UnitSkillList skillIdList;
  final UnitType unitType;

  const AllSkillInfo({
    super.key,
    required this.skillIdList,
    required this.unitType,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    final t = AppLocalizations.of(context)!;
    return Column(
      children: [
        Text(
          t.skill_info,
          style: style.titleLarge?.copyWith(
            color: Color(CustomColors.colorPrimary),
            fontWeight: FontWeight.w700,
          ),
        ),
        ...[
          ...skillIdList.normal.map(
            (e) => SingleSkillInfo(
              skill: e.data,
              actions: e.actions,
              skillType: e.type,
              level: e.level,
              unitType: unitType,
            ),
          ),
          if (skillIdList.sp.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(
              "SP${t.skill_info}",
              style: style.titleLarge?.copyWith(
                color: Color(CustomColors.colorPrimary),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
          ...skillIdList.sp.map(
            (e) => SingleSkillInfo(
              skill: e.data,
              actions: e.actions,
              skillType: e.type,
              level: e.level,
              unitType: unitType,
            ),
          ),
        ],
      ],
    );
  }
}

Future<UnitSkillList> getUnitSkillList(
  AppDb db,
  int unitId, {
  Map<int, int>? levelMap,
}) async {
  UnitSkillList skillData = UnitSkillList();
  List<int> normal = [];
  List<int> sp = [];
  Map<int, SkillTextType> skillTypeDict = {};
  final skill = (await db.getUnitSkills(unitId))!;
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

  for (var id in normal) {
    var skillDataData = await db.getSkill(
      (await db.getRfSkillId(id))?.rfSkillId ?? id,
    );
    var actions = await db.getSkillActions(
      [
        skillDataData?.action1,
        skillDataData?.action2,
        skillDataData?.action3,
        skillDataData?.action4,
        skillDataData?.action5,
        skillDataData?.action6,
        skillDataData?.action7,
        skillDataData?.action8,
        skillDataData?.action9,
        skillDataData?.action10,
      ].whereType<int>().toList(),
    );

    skillData.normal.add(
      SkillFinalData(
        id: id,
        type: skillTypeDict[id]!,
        data: skillDataData!,
        actions: actions,
        level: levelMap != null ? levelMap[id] ?? 0 : 0,
      ),
    );
  }
  for (var id in sp) {
    var skillDataData = await db.getSkill(
      (await db.getRfSkillId(id))?.rfSkillId ?? id,
    );
    var actions = await db.getSkillActions(
      [
        skillDataData?.action1,
        skillDataData?.action2,
        skillDataData?.action3,
        skillDataData?.action4,
        skillDataData?.action5,
        skillDataData?.action6,
        skillDataData?.action7,
        skillDataData?.action8,
        skillDataData?.action9,
        skillDataData?.action10,
      ].whereType<int>().toList(),
    );
    skillData.sp.add(
      SkillFinalData(
        id: id,
        type: skillTypeDict[id]!,
        data: skillDataData!,
        actions: actions,
        level: levelMap != null ? levelMap[id] ?? 0 : 0,
      ),
    );
  }
  return skillData;
}
