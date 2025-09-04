import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kanna_note/core/component/unit_card.dart';
import 'package:kanna_note/core/db/database.dart';
import 'package:kanna_note/core/db/model.dart';
import 'package:kanna_note/core/network/download.dart';
import '../../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _progress;
  AppDb db = AppDb(FilePath.db(Area.cn));
  final showUnit = [170101, 170201, 100101, 100201, 100301, 100401];

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await db.init();
    });
  }

  Future<void> _startUpdate() async {
    setState(() {
      _progress = 0;
    });
    await updatePcrDatabase(
      Area.cn,
      onProgress: (rec, total) {
        setState(() {
          _progress = rec / total;
        });
      },
    );
    setState(() {
      _progress = null;
    });
    db = AppDb(FilePath.db(Area.cn));
    await db.init();
  }

  Future<List<UnitInfo>> _loadUnits() async {
    List<UnitInfo> units = [];
    for (var id in showUnit) {
      var info = await db.getUnitInfo(id);
      if (info != null) {
        units.add(info);
      }
    }
    print(units.map((e) => e.unitId).toList());
    return units;
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final cardWidth = min(max(486.0, mediaWidth * 0.33), mediaWidth);
    final cardHeight = cardWidth * 792 / 1408;
    return Scaffold(
      appBar: AppBar(title: const Text('MisoraNote')),
      body: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(title: const Text('角色')),
            FutureBuilder(
              future: _loadUnits(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text(
                    'Error: ${snapshot.error} ${snapshot.stackTrace}',
                  );
                } else if (snapshot.hasData) {
                  final units = snapshot.data!;
                  return SizedBox(
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
                  );
                } else {
                  return const Text('No data');
                }
              },
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
