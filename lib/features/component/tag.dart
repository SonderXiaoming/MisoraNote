import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';

class BaseTag extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  const BaseTag({
    super.key,
    required this.child,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(12.0)),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}

class BaseCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double borderRadius;
  final Color backgroundColor;
  final List<BoxShadow> boxShadow;
  final Border border;

  const BaseCard({
    super.key,
    required this.child,
    required this.border,
    this.margin = const EdgeInsets.all(16),
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
    this.borderRadius = 12,
    this.backgroundColor = const Color(CustomColors.colorWhite),
    this.boxShadow = const [
      BoxShadow(blurRadius: 12, spreadRadius: 0, color: Color(0x14000000)),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow,
        border: border,
      ),
      child: child,
    );
  }
}
