import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/db/general.dart';
import 'package:misora_note/core/di/di_parameter.dart';
import 'package:misora_note/features/component/custom_icon.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/unit_card.dart';
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

    final atkPatternAsync = ref.watch(
      unitAttackPatternProvider(widget.card.unitId),
    );

    // 根据卡片类型获取数据
    AsyncValue<UnitDataData?> unitDataAsync = const AsyncValue.data(null);
    AsyncValue<UnitEnemyDataData?> enemyDataAsync = const AsyncValue.data(null);

    if (widget.card.unitType == UnitType.enemy) {
      enemyDataAsync = ref.watch(enemyDataProvider(widget.card.unitId));
    } else {
      unitDataAsync = ref.watch(unitDataProvider(widget.card.unitId));
    }

    // 等待数据加载
    if (unitDataAsync.isLoading || enemyDataAsync.isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (unitDataAsync.hasError || enemyDataAsync.hasError) {
      return Scaffold(
        body: Center(
          child: Text('Error: ${unitDataAsync.error ?? enemyDataAsync.error}'),
        ),
      );
    }

    // 获取单位信息
    final UnitDataData? unitData = unitDataAsync.value;
    final UnitEnemyDataData? enemyData = enemyDataAsync.value;
    if (unitData == null && enemyData == null) {
      return Scaffold(body: Center(child: Text(t.no_data_error)));
    }

    final unitInfo = (unitData != null)
        ? AllUnitData.fromUnitData(unitData)
        : AllUnitData.fromUnitEnemyData(enemyData!);

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
    var unitCard = widget.card;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(
            builder: (context, constraints) {
              // 召唤物使用较小的高度
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
                    unitInfo.unitName,
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

          // SliverToBoxAdapter(child: const SizedBox(height: 0)),
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
              child: AllSkillInfo(skillIdList: unitSkillListAsync.value!),
            ),
          ],
        ],
      ),
    );
  }
}
