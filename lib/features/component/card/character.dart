import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/component/shape.dart';
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

class CharacterCard extends StatelessWidget {
  final int uniqueNum;
  final (Color?, Color?) dominantColors;
  final (double, double) size;
  final Function() onTap;
  final CachedImage unitImage;
  final UnitInfo unitInfo;

  const CharacterCard({
    super.key,
    required this.uniqueNum,
    required this.dominantColors,
    required this.size,
    required this.unitImage,
    required this.onTap,
    required this.unitInfo,
  });

  @override
  Widget build(BuildContext context) {
    Color colorDomain = dominantColors.$1 ?? Color(CustomColors.colorBlack);
    Color colorVibrant = dominantColors.$2 ?? Color(CustomColors.colorBlack);
    final nameRaw = unitInfo.unitName.replaceAll("（", "(").replaceAll("）", ")");
    String mainTitle = nameRaw;
    String? subTitle;
    final idx = nameRaw.indexOf('(');
    if (idx != -1 && nameRaw.endsWith(')')) {
      mainTitle = nameRaw.substring(0, idx).trim();
      subTitle = nameRaw.substring(idx + 1, nameRaw.length - 1).trim();
    }
    final getType = UnitGetType.fromValue(unitInfo.limitType ?? 1)!;

    final searchAreaWidthType = SearchAreaWidthType.getType(
      unitInfo.searchAreaWidth ?? 0,
    );
    final atkType = AtkType.fromValue(unitInfo.atkType ?? 0);
    final talent = Talent.fromValue(unitInfo.talentId ?? 0);
    final textColor = Color(CustomColors.colorWhite);
    final textStyle = TextStyle(
      fontSize: size.$2 * 0.055,
      fontWeight: FontWeight.w500,
      color: textColor,
    );
    return SizedBox(
      width: size.$1,
      height: size.$2,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              unitImage,
              Positioned(
                right: 0,
                child: ClipPath(
                  clipper: TrapezoidClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft, // 渐变开始方向
                        end: Alignment.bottomRight, // 渐变结束方向
                        colors: [
                          colorDomain.withAlpha(100),
                          colorVibrant.withAlpha(200),
                        ],
                      ),
                    ),
                    height: size.$2,
                    width: size.$1 * (1 - ratioGolden),
                  ),
                ),
              ),
              Positioned(
                right: size.$1 * 0.03,
                bottom: size.$2 * 0.13,
                child: UnitAttributeTags(
                  size: size,
                  uniqueNum: uniqueNum,
                  getType: getType,
                  searchAreaWidthType: searchAreaWidthType,
                  searchAreaWidth: unitInfo.searchAreaWidth ?? 0,
                  atkType: atkType,
                  talent: talent,
                ),
              ),
              // 名称：上小下大
              Positioned(
                bottom: 8,
                left: 8,
                child: UnitNameDisplay(
                  size: size,
                  mainTitle: mainTitle,
                  subTitle: subTitle,
                ),
              ),
              Positioned(
                right: size.$1 * 0.03,
                top: size.$2 * 0.02,
                child: UnitBasicInfo(
                  size: size,
                  ageInt: unitInfo.ageInt ?? -1,
                  weightInt: unitInfo.weightInt ?? -1,
                  heightInt: unitInfo.heightInt ?? -1,
                  birthMonthInt: unitInfo.birthMonthInt,
                  birthDayInt: unitInfo.birthDayInt,
                ),
              ),
              Positioned(
                right: size.$1 * 0.03,
                bottom: size.$2 * 0.01,
                child: Text(
                  unitInfo.unitStartTime.split(" ").first,
                  style: textStyle.copyWith(
                    fontSize: size.$2 * 0.05,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
