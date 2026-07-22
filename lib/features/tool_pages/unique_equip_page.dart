import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/database.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/card/unit_card.dart';
import 'package:misora_note/features/component/image.dart';
import 'package:misora_note/l10n/app_localizations.dart';

class UniqueEquipPage extends ConsumerStatefulWidget {
  final int? initialUnitId;

  const UniqueEquipPage({super.key, this.initialUnitId});

  @override
  ConsumerState<UniqueEquipPage> createState() => _UniqueEquipPageState();
}

class _UniqueEquipPageState extends ConsumerState<UniqueEquipPage>
    with SingleTickerProviderStateMixin {
  final SearchController _searchController = SearchController();
  String _search = '';
  late int _unitId;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _unitId = widget.initialUnitId ?? 0;
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final filter = (search: _search, slot: 0, unitId: _unitId);
    final result = ref.watch(uniqueEquipListProvider(filter));
    final selectedUnit = _unitId == 0
        ? null
        : ref.watch(unitDataProvider(_unitId));
    final allItems = result.value ?? const <UniqueEquipListItem>[];
    final count1 = allItems.where((item) => item.equipSlot == 1).length;
    final count2 = allItems.where((item) => item.equipSlot == 2).length;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedUnit?.value?.unitName == null
              ? t.unique_equip_list
              : t.unit_unique_equip_list(selectedUnit!.value!.unitName),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 6),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: SearchBar(
                  controller: _searchController,
                  leading: const Icon(Icons.search_rounded),
                  hintText: t.search_unique_equip_hint,
                  onChanged: (value) => setState(() => _search = value.trim()),
                  trailing: _search.isEmpty
                      ? null
                      : [
                          IconButton(
                            tooltip: t.close,
                            onPressed: () {
                              _searchController.clear();
                              setState(() => _search = '');
                            },
                            icon: const Icon(Icons.close_rounded),
                          ),
                        ],
                ),
              ),
            ),
          ),
          if (_unitId != 0)
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: ActionChip(
                  avatar: const Icon(Icons.people_alt_outlined, size: 18),
                  label: Text(t.show_all_characters),
                  onPressed: () => setState(() => _unitId = 0),
                ),
              ),
            ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: TabBar(
                controller: _tabController,
                dividerColor: colors.outlineVariant,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                tabs: [
                  Tab(text: '①  $count1'),
                  Tab(text: '②  $count2'),
                ],
              ),
            ),
          ),
          Expanded(
            child: result.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => _ErrorState(
                error: error,
                onRetry: () => ref.invalidate(uniqueEquipListProvider(filter)),
              ),
              data: (items) {
                final equip1 = items
                    .where((item) => item.equipSlot == 1)
                    .toList(growable: false);
                final equip2 = items
                    .where((item) => item.equipSlot == 2)
                    .toList(growable: false);
                return TabBarView(
                  controller: _tabController,
                  children: [
                    _UniqueEquipGrid(
                      items: equip1,
                      onTap: (item) => _showDetail(context, item),
                    ),
                    _UniqueEquipGrid(
                      items: equip2,
                      onTap: (item) => _showDetail(context, item),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDetail(BuildContext context, UniqueEquipListItem item) {
    final pageContext = context;
    final db = ref.read(dbProvider);
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => _UniqueEquipDetailSheet(
        db: db,
        item: item,
        onOpenCharacter: () {
          Navigator.of(context).pop();
          final width = MediaQuery.sizeOf(pageContext).width;
          pageContext.push(
            AppRoutes.unitDetail,
            extra: UnitCard(
              unitId: item.unitId,
              unitType: UnitType.unit,
              size: (width, width * 792 / 1408),
            ),
          );
        },
      ),
    );
  }
}

class _UniqueEquipGrid extends StatelessWidget {
  final List<UniqueEquipListItem> items;
  final ValueChanged<UniqueEquipListItem> onTap;

  const _UniqueEquipGrid({required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    if (items.isEmpty) {
      return _EmptyState(message: t.no_unique_equip_data);
    }
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(12, 14, 12, 32),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 520,
        mainAxisExtent: 244,
        crossAxisSpacing: 10,
        mainAxisSpacing: 8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => _UniqueEquipCard(
        item: items[index],
        onTap: () => onTap(items[index]),
      ),
    );
  }
}

class _UniqueEquipCard extends StatelessWidget {
  final UniqueEquipListItem item;
  final VoidCallback onTap;

  const _UniqueEquipCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedImage(
                url: FetchUrl.equipmentIconUrl(item.equipmentId),
                width: 78,
                height: 78,
                borderRadius: BorderRadius.circular(15),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: const BoxConstraints(minHeight: 34),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Text(
                        item.equipmentName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: colors.onPrimary,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Expanded(
                      child: Card.filled(
                        margin: EdgeInsets.zero,
                        clipBehavior: Clip.antiAlias,
                        color: colors.surfaceContainerLow,
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item.equipSlot == 2 ? '②' : '①'}${item.description.isEmpty ? t.no_description : item.description.replaceAll('\\n', '')}',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(height: 1.35),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  CachedImage(
                                    url: FetchUrl.unitIconUrl(item.unitId),
                                    width: 56,
                                    height: 56,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.unitName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                              ),
                                        ),
                                        const SizedBox(height: 5),
                                        _CharacterTagWrap(item: item),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CharacterTagWrap extends StatelessWidget {
  final UniqueEquipListItem item;

  const _CharacterTagWrap({required this.item});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final role = UnitRoleType.fromValue(item.roleId);
    final limit = UnitGetType.fromValue(item.limitType) ?? UnitGetType.normal;
    final position = SearchAreaWidthType.getType(item.searchAreaWidth);
    final attributeName = item.talentId > 0
        ? Talent.fromValue(item.talentId).getName(t)
        : AtkType.fromValue(item.atkType).getName(t);
    final attributeColor = item.talentId > 0
        ? Color(Talent.fromValue(item.talentId).color)
        : Color(AtkType.fromValue(item.atkType).color);
    return Wrap(
      spacing: 5,
      runSpacing: 5,
      children: [
        if (role != null)
          _MiniTag(text: role.getName(t), color: Color(role.color)),
        _MiniTag(text: limit.getName(t), color: Color(limit.color)),
        _MiniTag(
          text: '${position.getName(t)} ${item.searchAreaWidth}',
          color: Color(position.color),
        ),
        _MiniTag(text: attributeName, color: attributeColor),
      ],
    );
  }
}

class _MiniTag extends StatelessWidget {
  final String text;
  final Color color;

  const _MiniTag({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _UniqueEquipDetailSheet extends StatefulWidget {
  final AppDb db;
  final UniqueEquipListItem item;
  final VoidCallback onOpenCharacter;

  const _UniqueEquipDetailSheet({
    required this.db,
    required this.item,
    required this.onOpenCharacter,
  });

  @override
  State<_UniqueEquipDetailSheet> createState() =>
      _UniqueEquipDetailSheetState();
}

class _UniqueEquipDetailSheetState extends State<_UniqueEquipDetailSheet> {
  late final Future<({int level, UniqueEquipInfo? info})> _details;

  @override
  void initState() {
    super.initState();
    _details = _loadDetails();
  }

  Future<({int level, UniqueEquipInfo? info})> _loadDetails() async {
    final level = await widget.db.getMaxUniqueEquipLv(widget.item.equipSlot);
    final info = await widget.db.getUniqueEquipInfo(
      widget.item.unitId,
      slot: widget.item.equipSlot,
      lv: level,
    );
    return (level: level, info: info);
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          24,
          4,
          24,
          24 + MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: FutureBuilder<({int level, UniqueEquipInfo? info})>(
          future: _details,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const SizedBox(
                height: 280,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final info = snapshot.data?.info;
            final stats = info == null ? <(String, double)>[] : _stats(t, info);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedImage(
                      url: FetchUrl.equipmentIconUrl(widget.item.equipmentId),
                      width: 96,
                      height: 96,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.item.equipmentName,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.item.unitName,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            t.unique_equip_max_level(snapshot.data?.level ?? 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  widget.item.description.isEmpty
                      ? t.no_description
                      : widget.item.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 22),
                Text(
                  t.attribute_bonus,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                if (stats.isEmpty)
                  Text(t.no_data_error)
                else
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final stat in stats)
                        Chip(label: Text('${stat.$1} +${_format(stat.$2)}')),
                    ],
                  ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: widget.onOpenCharacter,
                    icon: const Icon(Icons.person_search_rounded),
                    label: Text(t.view_character),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<(String, double)> _stats(AppLocalizations t, UniqueEquipInfo info) {
    final values = <(String, double)>[
      (t.attr_hp, info.hp),
      (t.attr_atk, info.atk),
      (t.attr_magic_str, info.magicStr),
      (t.attr_def, info.def_),
      (t.attr_magic_def, info.magicDef),
      (t.attr_physical_critical, info.physicalCritical),
      (t.attr_magic_critical, info.magicCritical),
      (t.attr_physical_penetrate, info.physicalPenetrate),
      (t.attr_magic_penetrate, info.magicPenetrate),
      (t.attr_life_steal, info.lifeSteal),
      (t.attr_accuracy, info.accuracy),
      (t.attr_dodge, info.dodge),
      (t.attr_wave_hp_recovery, info.waveHpRecovery),
      (t.attr_hp_recovery_rate, info.hpRecoveryRate),
      (t.attr_wave_energy_recovery, info.waveEnergyRecovery),
      (t.attr_energy_recovery_rate, info.energyRecoveryRate),
      (t.attr_energy_reduce_rate, info.energyReduceRate),
    ];
    return values.where((value) => value.$2 != 0).toList(growable: false);
  }

  String _format(double value) {
    return value == value.roundToDouble()
        ? value.toInt().toString()
        : value.toStringAsFixed(1);
  }
}

class _EmptyState extends StatelessWidget {
  final String message;

  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 56,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 12),
          Text(message),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _ErrorState({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline_rounded, size: 52),
            const SizedBox(height: 12),
            Text(error.toString(), textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton.tonalIcon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('重试'),
            ),
          ],
        ),
      ),
    );
  }
}
