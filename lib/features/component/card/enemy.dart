import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/tag.dart';

class EnemyCard extends StatelessWidget {
  final (double, double) size;
  final UnitEnemyDataData enemyUnit;
  const EnemyCard({
    super.key,
    this.size = const (1408, 792),
    required this.enemyUnit,
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
        ],
      ),
    );
  }
}
