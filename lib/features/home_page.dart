import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/features/component/custom_dialog.dart';
import 'package:misora_note/features/component/update/app_check_update.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/update/database_update.dart';
import 'package:misora_note/features/component/card/unit_card.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/core/utils/util.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/features/component/tool_entry.dart';
import 'package:misora_note/features/component/schedule_section.dart';
import 'package:misora_note/l10n/app_localizations.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  AppDb get db => ref.watch(dbProvider); // watch以便db变化时自动刷新
  List<int> showUnit = [];

  Future<void> checkAppUpdate() async {
    final appAutoUpdate = ref.read(appAutoUpdateProvider);
    if (appAutoUpdate.value == true) {
      final newer = await fetchLatestRelease();
      final packageInfo = ref.read(packageInfoProvider);
      final currentVersion = packageInfo.value?.version;
      final service = GithubUpdateService(newer: newer);
      if (!mounted) return;
      if (service.checkUpdate(currentVersion)) {
        await showDialog<Widget>(
          context: context,
          builder: (BuildContext context) {
            return service;
          },
        );
      }
    }
  }

  Future<void> checkDbUpdate(Area area) async {
    final latestVersion = await checkDatabaseUpdate(area);
    if (latestVersion == null || !mounted) return;

    // Await the persisted value. Reading AsyncValue.value while the provider is
    // rebuilding briefly returns null, which used to create a false update hit.
    final currentVersion = await ref.read(currentDbVersionProvider.future);
    if (!mounted) return;
    final service = DatabaseUpdateService(newVersion: latestVersion);

    if (service.checkUpdate(currentVersion)) {
      await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return service;
        },
      );
    }
  }

  /// 检查数据库文件是否存在
  Future<bool> checkDatabaseExists() async {
    final t = AppLocalizations.of(context)!;
    final dbFile = db.dbFile;
    final area = ref.read(areaProvider);

    if (!dbFile.existsSync()) {
      await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text(t.database_missing),
            content: Text(t.database_missing_hit),
            actions: [
              FilledButton(
                onPressed: () async {
                  final latestVersion = await LoadingDialog.show(
                    dialogContext,
                    task: checkDatabaseUpdate(area),
                    title: t.check_update,
                  );
                  if (!dialogContext.mounted || !mounted) return;
                  Navigator.of(dialogContext).pop();
                  await updateDatabase(ref, context, latestVersion);
                  await init();
                },
                child: Text(t.download),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: Text(t.close),
              ),
            ],
          );
        },
      );
      return false; // 数据库不存在
    }
    return true; // 数据库存在
  }

  /// 初始化数据库并加载数据
  Future<void> initializeDatabase() async {
    final t = AppLocalizations.of(context)!;
    final area = ref.read(areaProvider);

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
      // 初始化失败，数据库损坏
      if (mounted && context.mounted) {
        await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              title: Text(t.database_broken),
              content: Text(t.database_broken_hit),
              actions: [
                FilledButton(
                  onPressed: () async {
                    final latestVersion = await LoadingDialog.show(
                      dialogContext,
                      task: checkDatabaseUpdate(area),
                      title: t.check_update,
                    );
                    if (!dialogContext.mounted || !mounted) return;
                    Navigator.of(dialogContext).pop();
                    await updateDatabase(ref, context, latestVersion);
                    await init();
                  },
                  child: Text(t.download),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
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

  /// 主初始化函数
  Future<void> init() async {
    // 1. 检查应用更新
    final appAutoUpdate = ref.read(appAutoUpdateProvider);
    if (appAutoUpdate.value == true) {
      await checkAppUpdate();
    }
    if (!mounted) return;

    // 2. 检查数据库文件是否存在
    final dbExists = await checkDatabaseExists();
    if (!dbExists) {
      return; // 数据库不存在，用户需要手动下载
    }

    // 3. 检查数据库自动更新
    final area = ref.read(areaProvider);
    final autoUpdate = ref.read(databaseAutoUpdateProvider);
    if (autoUpdate.value == true) {
      await checkDbUpdate(area);
    }
    if (!mounted) return;

    // 4. 初始化数据库并加载数据
    await initializeDatabase();
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
    final cardWidth = min(
      max(360.0, mediaWidth * 0.4),
      max(280.0, mediaWidth - 32),
    );
    final cardHeight = cardWidth * 792 / 1408;
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final t = AppLocalizations.of(context)!;
    final uniquePreview = showUnit.isEmpty
        ? null
        : ref.watch(uniqueEquipListProvider((search: '', slot: 0, unitId: 0)));
    final shortcuts = [
      (
        icon: Icons.travel_explore_rounded,
        title: t.deep_zone,
        description: t.deep_zone_desc,
        color: const Color(CustomColors.colorRed),
        onTap: () => context.push(AppRoutes.deepZone),
      ),
      (
        icon: Icons.groups_2_rounded,
        title: t.clan_battle_query,
        description: t.clan_battle_query_desc,
        color: const Color(0xFF8D5BD6),
        onTap: () => context.push(AppRoutes.enemySearch, extra: EnemyType.clan),
      ),
      (
        icon: Icons.favorite_rounded,
        title: t.character_bond,
        description: t.character_bond_desc,
        color: const Color(0xFFD45A86),
        onTap: () => context.push(AppRoutes.characterBond),
      ),
      (
        icon: Icons.shield_rounded,
        title: t.unique_equip_list,
        description: t.unique_equip_desc,
        color: const Color(0xFFE8872E),
        onTap: () => context.push(AppRoutes.uniqueEquipList),
      ),
      (
        icon: Icons.pest_control_rounded,
        title: t.enemy_search,
        description: t.enemy_search_desc,
        color: const Color(0xFF3B9B8F),
        onTap: () => context.push(AppRoutes.enemySearch),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          t.app_name,
          style: textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 4),
            sliver: SliverToBoxAdapter(
              child: ToolSectionTitle(
                icon: Icons.auto_awesome_rounded,
                title: t.characters,
                trailingText: showUnit.isEmpty ? null : db.unitNum.toString(),
                onTap: () =>
                    context.push(AppRoutes.unitSearch, extra: showUnit),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: showUnit.isEmpty
                ? const SizedBox(
                    height: 120,
                    child: Center(child: CircularProgressIndicator()),
                  )
                : SizedBox(
                    height: cardHeight + 16,
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
          ),
          if (uniquePreview != null) ...[
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
              sliver: SliverToBoxAdapter(
                child: ToolSectionTitle(
                  icon: Icons.handyman_rounded,
                  title: t.unique_equips,
                  trailingText: uniquePreview.value == null
                      ? null
                      : '${uniquePreview.value!.where((item) => item.equipSlot == 1).length} · ${uniquePreview.value!.where((item) => item.equipSlot == 2).length}',
                  onTap: () => context.push(AppRoutes.uniqueEquipList),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: uniquePreview.when(
                loading: () => const SizedBox(
                  height: 150,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (_, _) => const SizedBox.shrink(),
                data: (items) {
                  final equip1 = items
                      .where((item) => item.equipSlot == 1)
                      .take(18)
                      .toList(growable: false);
                  final equip2 = items
                      .where((item) => item.equipSlot == 2)
                      .take(18)
                      .toList(growable: false);
                  final preview = <UniqueEquipListItem>[];
                  final columnCount = max(equip1.length, equip2.length);
                  for (var index = 0; index < columnCount; index++) {
                    if (index < equip1.length) preview.add(equip1[index]);
                    if (index < equip2.length) preview.add(equip2[index]);
                  }
                  return SizedBox(
                    height: 190,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.fromLTRB(16, 6, 16, 14),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 1,
                          ),
                      itemCount: preview.length,
                      itemBuilder: (context, index) => _UniqueEquipPreviewCard(
                        item: preview[index],
                        onTap: () => context.push(
                          AppRoutes.uniqueEquipList,
                          extra: preview[index].unitId,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 8),
            sliver: SliverToBoxAdapter(
              child: ToolSectionTitle(
                icon: Icons.bolt_rounded,
                title: t.quick_access,
                subtitle: t.quick_access_desc,
                onTap: () => context.go(AppRoutes.function),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 440,
                mainAxisExtent: 98,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final shortcut = shortcuts[index];
                return ToolEntryCard(
                  icon: shortcut.icon,
                  title: shortcut.title,
                  description: shortcut.description,
                  accentColor: shortcut.color,
                  onTap: shortcut.onTap,
                );
              }, childCount: shortcuts.length),
            ),
          ),
          const SliverToBoxAdapter(child: HomeScheduleSection()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
              child: ColoredBox(color: colors.surface),
            ),
          ),
        ],
      ),
    );
  }
}

class _UniqueEquipPreviewCard extends StatelessWidget {
  final UniqueEquipListItem item;
  final VoidCallback onTap;

  const _UniqueEquipPreviewCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: item.equipmentName,
      child: InkResponse(
        onTap: onTap,
        radius: 44,
        child: CachedImage(
          url: FetchUrl.equipmentIconUrl(item.equipmentId),
          width: 78,
          height: 78,
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
