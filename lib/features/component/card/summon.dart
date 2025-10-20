import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/general.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/tag.dart';

class SummonCard extends StatelessWidget {
  final (double, double) size;
  final AllUnitData summonUnit;
  const SummonCard({
    super.key,
    this.size = const (1408, 792),
    required this.summonUnit,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final searchAreaWidthType = SearchAreaWidthType.getType(
      summonUnit.searchAreaWidth ?? 0,
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
            summonUnit.unitName,
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Color(CustomColors.colorPrimary),
            ),
          ),
          SizedBox(height: 8),
          BaseTag(
            backgroundColor: Color(searchAreaWidthType.color),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                searchAreaWidthType.getIcon(size.$2 * 0.15, size.$2 * 0.15),
                SizedBox(width: size.$2 * 0.01),
                Text(
                  "${summonUnit.searchAreaWidth}",
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
