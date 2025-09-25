import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/di/di_parameter.dart';
import 'package:misora_note/features/component/custom_icon.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/unit_card.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/component/skill/atk_pattern.dart';
import 'component/skill/skill_info.dart';

class UnitPage extends ConsumerStatefulWidget {
  final int unitId;
  final UnitCard? card;

  const UnitPage({super.key, required this.unitId, this.card});

  @override
  ConsumerState<UnitPage> createState() => _UnitPage();
}

class _UnitPage extends ConsumerState<UnitPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final unitSkillListAsync = ref.watch(
      unitSkillListProvider(UnitSkillListParameter(unitId: widget.unitId)),
    );
    final atkPatternAsync = ref.watch(
      unitAttackPatternProvider(widget.unitId),
    );
    final unitInfoAsync = ref.watch(unitInfoProvider(widget.unitId));

    if (unitInfoAsync.isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (unitInfoAsync.hasError) {
      return Scaffold(
        body: Center(child: Text('Error: ${unitInfoAsync.error}')),
      );
    }
    final unitInfo = unitInfoAsync.value!;
    final textTheme = Theme.of(context).textTheme;
    var unitCard = widget.card;
    if (unitCard == null) {
      final mediaWidth = MediaQuery.of(context).size.width;
      final cardWidth = min(max(420.0, mediaWidth * 0.4), mediaWidth);
      final cardHeight = cardWidth * 792 / 1408;
      final db = ref.read(dbProvider);
      unitCard = UnitCard(
        unitId: widget.unitId,
        isR6: db.r6Units.contains(widget.unitId),
        size: (cardWidth, cardHeight),
      );
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(
            builder: (context, constraints) {
              final double expandedHeight = unitCard!.size.$2;
              final double radio = ((constraints.scrollOffset -
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
                    )),
                expandedHeight: expandedHeight,
                backgroundColor: Colors.white,
                leading: CustomIconButton(
                    backgroundColor: HSLColor.fromColor(
                  Color(CustomColors.colorPink),
                ).withLightness(0.95).toColor()),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      unitCard.unitImage.copyWith(
                        height: expandedHeight,
                        width: width,
                      ),
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
          SliverToBoxAdapter(child: const SizedBox(height: 0)),
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
                normalAttackCoolDown: unitInfo.normalAtkCastTime,
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
