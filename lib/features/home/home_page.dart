import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kanna_note/app.dart';
import 'package:kanna_note/core/component/image.dart';
import 'package:kanna_note/core/db/database.dart';
import 'package:kanna_note/core/db/model.dart';
import 'package:kanna_note/core/network/download.dart';
import 'package:kanna_note/core/utils/app_router.dart';
import '../../constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _progress;
  late UnitInfo unitInfo;
  AppDb? db;
  late CachedImage cachedImage;
  @override
  void initState() {
    super.initState();
    db = AppDb(File(FilePath.db(Area.cn)));
    Future.microtask(() async {
      await db?.init();
      unitInfo = (await db?.getUnitInfo(170101))!;
      cachedImage = CachedImage(
        url: FetchUrl.fullcardUrl(1701, 3),
        width: 486,
        height: 486 / 1.4,
        borderRadius: BorderRadius.circular(8),
      );
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
            const Text('Home (Phase 0 Scaffold)'),
            const SizedBox(height: 12),
            FilledButton(
              onPressed:
                  () => context.go(
                    AppRoutes.unitDetail,
                    extra: UnitPageExtra(
                      unitInfo: unitInfo,
                      cachedImage: cachedImage,
                    ),
                  ),
              child: const Text('Go Settings'),
            ),
            const SizedBox(height: 12),
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
