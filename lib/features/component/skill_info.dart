import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/skill/skill_text.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/l10n/app_localizations.dart';

class SingleSkillInfo extends StatelessWidget {
  final SkillDataData skill;
  final List<SkillActionData> actions;
  final SkillTextType skillType;
  final int? level;
  final int? atk;
  const SingleSkillInfo({
    super.key,
    required this.skill,
    required this.actions,
    required this.skillType,
    this.level,
    this.atk,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final skillActionHandler = ActionHandler(t);
    final borderColor = Color(CustomColors.colorGray).withAlpha(50);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    String skillSubTitle = skillType.value;
    if (skill.skillCastTime > 0) {
      skillSubTitle += '   准备时间: ${skill.skillCastTime}s';
    }
    if ((level ?? 0) > 0) {
      skillSubTitle += '   技能等级: $level';
    }
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
        boxShadow: const [
          BoxShadow(blurRadius: 12, spreadRadius: 0, color: Color(0x14000000)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 行首：左图标 + 标题 + 副标题
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 左侧技能图标（占位）
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: borderColor),
                ),
                child: CachedImage(url: FetchUrl.skillIconUrl(skill.skillId)),
              ),
              const SizedBox(width: 10),
              // 标题与副标题
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skill.name,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Color(SkillTextType.getColor(skillType)),
                      ),
                    ),
                    const SizedBox(height: 2),
                    // 副标题：“技能1   准备时间: 1.4s”
                    Text(
                      skillSubTitle,
                      style: textTheme.bodySmall?.copyWith(
                        color: Color(CustomColors.colorBlack),
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// 粉色“伤害”标签
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: Color(CustomColors.colorPrimary),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Color(CustomColors.colorPrimary)),
            ),
            child: Text(
              '伤害',
              style: textTheme.labelMedium?.copyWith(
                color: Color(CustomColors.colorPrimary),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const SizedBox(height: 8),

          /// 正文描述
          Text(
            '对物理攻击力最高的一名敌人造成魔法伤害（中）。',
            style: textTheme.bodyMedium?.copyWith(height: 1.3),
          ),

          const SizedBox(height: 10),

          /// 下方浅粉圆角说明块
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: _chipBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: RichText(
              text: TextSpan(
                style: textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                  height: 1.4,
                ),
                children: [
                  const TextSpan(text: '(1) 对 '),
                  TextSpan(
                    text: '“物理攻击力最高”',
                    style: const TextStyle(
                      color: _purple,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const TextSpan(text: ' 敌人单体造成 '),
                  // 公式段（深粉色）
                  TextSpan(
                    text: '<20.0 + 20.0 * 技能等级 + 1.6 * 攻击力>',
                    style: const TextStyle(
                      color: _chipText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const TextSpan(text: ' 的魔法伤害'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
