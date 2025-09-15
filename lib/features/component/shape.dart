import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * (1 - ratioGolden), 0); // 左上
    path.lineTo(0, size.height); // 左下
    path.lineTo(size.width, size.height); // 右下
    path.lineTo(size.width, 0); // 右上
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
