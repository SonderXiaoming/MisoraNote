import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/features/component/app_check_update.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/database_update.dart';
import 'package:misora_note/features/component/unit_card.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/core/storage/prefs.dart';
import 'package:misora_note/core/utils/util.dart';
import 'package:misora_note/l10n/app_localizations.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  AppDb get db => ref.watch(dbProvider); // watch以便db变化时自动刷新
  List<int> showUnit = [];

  Future<void> init() async {
    final t = AppLocalizations.of(context)!;
    final newer = await fetchLatestRelease();
    if (newer != null) {
      final version = newer.tag_name.isNotEmpty ? newer.tag_name : newer.name;
      final packageInfo = ref.read(packageInfoProvider);
      final currentVersion = packageInfo.value?.version;
      final appAutoUpdate = ref.read(appAutoUpdateProvider);
      if (version != currentVersion && appAutoUpdate.value == true) {
        await showDialog<Widget>(
          context: context,
          builder: (BuildContext context) {
            return GithubUpdateService(newer: newer);
          },
        );
      }
    }
    // 检查数据库文件是否存在
    final dbFile = db.dbFile;
    final area = ref.read(areaProvider);

    if (!dbFile.existsSync()) {
      // 数据库文件不存在，要求强制更新
      if (mounted && context.mounted) {
        await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(t.database_missing),
              content: Text(t.database_missing_hit),
              actions: [
                FilledButton(
                  onPressed: () async {
                    final latestVersion = await checkDatabaseUpdate(
                      ref.read(areaProvider),
                    );
                    Navigator.of(context).pop();
                    updateDatabase(
                      ref,
                      context,
                      latestVersion,
                    ).then((value) => init());
                  },
                  child: Text(t.download),
                ),

                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(t.close),
                ),
              ],
            );
          },
        );
      }
    }

    // 检查自动更新设置
    final autoUpdate = await Prefs.needAutoUpdate();
    if (autoUpdate) {
      final latestVersion = await checkDatabaseUpdate(area);
      if (latestVersion != null) {
        final currentVersion = await Prefs.dbVersion(area);

        if (currentVersion != latestVersion && mounted && context.mounted) {
          // 有新版本，询问用户是否更新
          await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return DatabaseUpdateDialog(newVersion: latestVersion);
            },
          );
        }
      }
    }

    try {
      // 正常初始化数据库
      await db.init();
      final units = await db
          .getUnitsData(type: UnitRankType.lastUpdate, limit: 6)
          .then((value) => value.map((e) => e.unitId).toList());
      if (mounted) {
        setState(() {
          showUnit = units;
        });
      }
    } catch (e) {
      // 初始化失败，损坏！
      if (mounted && context.mounted) {
        await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(t.database_broken),
              content: Text(t.database_broken_hit),
              actions: [
                FilledButton(
                  onPressed: () async {
                    final latestVersion = await checkDatabaseUpdate(
                      ref.read(areaProvider),
                    );
                    Navigator.of(context).pop();
                    updateDatabase(
                      ref,
                      context,
                      latestVersion,
                    ).then((value) => init());
                  },
                  child: Text(t.download),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(t.close),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      init();
    });
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
              backgroundColor: Colors.transparent,
              title: InkWell(
                onTap: () {
                  context.push(AppRoutes.unitSearch, extra: showUnit);
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
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
                      Text(
                        db.unitNum.toString(),
                        style: textTheme.titleLarge?.copyWith(
                          color: Color(CustomColors.colorBlack),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_ios, size: 18),
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
            AppBar(
              backgroundColor: Colors.transparent,
              title: InkWell(
                onTap: () {
                  context.push(AppRoutes.enemySearch);
                },
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.security),
                      SizedBox(width: 8),
                      Text(
                        t.enemy_character,
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_ios, size: 18),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 24.0, // 水平间距
                  runSpacing: 24.0, // 垂直间距
                  alignment: WrapAlignment.start,
                  children: List.generate(
                    10,
                    (index) => Icon(
                      Icons.construction,
                      color: Colors.grey[300],
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
