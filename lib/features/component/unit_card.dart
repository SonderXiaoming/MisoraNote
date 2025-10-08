import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/core/di/di_parameter.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/component/shape.dart';
import 'package:misora_note/features/component/unit_card_part.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/utils/util.dart';
import 'package:misora_note/features/component/tag.dart';
import 'package:misora_note/l10n/app_localizations.dart';

class UnitCard extends ConsumerStatefulWidget {
  final (double, double) size;
  final int unitId;
  final bool isR6;
  final UnitType unitType;
  final CachedImage? unitImage;
  UnitCard({
    super.key,
    required this.unitId,
    this.isR6 = false,
    this.size = const (1408, 792),
    this.unitType = UnitType.unit,
  }) : unitImage = unitType != UnitType.unit
           ? null
           : CachedImage(
               url: FetchUrl.fullcardUrl(
                 longUnitId2Short(unitId),
                 isR6 ? 6 : 3,
               ),
               width: size.$1,
               height: size.$2,
               borderRadius: BorderRadius.circular(8),
             );

  @override
  ConsumerState<UnitCard> createState() => _UnitCardState();

  UnitCard copyWith({
    (double, double)? size,
    int? unitId,
    bool? isR6,
    UnitType? cardType,
  }) {
    return UnitCard(
      unitId: unitId ?? this.unitId,
      isR6: isR6 ?? this.isR6,
      size: size ?? this.size,
      unitType: cardType ?? this.unitType,
    );
  }
}

class _UnitCardState extends ConsumerState<UnitCard> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final db = ref.watch(dbProvider);
    var textColor = Color(CustomColors.colorWhite);
    final textStyle = TextStyle(
      fontSize: widget.size.$2 * 0.055,
      fontWeight: FontWeight.w500,
      color: textColor,
    );
    final textTheme = Theme.of(context).textTheme;
    switch (widget.unitType) {
      case UnitType.unit:
        final dominantColors = ref.watch(
          dominantColorProvider(widget.unitImage!),
        );
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
          return widget.unitImage!;
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
        final nameRaw = unitInfo.unitName
            .replaceAll("（", "(")
            .replaceAll("）", ")");
        String mainTitle = nameRaw;
        String? subTitle;
        final idx = nameRaw.indexOf('(');
        if (idx != -1 && nameRaw.endsWith(')')) {
          mainTitle = nameRaw.substring(0, idx).trim();
          subTitle = nameRaw.substring(idx + 1, nameRaw.length - 1).trim();
        }
        final getType = UnitGetType.fromValue(unitInfo.limitType ?? 1)!;
        final uniqueNum = uniqueInfo.where((e) => e.value != null).length;

        final searchAreaWidthType = SearchAreaWidthType.getType(
          unitInfo.searchAreaWidth ?? 0,
        );
        final atkType = AtkType.fromValue(unitInfo.atkType ?? 0);
        final talent = Talent.fromValue(unitInfo.talentId ?? 0);

        return SizedBox(
          width: widget.size.$1,
          height: widget.size.$2,
          child: GestureDetector(
            onTap: () {
              if (GoRouterState.of(context).uri.path == AppRoutes.unitDetail) {
                return;
              }
              context.push(AppRoutes.unitDetail, extra: widget);
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: [
                  widget.unitImage!,
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
                        height: widget.size.$2,
                        width: widget.size.$1 * (1 - ratioGolden),
                      ),
                    ),
                  ),
                  Positioned(
                    right: widget.size.$1 * 0.03,
                    bottom: widget.size.$2 * 0.13,
                    child: UnitAttributeTags(
                      size: widget.size,
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
                      size: widget.size,
                      mainTitle: mainTitle,
                      subTitle: subTitle,
                    ),
                  ),
                  Positioned(
                    right: widget.size.$1 * 0.03,
                    top: widget.size.$2 * 0.02,
                    child: UnitBasicInfo(
                      size: widget.size,
                      ageInt: unitInfo.ageInt ?? -1,
                      weightInt: unitInfo.weightInt ?? -1,
                      heightInt: unitInfo.heightInt ?? -1,
                      birthMonthInt: unitInfo.birthMonthInt,
                      birthDayInt: unitInfo.birthDayInt,
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
      case UnitType.summon:
        final summonUnit = ref.watch(unitDataProvider(widget.unitId));
        if (summonUnit.isLoading) {
          return CircularProgressIndicator();
        }
        if (summonUnit.hasError || summonUnit.value == null) {
          return SizedBox(
            width: widget.size.$1,
            height: widget.size.$2,
            child: Center(child: Icon(Icons.error, size: widget.size.$2 * 0.2)),
          );
        }
        final searchAreaWidthType = SearchAreaWidthType.getType(
          summonUnit.value!.searchAreaWidth ?? 0,
        );
        return SizedBox(
          width: widget.size.$1,
          height: widget.size.$2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                summonUnit.value!.unitName,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Color(CustomColors.colorPrimary),
                ),
              ),
              SizedBox(height: 8),
              BaseTag(
                backgroundColor: Color(
                  SearchAreaWidthType.getColor(searchAreaWidthType),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 1.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SearchAreaWidthType.getIcon(
                      searchAreaWidthType,
                      widget.size.$2 * 0.15,
                      widget.size.$2 * 0.15,
                    ),
                    SizedBox(width: widget.size.$2 * 0.01),
                    Text(
                      "${summonUnit.value!.searchAreaWidth}",
                      style: textStyle.copyWith(
                        fontSize: widget.size.$2 * 0.17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      case UnitType.enemy:
        final enemyUnit = ref.watch(enemyDataProvider(widget.unitId));
        final weakneas = ref.watch(enemyTalentWeaknessProvider(widget.unitId));
        List<int> weakneasList;
        if (enemyUnit.isLoading || weakneas.isLoading) {
          return CircularProgressIndicator();
        }
        if (enemyUnit.hasError ||
            enemyUnit.value == null ||
            weakneas.hasError) {
          return SizedBox(
            width: widget.size.$1,
            height: widget.size.$2,
            child: Center(child: Icon(Icons.error, size: widget.size.$2 * 0.2)),
          );
        }
        if (weakneas.value == null) {
          weakneasList = [];
        } else {
          weakneasList = [
            weakneas.value!.talent1,
            weakneas.value!.talent2,
            weakneas.value!.talent3,
            weakneas.value!.talent4,
            weakneas.value!.talent5,
          ];
        }
        final searchAreaWidth = enemyUnit.value!.searchAreaWidth;
        final searchAreaWidthType = SearchAreaWidthType.getType(
          searchAreaWidth,
        );
        return SizedBox(
          width: widget.size.$1,
          height: widget.size.$2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                enemyUnit.value!.unitName,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Color(CustomColors.colorPrimary),
                ),
              ),
              SizedBox(height: 8),
              if (searchAreaWidth > 0)
                BaseTag(
                  backgroundColor: Color(
                    SearchAreaWidthType.getColor(searchAreaWidthType),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 1.0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SearchAreaWidthType.getIcon(
                        searchAreaWidthType,
                        widget.size.$2 * 0.15,
                        widget.size.$2 * 0.15,
                      ),
                      SizedBox(width: widget.size.$2 * 0.01),
                      Text(
                        "${enemyUnit.value!.searchAreaWidth}",
                        style: textStyle.copyWith(
                          fontSize: widget.size.$2 * 0.17,
                        ),
                      ),
                    ],
                  ),
                ),
              if (weakneasList.any((v) => v != 100)) ...[
                SizedBox(height: 8),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 4,
                  children: weakneasList.asMap().entries.map((entry) {
                    final key = entry.key;
                    final value = entry.value;
                    if (value == 100) {
                      return SizedBox.shrink();
                    }
                    final talent = Talent.fromValue(key + 1);
                    return BaseTag(
                      backgroundColor: Color(
                        Talent.getColor(talent),
                      ).withAlpha(200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 1.0,
                      ),
                      child: Text(
                        "${Talent.getName(t, talent)} $value%",
                        style: textStyle.copyWith(
                          fontSize: widget.size.$2 * 0.17,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        );
    }
  }
}
