import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/unit_card.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/l10n/app_localizations.dart';
import 'package:misora_note/core/network/download.dart';

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
      _progress = 0.0; // 初始化进度为0
    });

    try {
      await updatePcrDatabase(
        Area.cn,
        onProgress: (received, total) {
          if (total > 0 && mounted) {
            setState(() {
              _progress = received / total; // 更新进度
            });
          }
        },
      );
      // 数据库更新完成后重新初始化
      await init();
    } catch (e) {
      // 错误处理：显示错误信息或重置进度
      if (mounted) {
        setState(() {
          _progress = null;
        });
      }
      // 可以添加错误提示
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('数据库更新失败: $e')),
        );
      }
    } finally {
      // 完成后隐藏进度条
      if (mounted) {
        setState(() {
          _progress = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final cardWidth = min(max(420.0, mediaWidth * 0.4), mediaWidth);
    final cardHeight = cardWidth * 792 / 1408;
    final textTheme = Theme.of(context).textTheme;
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          t.app_name,
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
              title: InkWell(
                onTap: () {
                  context.push(AppRoutes.unitSearch, extra: showUnit);
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    children: [
                      Icon(Icons.auto_awesome),
                      SizedBox(width: 8),
                      Text(
                        t.character,
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    ],
                  ),
                ),
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
