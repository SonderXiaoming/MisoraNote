import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/features/component/data_model.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/component/unit_card.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/di.dart';
import '../component/skill_info.dart';

class UnitPage extends ConsumerStatefulWidget {
  final UnitInfo unitInfo;
  final UnitCard card;

  const UnitPage({super.key, required this.unitInfo, required this.card});

  @override
  ConsumerState<UnitPage> createState() => _UnitPage();
}

class _UnitPage extends ConsumerState<UnitPage> {
  UnitSkillList? unitSkillList;
  @override
  void initState() {
    super.initState();
    final db = ref.read(dbProvider);
    Future.microtask(() async {
      final unitSkillList = await getUnitSkillList(
        db,
        (widget.unitInfo.cutin1Star6 != 0 &&
                widget.unitInfo.cutin1Star6 != null)
            ? widget.unitInfo.cutin1Star6!
            : widget.unitInfo.unitId,
      );
      if (mounted) {
        setState(() {
          this.unitSkillList = unitSkillList;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CachedImage(
                  url: widget.card.imageUrl,
                  height: widget.card.size.$2,
                  width: width,
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: Container(color: Colors.white.withAlpha(80)),
                  ),
                ),
                Align(alignment: Alignment.center, child: widget.card),
              ],
            ),
            const SizedBox(height: 16),
            if (unitSkillList == null)
              const Center(child: CircularProgressIndicator()),
            if (unitSkillList != null)
              AllSkillInfo(skillIdList: unitSkillList!),
          ],
        ),
      ),
    );
  }
}
