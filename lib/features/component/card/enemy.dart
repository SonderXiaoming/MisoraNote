import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/image.dart';
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
          CachedImageWithHide(
            url: FetchUrl.unitIconUrl(enemyUnit.unitId),
            width: size.$1 * 0.08,
            height: size.$1 * 0.08,
          ),
          SizedBox(height: 8),
          Text(
            enemyUnit.unitName,
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Color(CustomColors.colorPrimary),
            ),
          ),
          SizedBox(height: 8),
          if (weaknessList.any((v) => v != 100)) ...[
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
                  backgroundColor: Color(talent.color).withAlpha(200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 1.0,
                  ),
                  child: Text(
                    "${talent.getName(t)}+$value%",
                    style: textStyle.copyWith(fontSize: size.$2 * 0.1),
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
