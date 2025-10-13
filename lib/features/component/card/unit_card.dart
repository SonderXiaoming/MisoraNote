import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/core/db/general.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/core/di/di_parameter.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/component/card/character.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/utils/util.dart';
import 'package:misora_note/features/component/card/enemy.dart';
import 'package:misora_note/features/component/card/summon.dart';

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
    UnitType? unitType,
  }) {
    return UnitCard(
      unitId: unitId ?? this.unitId,
      isR6: isR6 ?? this.isR6,
      size: size ?? this.size,
      unitType: unitType ?? this.unitType,
    );
  }
}

class _UnitCardState extends ConsumerState<UnitCard> {
  @override
  Widget build(BuildContext context) {
    final db = ref.watch(dbProvider);
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
        return CharacterCard(
          uniqueNum: uniqueInfo.where((e) => e.value != null).length,
          dominantColors: (dominantColors.value?.$1, dominantColors.value?.$2),
          size: widget.size,
          unitImage: widget.unitImage!,
          onTap: () {
            context.push(AppRoutes.unitDetail, extra: widget);
          },
          unitInfo: unitInfoAsync.value!,
        );

      case UnitType.summon:
        final summonUnit = ref.watch(unitDataProvider(widget.unitId));
        if (summonUnit.isLoading) {
          return SizedBox(
            width: widget.size.$1,
            height: widget.size.$2,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (summonUnit.hasError || summonUnit.value == null) {
          return SizedBox(
            width: widget.size.$1,
            height: widget.size.$2,
            child: Center(child: Icon(Icons.error, size: widget.size.$2 * 0.2)),
          );
        }
        return SummonCard(
          summonUnit: AllUnitData.fromUnitData(summonUnit.value!),
          size: widget.size,
        );
      case UnitType.enemySummon:
      case UnitType.enemy:
        final enemyParameter = ref.watch(
          enemyParameterProvider(
            EnemyParameterProviderParameter(
              enemyId: widget.unitId,
              enemyType: EnemyType.all,
            ),
          ),
        );
        if (enemyParameter.isLoading) {
          return CircularProgressIndicator();
        }
        if (enemyParameter.hasError || enemyParameter.value == null) {
          return SizedBox(
            width: widget.size.$1,
            height: widget.size.$2,
            child: Center(child: Icon(Icons.error, size: widget.size.$2 * 0.2)),
          );
        }
        final enemyUnit = ref.watch(
          enemyDataProvider(enemyParameter.value!.unitId),
        );
        final weaknessInfo = ref.watch(
          enemyTalentWeaknessProvider(enemyParameter.value!.enemyId),
        );
        if (enemyUnit.isLoading || weaknessInfo.isLoading) {
          return CircularProgressIndicator();
        }
        if (enemyUnit.hasError ||
            enemyUnit.value == null ||
            weaknessInfo.hasError) {
          return SizedBox(
            width: widget.size.$1,
            height: widget.size.$2,
            child: Center(child: Icon(Icons.error, size: widget.size.$2 * 0.2)),
          );
        }
        return EnemyCard(
          enemyUnit: enemyUnit.value!,
          size: widget.size,
          weaknessInfo: weaknessInfo.value,
        );
    }
  }
}
