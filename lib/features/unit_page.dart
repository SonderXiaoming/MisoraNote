import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/general.dart';
import 'package:misora_note/core/di/di_parameter.dart';
import 'package:misora_note/features/component/custom_icon.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/card/unit_card.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/component/skill/atk_pattern.dart';
import 'package:misora_note/l10n/app_localizations.dart';
import 'component/skill/skill_info.dart';

class UnitPage extends ConsumerStatefulWidget {
  final UnitCard card;

  const UnitPage({super.key, required this.card});

  @override
  ConsumerState<UnitPage> createState() => _UnitPage();
}

class _UnitPage extends ConsumerState<UnitPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final t = AppLocalizations.of(context)!;

    AllUnitData? unitInfo;
    AllUnitParameter? parameter;
    switch (widget.card.unitType) {
      case UnitType.summon:
      case UnitType.unit:
        final characterData = ref.watch(unitDataProvider(widget.card.unitId));
        if (characterData.isLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (characterData.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${characterData.error}')),
          );
        }
        if (characterData.value != null) {
          unitInfo = AllUnitData.fromUnitData(characterData.value!);
        }
      case UnitType.enemySummon:
      case UnitType.enemy:
        final enemyParameter = ref.watch(
          enemyParameterProvider(
            EnemyParameterProviderParameter(enemyId: widget.card.unitId),
          ),
        );
        if (enemyParameter.isLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (enemyParameter.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${enemyParameter.error}')),
          );
        }
        if (enemyParameter.value != null) {
          parameter = enemyParameter.value!;
          final enemyData = ref.watch(enemyDataProvider(parameter!.unitId));
          if (enemyData.isLoading) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (enemyData.value != null) {
            unitInfo = AllUnitData.fromUnitEnemyData(enemyData.value!);
          }
        }
    }

    if (unitInfo == null) {
      return Scaffold(body: Center(child: Text(t.no_data_error)));
    }

    final atkPatternAsync = ref.watch(
      unitAttackPatternProvider(unitInfo.unitId),
    );

    final unitSkillListAsync = ref.watch(
      unitSkillListProvider(
        UnitSkillListParameter(
          unitId: unitInfo.cutin1Star6 != 0
              ? unitInfo.cutin1Star6
              : unitInfo.unitId,
        ),
      ),
    );

    final textTheme = Theme.of(context).textTheme;
    final unitCard = widget.card;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(
            builder: (context, constraints) {
              final double expandedHeight = unitCard.size.$2;
              final double radio =
                  ((constraints.scrollOffset -
                              (expandedHeight - kToolbarHeight)) /
                          kToolbarHeight)
                      .clamp(0.0, 1.0);
              return SliverAppBar(
                pinned: true,
                floating: false,
                centerTitle: false,
                title: Opacity(
                  opacity: radio,
                  child: Text(
                    unitInfo!.unitName,
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                expandedHeight: expandedHeight,
                backgroundColor: Colors.white,
                leading: CustomIconButton(
                  backgroundColor: HSLColor.fromColor(
                    Color(CustomColors.colorPink),
                  ).withLightness(0.95).toColor(),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      unitCard.unitImage?.copyWith(
                            width: width,
                            height: expandedHeight,
                          ) ??
                          Container(color: Color(CustomColors.colorWhite)),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(color: Colors.white.withAlpha(80)),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Hero(
                          tag: "unit_card_${unitInfo.unitId}",
                          child: unitCard,
                        ),
                      ),
                    ],
                  ),
                ),
                elevation: 0,
              );
            },
          ),

          if (unitInfo.comment != null &&
              unitInfo.comment!.isNotEmpty &&
              widget.card.unitType == UnitType.enemy)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 8.0,
                ),
                child: Text(
                  unitInfo.comment!.replaceAll("\\n", ""),
                  style: textTheme.bodyLarge,
                ),
              ),
            ),

          if (atkPatternAsync.isLoading || unitSkillListAsync.isLoading)
            SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (atkPatternAsync.hasError || unitSkillListAsync.hasError)
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'Error: ${atkPatternAsync.error ?? unitSkillListAsync.error} ',
                ),
              ),
            )
          else ...[
            SliverToBoxAdapter(
              child: AllAtkPattern(
                patterns: atkPatternAsync.value!,
                skillIdList: unitSkillListAsync.value!,
                atkType: AtkType.fromValue(unitInfo.atkType ?? 0),
                normalAttackCoolDown: unitInfo.normalAtkCastTime ?? 0.0,
              ),
            ),
            SliverToBoxAdapter(
              child: AllSkillInfo(
                skillIdList: unitSkillListAsync.value!,
                unitType: widget.card.unitType,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
