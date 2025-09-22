import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/features/component/unit_card.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/di/di.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  AppDb get db => ref.watch(dbProvider); // watch以便db变化时自动刷新
  double? _progress;
  List<int> showUnit = [];

  Future<void> init() async {
    await db.init();
    final units = await db
        .getUnitsData(type: UnitRankType.lastUpdate, limit: 6)
        .then((value) => value.map((e) => e.unitId).toList());
    if (mounted) {
      setState(() {
        showUnit = units;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      init();
    });
  }

  Future<void> _startUpdate() async {
    setState(() {
      _progress = null;
    });
    await init();
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final cardWidth = min(max(420.0, mediaWidth * 0.4), mediaWidth);
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
            if (showUnit.isEmpty)
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
                  itemCount: showUnit.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemBuilder: (context, i) {
                    final unit = showUnit[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Hero(
                        tag: 'unit_card_$unit',
                        child: UnitCard(
                          unitId: unit,
                          isR6: db.r6Units.contains(unit),
                          size: (cardWidth, cardHeight),
                        ),
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
