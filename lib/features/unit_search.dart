import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/component/custom_icon.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/card/unit_card.dart';
import 'package:misora_note/l10n/app_localizations.dart';

import 'package:misora_note/features/component/drop_drown.dart';

class SearchFilters extends StatelessWidget {
  final UnitSearchData searchData;
  final ValueChanged<UnitSearchData> onSearchDataChanged;

  const SearchFilters({
    super.key,
    required this.searchData,
    required this.onSearchDataChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    final textStyle = textTheme.bodyMedium;
    return Row(
      children: [
        // 天赋过滤器
        Expanded(
          child: DropdownWithRadio<Talent>(
            label: t.talent,
            value: searchData.talent,
            selectedValue: searchData.talent,
            items: [
              (null, t.talent),
              ...Talent.values.map((type) => (type, type.getName(t))),
            ],
            itemStyleBuilder: (type) => type != null
                ? textStyle?.copyWith(color: Color(type.color))
                : textStyle,
            onChanged: (value) {
              if (searchData.talent != value) {
                searchData.talent = value;
                onSearchDataChanged(searchData);
              }
            },
          ),
        ),
        SizedBox(width: 8),
        // 位置过滤器
        Expanded(
          child: DropdownWithRadio<SearchAreaWidthType>(
            label: t.position,
            value: searchData.searchAreaWidth,
            selectedValue: searchData.searchAreaWidth,
            items: [
              (null, t.position),
              ...SearchAreaWidthType.values.map(
                (type) => (type, type.getName(t)),
              ),
            ],
            itemStyleBuilder: (type) => type != null
                ? textStyle?.copyWith(color: Color(type.color))
                : textStyle,
            onChanged: (value) {
              if (searchData.searchAreaWidth != value) {
                searchData.searchAreaWidth = value;
                onSearchDataChanged(searchData);
              }
            },
          ),
        ),
        SizedBox(width: 8),
        // 攻击类型过滤器
        Expanded(
          child: DropdownWithRadio<AtkType>(
            label: t.attack_type,
            value: searchData.atkType,
            selectedValue: searchData.atkType,
            items: [
              (null, t.attack_type),
              ...AtkType.values.map((type) => (type, type.getName(t))),
            ],
            itemStyleBuilder: (type) => type != null
                ? textStyle?.copyWith(color: Color(type.color))
                : textStyle,
            onChanged: (value) {
              if (searchData.atkType != value) {
                searchData.atkType = value;
                onSearchDataChanged(searchData);
              }
            },
          ),
        ),
        SizedBox(width: 8),
        // 专武过滤器
        Expanded(
          child: DropdownWithRadio<(bool?, bool?)>(
            label: t.tool_unique_equip,
            value: (searchData.hasUnique1, searchData.hasUnique2),
            selectedValue: (searchData.hasUnique1, searchData.hasUnique2),
            items: [
              ((null, null), t.tool_unique_equip),
              ((true, null), '${t.tool_unique_equip}1'),
              ((true, true), '${t.tool_unique_equip}2'),
            ],
            itemStyleBuilder: (_) => textStyle,
            onChanged: (value) {
              if (searchData.hasUnique1 != value?.$1 ||
                  searchData.hasUnique2 != value?.$2) {
                searchData.hasUnique1 = value?.$1;
                searchData.hasUnique2 = value?.$2;
                onSearchDataChanged(searchData);
              }
            },
          ),
        ),
      ],
    );
  }
}

class ShowResult extends StatefulWidget {
  final List<int> unitIds;
  final Map<int, bool> r6Units;
  final bool isSearching;
  final String searchQuery;

  const ShowResult({
    super.key,
    required this.unitIds,
    required this.r6Units,
    this.isSearching = false,
    this.searchQuery = '',
  });

  @override
  State<ShowResult> createState() => _ShowResult();
}

class _ShowResult extends State<ShowResult> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final texttheme = Theme.of(context).textTheme;
    // 如果正在搜索，显示加载状态
    if (widget.isSearching) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Color(CustomColors.colorPrimary)),
            const SizedBox(height: 16),
            Text(
              '${t.searching}: "${widget.searchQuery}"',
              style: texttheme.bodyLarge?.copyWith(
                color: Color(CustomColors.colorGray).withAlpha(150),
              ),
            ),
          ],
        ),
      );
    }

    // 如果没有结果，显示相应提示
    if (widget.unitIds.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 64,
              color: Color(CustomColors.colorGray).withAlpha(100),
            ),
            const SizedBox(height: 16),
            Text(
              t.no_search_result,
              style: texttheme.bodyLarge?.copyWith(
                color: Color(CustomColors.colorGray).withAlpha(150),
              ),
            ),
          ],
        ),
      );
    }

    final mediaWidth = MediaQuery.of(context).size.width;
    const padding = 16.0;
    // 计算每行显示多少列
    int crossAxisCount;
    double cardWidth;

    if (mediaWidth > 1200) {
      crossAxisCount = 3;
      cardWidth = (mediaWidth - padding * 4) / 3; // 减去padding
    } else if (mediaWidth > 800) {
      crossAxisCount = 2;
      cardWidth = (mediaWidth - padding * 3) / 2;
    } else {
      crossAxisCount = 1;
      cardWidth = mediaWidth - padding * 2;
    }

    return CustomScrollView(
      cacheExtent: MediaQuery.of(context).size.height,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(padding),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 1408 / 792,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final unitId = widget.unitIds[index];
              return Hero(
                tag: "unit_card_$unitId",
                child: UnitCard(
                  unitId: unitId,
                  isR6: widget.r6Units[unitId] ?? false,
                  size: (cardWidth, cardWidth * 792 / 1408),
                ),
              );
            }, childCount: widget.unitIds.length),
          ),
        ),
      ],
    );
  }
}

class UnitSearch extends ConsumerStatefulWidget {
  final List<int> perUnitIds;
  const UnitSearch({super.key, required this.perUnitIds});

  @override
  ConsumerState<UnitSearch> createState() => _UnitSearchState();
}

class _UnitSearchState extends ConsumerState<UnitSearch> {
  final SearchController searchController = SearchController();
  final FocusNode searchFocusNode = FocusNode();
  List<int> results = []; // 统一的结果列表，包含默认和搜索结果
  List<int>? defaultResult;
  String searchQuery = '';
  bool isSearching = false; // 是否正在搜索
  bool isSearchById = false; // 是否按ID搜索
  bool isAscending = false; // 是否正序排列
  UnitRankType rankType = UnitRankType.lastUpdate; // 排序方式
  UnitSearchData searchData = UnitSearchData();

  @override
  void initState() {
    results = widget.perUnitIds;
    super.initState();
    final db = ref.read(dbProvider);
    db.getUnitsData(type: rankType, isDesc: !isAscending).then((units) {
      if (mounted) {
        setState(() {
          results = units.map((e) => e.unitId).toList();
          defaultResult = results.toList(growable: false);
        });
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void onSearchChanged(String query) {
    searchQuery = query.trim();
    setState(() {
      if (isSearchById) {
        // 按ID搜索
        searchData.unitId = searchQuery.isEmpty
            ? null
            : int.tryParse(searchQuery);
        searchData.unitName = null;
      } else {
        // 按角色名搜索
        searchData.unitName = searchQuery.isEmpty ? null : searchQuery;
        searchData.unitId = null;
      }
    });
    performSearchWithFilters();
  }

  void toggleSearchMode() {
    setState(() {
      isSearchById = !isSearchById;
      searchController.clear();
      searchQuery = '';
      searchData.unitId = null;
      searchData.unitName = null;
    });
    loadDefaultResults();
    searchFocusNode.requestFocus();
  }

  void loadDefaultResults() async {
    if (mounted) {
      setState(() {
        results = defaultResult ?? [];
        isSearching = false;
      });
    }
  }

  void toggleSortOrder() {
    setState(() {
      isAscending = !isAscending;
    });
    if (searchQuery.isEmpty && !hasActiveFilters()) {
      loadDefaultResults();
    } else {
      performSearchWithFilters();
    }
  }

  void changeRankType(UnitRankType? newRankType) {
    if (newRankType != null && newRankType != rankType) {
      setState(() {
        rankType = newRankType;
      });
      if (searchQuery.isEmpty && !hasActiveFilters()) {
        loadDefaultResults();
      } else {
        performSearchWithFilters();
      }
    }
  }

  void clearSearch() {
    searchController.clear();
    setState(() {
      searchQuery = '';
      searchData.clear();
    });
    loadDefaultResults();
    searchFocusNode.requestFocus();
  }

  void performSearchWithFilters() {
    if (searchQuery.isEmpty && searchData.isEmpty()) {
      loadDefaultResults();
    } else {
      setState(() {
        isSearching = true;
      });
      final db = ref.read(dbProvider);
      db
          .getUnitsData(
            type: rankType,
            searchData: searchData,
            isDesc: !isAscending,
          )
          .then((units) {
            if (mounted) {
              setState(() {
                results = units.map((e) => e.unitId).toList();
                isSearching = false;
              });
            }
          })
          .catchError((e) {
            if (mounted) {
              setState(() {
                results = [];
                isSearching = false;
              });
            }
          });
    }
  }

  bool hasActiveFilters() {
    return searchData.searchAreaWidth != null ||
        searchData.atkType != null ||
        searchData.isR6 != null ||
        searchData.hasUnique1 != null ||
        searchData.hasUnique2 != null ||
        searchData.talent != null;
  }

  void clearFilters() {
    setState(() {
      searchData.searchAreaWidth = null;
      searchData.atkType = null;
      searchData.isR6 = null;
      searchData.hasUnique1 = null;
      searchData.hasUnique2 = null;
      searchData.talent = null;
    });
    performSearchWithFilters();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final db = ref.watch(dbProvider);
    final r6Units = <int, bool>{};
    for (var id in db.r6Units) {
      r6Units[id] = true;
    }
    final texttheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        children: [
          // 自定义顶部栏：返回键 + 搜索框
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 8,
              left: 16,
              right: 16,
              bottom: 8,
            ),
            color: Colors.white,
            child: Row(
              children: [
                // 返回按钮
                CustomIconButton(
                  backgroundSize: 40,
                  paddingValue: 0,
                  backgroundColor: HSLColor.fromColor(
                    Color(CustomColors.colorPink),
                  ).withLightness(0.95).toColor(),
                ),
                const SizedBox(width: 12),

                // 搜索框
                Expanded(
                  child: SearchBar(
                    controller: searchController,
                    hintText: isSearchById
                        ? t.search_hit_id
                        : t.search_hit_name,
                    onChanged: onSearchChanged,
                    textInputAction: TextInputAction.search,
                    keyboardType: isSearchById
                        ? TextInputType.number
                        : TextInputType.text,
                    leading: Icon(
                      Icons.search,
                      color: Color(CustomColors.colorPrimary),
                    ),
                    trailing: searchQuery.isNotEmpty || hasActiveFilters()
                        ? [
                            if (hasActiveFilters())
                              IconButton(
                                icon: Icon(
                                  Icons.filter_list_off,
                                  color: Color(CustomColors.colorOrange),
                                  size: 20,
                                ),
                                onPressed: clearFilters,
                              ),
                            if (searchQuery.isNotEmpty)
                              IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: Color(CustomColors.colorGray),
                                ),
                                onPressed: clearSearch,
                              ),
                          ]
                        : <Widget>[],
                    backgroundColor: WidgetStateProperty.all(
                      Colors.grey.shade50,
                    ),
                    shadowColor: WidgetStateProperty.all(Colors.transparent),
                    surfaceTintColor: WidgetStateProperty.all(
                      Colors.transparent,
                    ),
                    side: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.focused)) {
                        return BorderSide(
                          color: Color(CustomColors.colorPrimary),
                          width: 2,
                        );
                      }
                      return BorderSide(
                        color: Color(CustomColors.colorGray).withAlpha(100),
                      );
                    }),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                CustomIconButton(
                  backgroundColor: Colors.transparent,
                  onTap: toggleSearchMode,
                  child: Icon(
                    isSearchById ? Icons.tag : Icons.person,
                    color: Color(CustomColors.colorPrimary),
                    size: 25,
                  ),
                ),
                const SizedBox(width: 4),
                PopupMenuButton<UnitRankType>(
                  onSelected: changeRankType,
                  position: PopupMenuPosition.under,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Colors.white,
                  constraints: BoxConstraints(
                    minWidth: 120,
                    maxWidth: 150,
                    maxHeight: 300,
                  ),
                  itemBuilder: (BuildContext context) {
                    return UnitRankType.values.map((UnitRankType type) {
                      final isSelected = type == rankType;
                      return PopupMenuItem<UnitRankType>(
                        value: type,
                        child: Row(
                          children: [
                            Icon(
                              isSelected
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_unchecked,
                              size: 16,
                              color: isSelected
                                  ? Color(CustomColors.colorPrimary)
                                  : Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                type.getName(t),
                                style: texttheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.sort,
                      color: Color(CustomColors.colorPrimary),
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                CustomIconButton(
                  backgroundColor: Colors.transparent,
                  onTap: toggleSortOrder,
                  child: Icon(
                    isAscending ? Icons.arrow_upward : Icons.arrow_downward,
                    color: Color(CustomColors.colorPrimary),
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
          // 搜索过滤器
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: SearchFilters(
              searchData: searchData,
              onSearchDataChanged: (newSearchData) {
                setState(() {
                  searchData = newSearchData;
                });
                performSearchWithFilters();
              },
            ),
          ),
          // 搜索结果区域
          Expanded(
            child: ShowResult(
              unitIds: results,
              r6Units: r6Units,
              isSearching: isSearching,
              searchQuery: searchQuery,
            ),
          ),
        ],
      ),
    );
  }
}
