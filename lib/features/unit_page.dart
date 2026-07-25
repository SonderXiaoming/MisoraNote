import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/general.dart';
import 'package:misora_note/core/di/di_parameter.dart';
import 'package:misora_note/features/component/custom_icon.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/card/unit_card.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/component/skill/atk_pattern.dart';
import 'package:misora_note/l10n/app_localizations.dart';
import 'package:misora_note/features/error_page.dart';
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
          return ErrorPage(
            title: t.no_data_error,
            message: 'Error: ${characterData.error}',
            icon: Icons.error_outline,
          );
        }
        if (characterData.value != null) {
          unitInfo = AllUnitData.fromUnitData(characterData.value!);
        }
      case UnitType.enemySummon:
      case UnitType.enemy:
        final enemyParameter = ref.watch(
          enemyParameterProvider(
            EnemyParameterProviderParameter(
              enemyId: widget.card.unitId,
              enemyType: widget.card.enemyType ?? EnemyType.all,
            ),
          ),
        );
        if (enemyParameter.isLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (enemyParameter.hasError) {
          return ErrorPage(
            title: t.no_data_error,
            message: 'Error: ${enemyParameter.error}',
            icon: Icons.error_outline,
          );
        }
        if (enemyParameter.value != null) {
          parameter = enemyParameter.value!;
          final enemyData = ref.watch(enemyDataProvider(parameter.unitId));
          if (enemyData.isLoading) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (enemyData.value != null) {
            unitInfo = AllUnitData.fromUnitEnemyData(enemyData.value!);
          }
        }
    }

    if (unitInfo == null) {
      return ErrorPage(
        title: t.no_data_error,
        message: 'Unit ID: ${widget.card.unitId}',
        icon: Icons.search_off,
      );
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
          enemyParameter: parameter,
          atkType: unitInfo.atkType ?? 0,
          normalAttackCastTime: unitInfo.normalAtkCastTime ?? 0,
        ),
      ),
    );

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
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
                backgroundColor: colorScheme.surface,
                leading: const CustomIconButton(),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      unitCard.unitImage?.copyWith(
                            width: width,
                            height: expandedHeight,
                          ) ??
                          Container(color: colorScheme.surface),
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(
                          color: colorScheme.surface.withValues(alpha: 0.32),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Hero(
                          tag: "unit_card_${unitInfo.unitId}",
                          child: IgnorePointer(child: unitCard),
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
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 920),
                    child: Text(
                      unitInfo.comment!.replaceAll("\\n", ""),
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ),

          if (widget.card.unitType == UnitType.unit)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 4),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    FilledButton.tonalIcon(
                      onPressed: () => context.push(
                        AppRoutes.uniqueEquipList,
                        extra: UniqueEquipRouteArguments(
                          initialUnitId: unitInfo!.unitId,
                          returnToCharacterDetail: true,
                        ),
                      ),
                      icon: const Icon(Icons.shield_outlined),
                      label: Text(t.unique_equip_list),
                    ),
                    FilledButton.tonalIcon(
                      onPressed: () => context.push(
                        AppRoutes.characterBond,
                        extra: unitInfo!.unitId,
                      ),
                      icon: const Icon(Icons.favorite_outline_rounded),
                      label: Text(t.character_bond),
                    ),
                  ],
                ),
              ),
            ),

          if (parameter != null)
            SliverToBoxAdapter(
              child: _EnemyParameterSection(parameter: parameter),
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
                atk: parameter == null
                    ? 0
                    : max(parameter.atk, parameter.magicStr),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _EnemyParameterSection extends StatelessWidget {
  final AllUnitParameter parameter;

  const _EnemyParameterSection({required this.parameter});

  String _formatValue(num value) {
    if (value is double && value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final basic = <(String, num)>[
      (t.enemy_id, parameter.enemyId),
      (t.unit_id, parameter.unitId),
      (t.enemy_level_label, parameter.level),
      (t.enemy_rarity, parameter.rarity),
      (t.enemy_promotion_level, parameter.promotionLevel),
    ];
    final combat = <(String, num)>[
      (t.attr_hp, parameter.hp),
      (t.enemy_virtual_hp, parameter.virtualHp),
      (t.attr_atk, parameter.atk),
      (t.attr_magic_str, parameter.magicStr),
      (t.attr_def, parameter.def_),
      (t.attr_magic_def, parameter.magicDef),
      (t.attr_physical_critical, parameter.physicalCritical),
      (t.attr_magic_critical, parameter.magicCritical),
      (t.attr_physical_penetrate, parameter.physicalPenetrate),
      (t.attr_magic_penetrate, parameter.magicPenetrate),
      (t.attr_accuracy, parameter.accuracy),
      (t.attr_dodge, parameter.dodge),
      (t.attr_life_steal, parameter.lifeSteal),
      (t.attr_wave_hp_recovery, parameter.waveHpRecovery),
      (t.attr_wave_energy_recovery, parameter.waveEnergyRecovery),
      (t.attr_hp_recovery_rate, parameter.hpRecoveryRate),
      (t.attr_energy_recovery_rate, parameter.energyRecoveryRate),
      (t.attr_energy_reduce_rate, parameter.energyReduceRate),
    ];
    final special = <(String, num)>[
      (t.enemy_break_durability, parameter.breakDurability),
      (t.enemy_resist_status_id, parameter.resistStatusId),
      (t.enemy_resist_variation_id, parameter.resistVariationId),
      (t.enemy_unique_equipment_flag, parameter.uniqueEquipmentFlag1),
      (t.enemy_color, parameter.enemyColor),
    ];
    final skills = <(String, num)>[
      ('UB', parameter.unionBurstLevel),
      for (var index = 0; index < 10; index++)
        ('主技能 ${index + 1}', mainSkillLevels(parameter)[index]),
      for (var index = 0; index < 5; index++)
        ('EX 技能 ${index + 1}', exSkillLevels(parameter)[index]),
    ];

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 920),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
          child: Card.outlined(
            clipBehavior: Clip.antiAlias,
            child: ExpansionTile(
              leading: Icon(Icons.query_stats_rounded, color: colors.primary),
              title: Text(
                t.enemy_parameters,
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              subtitle: Text(
                '${t.enemy_id} ${parameter.enemyId} · ${t.enemy_level(parameter.level)}',
              ),
              childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
              children: [
                ParameterGroup(
                  title: t.enemy_parameter_basic,
                  values: basic,
                  formatValue: _formatValue,
                ),
                ParameterGroup(
                  title: t.enemy_parameter_combat,
                  values: combat,
                  formatValue: _formatValue,
                ),
                ParameterGroup(
                  title: t.enemy_parameter_special,
                  values: special,
                  formatValue: _formatValue,
                ),
                ParameterGroup(
                  title: t.enemy_parameter_skill_levels,
                  values: skills,
                  formatValue: _formatValue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ParameterGroup extends StatelessWidget {
  final String title;
  final List<(String, num)> values;
  final String Function(num) formatValue;

  const ParameterGroup({
    super.key,
    required this.title,
    required this.values,
    required this.formatValue,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final value in values)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: colors.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Text('${value.$1}: ${formatValue(value.$2)}'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<int> mainSkillLevels(AllUnitParameter parameter) => [
  parameter.mainSkillLv1,
  parameter.mainSkillLv2,
  parameter.mainSkillLv3,
  parameter.mainSkillLv4,
  parameter.mainSkillLv5,
  parameter.mainSkillLv6,
  parameter.mainSkillLv7,
  parameter.mainSkillLv8,
  parameter.mainSkillLv9,
  parameter.mainSkillLv10,
];

List<int> exSkillLevels(AllUnitParameter parameter) => [
  parameter.exSkillLv1,
  parameter.exSkillLv2,
  parameter.exSkillLv3,
  parameter.exSkillLv4,
  parameter.exSkillLv5,
];
