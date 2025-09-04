import 'package:flutter/material.dart';
import 'package:kanna_note/constants.dart';
import 'package:kanna_note/core/component/image.dart';
import 'package:kanna_note/core/db/model.dart';

class UnitPage extends StatelessWidget {
  final UnitInfo unitInfo;
  final CachedImage unitImage;

  const UnitPage({super.key, required this.unitInfo, required this.unitImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [unitImage]));
  }
}
