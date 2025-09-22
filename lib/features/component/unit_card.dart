import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/core/di/di_parameter.dart';
import 'package:misora_note/features/skill/skill_type.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/component/shape.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/router/page_extra.dart';
import 'package:misora_note/core/utils/util.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/l10n/app_localizations.dart';

class UnitCard extends ConsumerStatefulWidget {
  final (double, double) size;
  final int unitId;
  final bool isR6;
  final CachedImage unitImage;

  UnitCard({
    super.key,
    required this.unitId,
    required this.isR6,
    this.size = const (1408, 792),
  }) : unitImage = CachedImage(
          url: FetchUrl.fullcardUrl(longUnitId2Short(unitId), isR6 ? 6 : 3),
          width: size.$1,
          height: size.$2,
          borderRadius: BorderRadius.circular(8),
        );

  @override
  ConsumerState<UnitCard> createState() => _UnitCardState();
}

class _UnitCardState extends ConsumerState<UnitCard> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    var textColor = Color(CustomColors.colorWhite);
    final textStyle = TextStyle(
      fontSize: widget.size.$2 * 0.055,
      fontWeight: FontWeight.w500,
      color: textColor,
    );
    final db = ref.watch(dbProvider);
    final dominantColors = ref.watch(dominantColorProvider(widget.unitImage));
    final unitInfoAsync = ref.watch(unitInfoProvider(widget.unitId));
    final uniqueInfo = [
      ref.watch(
        unitUniqueEquipProvider(
          UnitUniqueEquipParameter(
            unitId: widget.unitId,
            solt: 1,
            lv: db.maxUniqueEquipLv.$1,
          ),
        ),
      ),
      ref.watch(
        unitUniqueEquipProvider(
          UnitUniqueEquipParameter(
            unitId: widget.unitId,
            solt: 2,
            lv: db.maxUniqueEquipLv.$2,
          ),
        ),
      ),
    ];

    if (unitInfoAsync.isLoading ||
        dominantColors.isLoading ||
        uniqueInfo.any((e) => e.isLoading)) {
      return SizedBox(
        width: widget.size.$1,
        height: widget.size.$2,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
              Color(CustomColors.colorPrimary),
            ),
          ),
        ),
      );
    }

    if (unitInfoAsync.hasError ||
        dominantColors.hasError ||
        uniqueInfo.any((e) => e.hasError)) {
      return SizedBox(
        width: widget.size.$1,
        height: widget.size.$2,
        child: Center(child: Icon(Icons.error, size: widget.size.$2 * 0.2)),
      );
    }
    Color colorDomain =
        dominantColors.value?.$1 ?? Color(CustomColors.colorBlack);
    Color colorVibrant =
        dominantColors.value?.$2 ?? Color(CustomColors.colorBlack);
    final unitInfo = unitInfoAsync.value!;
    final nameRaw = unitInfo.unitName.replaceAll("（", "(").replaceAll("）", ")");
    String mainTitle = nameRaw;
    String? subTitle;
    final idx = nameRaw.indexOf('(');
    if (idx != -1 && nameRaw.endsWith(')')) {
      mainTitle = nameRaw.substring(0, idx).trim();
      subTitle = nameRaw.substring(idx + 1, nameRaw.length - 1).trim();
    }
    final getType = UnitGetType.fromValue(unitInfo.limitType ?? 1)!;
    final uniqueNum = uniqueInfo.where((e) => e.value != null).length;
    Widget uniqueIcon = uniqueNum == 0
        ? SizedBox.shrink()
        : LocalImage(
            path: FilePath.uniqueNumIcon(uniqueNum),
            width: widget.size.$2 * 0.09,
            height: widget.size.$2 * 0.09,
          );

    final searchAreaWidthType = SearchAreaWidthType.getType(
      unitInfo.searchAreaWidth ?? 0,
    );
    final atkType = AtkType.fromValue(unitInfo.atkType ?? 0);
    return SizedBox(
      width: widget.size.$1,
      height: widget.size.$2,
      child: GestureDetector(
        onTap: () {
          context.push(
            AppRoutes.unitDetail,
            extra: UnitPageExtra(card: widget, unitId: widget.unitId),
          );
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              widget.unitImage,
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
                    height: widget.unitImage.height,
                    width: widget.unitImage.width * (1 - ratioGolden),
                  ),
                ),
              ),
              Positioned(
                right: widget.size.$1 * 0.03,
                bottom: widget.size.$2 * 0.13,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end, // 整列右对齐
                  children: [
                    Row(
                      children: [
                        uniqueIcon,
                        SizedBox(width: widget.size.$2 * 0.03),
                        TagBase(
                          backgroundColor: Color(UnitGetType.getColor(getType)),
                          child: Text(
                            UnitGetType.getName(t, getType),
                            style: textStyle,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: widget.size.$2 * 0.03),
                    Row(
                      children: [
                        TagBase(
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
                                widget.size.$2 * 0.07,
                                widget.size.$2 * 0.07,
                              ),
                              SizedBox(width: widget.size.$2 * 0.01),
                              Text(
                                "${unitInfo.searchAreaWidth}",
                                style: textStyle.copyWith(
                                  fontSize: widget.size.$2 * 0.06,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: widget.size.$2 * 0.03),
                        TagBase(
                          backgroundColor: Color(AtkType.getColor(atkType)),
                          child: Row(
                            children: [
                              AtkType.getIcon(
                                atkType,
                                widget.size.$2 * 0.07,
                                widget.size.$2 * 0.07,
                              ),
                              SizedBox(width: widget.size.$2 * 0.01),
                              Text(
                                AtkType.getName(t, atkType),
                                style: textStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // 名称：上小下大
              Positioned(
                bottom: 8,
                left: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (subTitle != null)
                      Text(
                        subTitle,
                        style: TextStyle(
                          fontSize: widget.size.$2 * 0.1 * 0.8,
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
                        fontSize: widget.size.$2 * 0.1,
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
                ),
              ),
              Positioned(
                right: widget.size.$1 * 0.03,
                top: widget.size.$2 * 0.02,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end, // 整列右对齐
                  children: [
                    Text(
                      "${unitInfo.ageInt == -1 ? "???" : unitInfo.ageInt}",
                      style: textStyle,
                    ),
                    Text(
                      "${unitInfo.weightInt == -1 ? "?" : unitInfo.weightInt} KG",
                      style: textStyle,
                    ),
                    Text(
                      "${unitInfo.heightInt == -1 ? "?" : unitInfo.heightInt} CM",
                      style: textStyle,
                    ),
                    Text(
                      unitInfo.birthMonthInt == -1 || unitInfo.birthDayInt == -1
                          ? "???"
                          : "${unitInfo.birthMonthInt} 月 ${unitInfo.birthDayInt} 日",
                      style: textStyle,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: widget.size.$1 * 0.03,
                bottom: widget.size.$2 * 0.01,
                child: Text(
                  unitInfo.unitStartTime.split(" ").first,
                  style: textStyle.copyWith(
                    fontSize: widget.size.$2 * 0.05,
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
