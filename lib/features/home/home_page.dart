import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/features/component/unit_card.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/di.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  AppDb get db => ref.read(dbProvider);
  List<UnitInfo> units = [];
  double? _progress;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await db.init();
      List<int> showUnit = await db
          .getUnitsData(type: UnitRankType.lastUpdate, limit: 5)
          .then((value) => value.map((e) => e.unitId).toList());
      final units = await _loadUnits(showUnit);
      setState(() {
        this.units = units;
      });
    });
  }

  Future<void> _startUpdate() async {
    setState(() {
      _progress = null;
    });
    await db.init();
  }

  Future<List<UnitInfo>> _loadUnits(List<int> showUnit) async {
    List<UnitInfo> units = [];
    for (var id in showUnit) {
      var info = await db.getUnitInfo(id);
      if (info != null) {
        units.add(info);
      }
    }
    return units;
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final cardWidth = min(max(486.0, mediaWidth * 0.33), mediaWidth);
    final cardHeight = cardWidth * 792 / 1408;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '美空笔记',
          style: textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Color(CustomColors.colorPrimary),
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              title: Row(
                children: [
                  Icon(Icons.auto_awesome),
                  SizedBox(width: 8),
                  Text(
                    '角色',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            if (units.isEmpty)
              const Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              )
            else
              SizedBox(
                height: cardHeight,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  physics: const BouncingScrollPhysics(),
                  cacheExtent: cardWidth,
                  itemCount: units.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, i) {
                    final unit = units[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: UnitCard(
                        unitInfo: unit,
                        isR6: db.r6Units.contains(unit.unitId),
                        size: (cardWidth, cardHeight),
                      ),
                    );
                  },
                ),
              ),

            FilledButton(
              onPressed: _progress == null ? _startUpdate : null,
              child: const Text('更新数据库'),
            ),
            if (_progress != null) ...[
              const SizedBox(height: 16),
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(value: _progress),
              ),
              const SizedBox(height: 8),
              Text('${(_progress! * 100).toStringAsFixed(1)}%'),
            ],
          ],
        ),
      ),
    );
  }
}
