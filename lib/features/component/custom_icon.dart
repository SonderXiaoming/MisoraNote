import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';

class CustomIconButton extends StatelessWidget {
  final Color backgroundColor;
  final double paddingValue;
  final double? backgroundSize;
  final VoidCallback? onTap;
  final Widget child;
  const CustomIconButton(
      {super.key,
      required this.backgroundColor,
      this.child = const Icon(Icons.arrow_back_ios_new,
          size: 18, color: Color(CustomColors.colorPrimary)),
      this.onTap,
      this.paddingValue = 8,
      this.backgroundSize});

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
              onTap: onTap ??
                  () {
                    if (GoRouter.of(context).canPop()) {
                      GoRouter.of(context).pop();
                    }
                  },
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
