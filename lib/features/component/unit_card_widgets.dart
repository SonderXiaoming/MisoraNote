import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/component/tag.dart';
import 'package:misora_note/l10n/app_localizations.dart';

/// 角色卡片的属性标签（获取类型、范围、攻击类型等）
class UnitAttributeTags extends StatelessWidget {
  final (double, double) size;
  final int uniqueNum;
  final UnitGetType getType;
  final SearchAreaWidthType searchAreaWidthType;
  final int searchAreaWidth;
  final AtkType atkType;
  final Talent talent;

  const UnitAttributeTags({
    super.key,
    required this.size,
    required this.uniqueNum,
    required this.getType,
    required this.searchAreaWidthType,
    required this.searchAreaWidth,
    required this.atkType,
    required this.talent,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final textColor = Color(CustomColors.colorWhite);
    final textStyle = TextStyle(
      fontSize: size.$2 * 0.055,
      fontWeight: FontWeight.w500,
      color: textColor,
    );

    final uniqueIcon = uniqueNum == 0
        ? SizedBox.shrink()
        : LocalImage(
            path: FilePath.uniqueNumIcon(uniqueNum),
            width: size.$2 * 0.09,
            height: size.$2 * 0.09,
          );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            uniqueIcon,
            SizedBox(width: size.$2 * 0.03),
            BaseTag(
              backgroundColor: Color(UnitGetType.getColor(getType)),
              child: Text(UnitGetType.getName(t, getType), style: textStyle),
            ),
          ],
        ),
        SizedBox(height: size.$2 * 0.03),
        Row(
          children: [
            BaseTag(
              backgroundColor: Color(
                SearchAreaWidthType.getColor(searchAreaWidthType),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 1.0,
              ),
              child: Row(
                children: [
                  SearchAreaWidthType.getIcon(
                    searchAreaWidthType,
                    size.$2 * 0.07,
                    size.$2 * 0.07,
                  ),
                  SizedBox(width: size.$2 * 0.01),
                  Text(
                    "$searchAreaWidth",
                    style: textStyle.copyWith(fontSize: size.$2 * 0.06),
                  ),
                ],
              ),
            ),
            SizedBox(width: size.$2 * 0.03),
            BaseTag(
              backgroundColor: Color(AtkType.getColor(atkType)),
              child: Row(
                children: [
                  AtkType.getIcon(atkType, size.$2 * 0.07, size.$2 * 0.07),
                  SizedBox(width: size.$2 * 0.01),
                  Text(Talent.getName(t, talent), style: textStyle),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// 角色卡片的基本信息（年龄、体重、身高、生日）
class UnitBasicInfo extends StatelessWidget {
  final (double, double) size;
  final int ageInt;
  final int weightInt;
  final int heightInt;
  final int? birthMonthInt;
  final int? birthDayInt;

  const UnitBasicInfo({
    super.key,
    required this.size,
    required this.ageInt,
    required this.weightInt,
    required this.heightInt,
    required this.birthMonthInt,
    required this.birthDayInt,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final textColor = Color(CustomColors.colorWhite);
    final textStyle = TextStyle(
      fontSize: size.$2 * 0.055,
      fontWeight: FontWeight.w500,
      color: textColor,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("${ageInt == -1 ? "???" : ageInt}", style: textStyle),
        Text("${weightInt == -1 ? "?" : weightInt} KG", style: textStyle),
        Text("${heightInt == -1 ? "?" : heightInt} CM", style: textStyle),
        Text(
          birthMonthInt == -1 || birthDayInt == -1
              ? "???"
              : t.date_m_d(birthMonthInt!.toString(), birthDayInt!.toString()),
          style: textStyle,
        ),
      ],
    );
  }
}

/// 角色名称显示（主标题和副标题）
class UnitNameDisplay extends StatelessWidget {
  final (double, double) size;
  final String mainTitle;
  final String? subTitle;

  const UnitNameDisplay({
    super.key,
    required this.size,
    required this.mainTitle,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Color(CustomColors.colorWhite);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (subTitle != null)
          Text(
            subTitle!,
            style: TextStyle(
              fontSize: size.$2 * 0.1 * 0.8,
              fontWeight: FontWeight.w500,
              color: textColor,
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 6,
                  color: Color(CustomColors.colorBlack),
                ),
              ],
            ),
          ),
        Text(
          mainTitle,
          style: TextStyle(
            fontSize: size.$2 * 0.1,
            fontWeight: FontWeight.bold,
            color: textColor,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 6,
                color: Color(CustomColors.colorBlack),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
