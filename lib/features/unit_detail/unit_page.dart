import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanna_note/features/component/image.dart';
import 'package:kanna_note/features/component/unit_card.dart';
import 'package:kanna_note/core/db/model.dart';
import 'package:kanna_note/di.dart';

class UnitPage extends ConsumerWidget {
  final UnitInfo unitInfo;
  final UnitCard card;

  const UnitPage({super.key, required this.unitInfo, required this.card});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.read(dbProvider);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              CachedImage(
                url: card.imageUrl,
                height: card.size.$2,
                width: width,
              ),
              // 半透明遮罩
              Positioned.fill(
                right: 0,
                left: 0,
                top: 0,
                bottom: 0,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: Container(
                    color: Colors.white.withAlpha(80), // 可调整透明度
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SizedBox(child: card, width: width)],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
