import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/tag.dart';
import 'package:misora_note/l10n/app_localizations.dart';

class EnemyCard extends StatelessWidget {
  final (double, double) size;
  final UnitEnemyDataData enemyUnit;
  final EnemyWeaknessInfo? weaknessInfo;
  const EnemyCard({
    super.key,
    this.size = const (1408, 792),
    required this.enemyUnit,
    required this.weaknessInfo,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final searchAreaWidthType = SearchAreaWidthType.getType(
      enemyUnit.searchAreaWidth ?? 0,
    );
    final textColor = Color(CustomColors.colorWhite);
    final textStyle = TextStyle(
      fontSize: size.$2 * 0.055,
      fontWeight: FontWeight.w500,
      color: textColor,
    );
    final t = AppLocalizations.of(context)!;
    List<int> weaknessList = [];
    if (weaknessInfo != null) {
      weaknessList = [
        weaknessInfo!.talent1,
        weaknessInfo!.talent2,
        weaknessInfo!.talent3,
        weaknessInfo!.talent4,
        weaknessInfo!.talent5,
      ];
    }
    return SizedBox(
      width: size.$1,
      height: size.$2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            enemyUnit.unitName,
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SearchAreaWidthType.getIcon(
                  searchAreaWidthType,
                  size.$2 * 0.15,
                  size.$2 * 0.15,
                ),
                SizedBox(width: size.$2 * 0.01),
                Text(
                  "${enemyUnit.searchAreaWidth}",
                  style: textStyle.copyWith(fontSize: size.$2 * 0.17),
                ),
              ],
            ),
          ),
          /*
          if (weaknessList.any((v) => v != 100)) ...[
            SizedBox(height: 8),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 4,
              children: weaknessList.asMap().entries.map((entry) {
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
                    style: textStyle.copyWith(fontSize: size.$2 * 0.17),
                  ),
                );
              }).toList(),
            ),
          ],
           */
        ],
      ),
    );
  }
}
