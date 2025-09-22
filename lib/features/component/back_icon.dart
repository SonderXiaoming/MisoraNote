import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';

class BackIcon extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final double paddingValue;
  final double iconSize;
  final double? backgroundSize; // 新增：控制背景圆形的大小
  const BackIcon(
      {super.key,
      required this.backgroundColor,
      this.iconColor = const Color(CustomColors.colorPrimary),
      this.paddingValue = 8,
      this.iconSize = 18,
      this.backgroundSize}); // 新增参数

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingValue),
      child: SizedBox(
        width: backgroundSize,
        height: backgroundSize,
        child: ClipOval(
          child: Material(
            color: backgroundColor, // Button color
            child: InkWell(
              onTap: () => context.pop(),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: iconColor,
                size: iconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
