import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomIconButton extends StatelessWidget {
  final Color? backgroundColor;
  final double paddingValue;
  final double? backgroundSize;
  final VoidCallback? onTap;
  final Widget? child;
  const CustomIconButton({
    super.key,
    this.backgroundColor,
    this.child,
    this.onTap,
    this.paddingValue = 8,
    this.backgroundSize,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.all(paddingValue),
      child: SizedBox(
        width: backgroundSize,
        height: backgroundSize,
        child: ClipOval(
          child: Material(
            color: backgroundColor ?? colors.primaryContainer,
            child: InkWell(
              onTap:
                  onTap ??
                  () {
                    if (GoRouter.of(context).canPop()) {
                      GoRouter.of(context).pop();
                    }
                  },
              child:
                  child ??
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: colors.onPrimaryContainer,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
