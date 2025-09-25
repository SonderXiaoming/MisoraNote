import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/db/model.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/component/custom_icon.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/unit_card.dart';
import 'package:misora_note/l10n/app_localizations.dart';
import 'package:misora_note/features/component/search.dart';

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

    return Row(
      children: [
        // 位置过滤器
        Expanded(
          child: FilterDropdown<SearchAreaWidthType>(
            label: '位置',
            value: searchData.searchAreaWidth,
            items: [
              DropdownMenuItem<SearchAreaWidthType?>(
                value: null,
                child: Text('全部', style: TextStyle(fontSize: 14)),
              ),
              ...SearchAreaWidthType.values.map((type) => DropdownMenuItem(
                    value: type,
                    child: Row(
                      children: [
                        SearchAreaWidthType.getIcon(type, 16, 16),
                        SizedBox(width: 4),
                        Text(SearchAreaWidthType.getName(t, type),
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  )),
            ],
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
          child: FilterDropdown<AtkType>(
            label: '攻击',
            value: searchData.atkType,
            items: [
              DropdownMenuItem<AtkType?>(
                value: null,
                child: Text('全部', style: TextStyle(fontSize: 14)),
              ),
              ...AtkType.values.map((type) => DropdownMenuItem(
                    value: type,
                    child: Row(
                      children: [
                        AtkType.getIcon(type, 16, 16),
                        SizedBox(width: 4),
                        Text(AtkType.getName(t, type),
                            style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  )),
            ],
            onChanged: (value) {
              if (searchData.atkType != value) {
                searchData.atkType = value;
                onSearchDataChanged(searchData);
              }
            },
          ),
        ),
        SizedBox(width: 8),
        // 6星过滤器
        Expanded(
          child: FilterDropdown<bool>(
            label: '6星',
            value: searchData.isR6,
            items: [
              DropdownMenuItem<bool?>(
                value: null,
                child: Text('全部', style: TextStyle(fontSize: 14)),
              ),
              DropdownMenuItem(
                value: true,
                child: Text('6星', style: TextStyle(fontSize: 14)),
              ),
              DropdownMenuItem(
                value: false,
                child: Text('非6星', style: TextStyle(fontSize: 14)),
              ),
            ],
            onChanged: (value) {
              if (searchData.isR6 != value) {
                searchData.isR6 = value;
                onSearchDataChanged(searchData);
              }
            },
          ),
        ),
        SizedBox(width: 8),
        // 专武过滤器
        Expanded(
          child: FilterDropdown<(bool?, bool?)>(
            label: '专武',
            value: (searchData.hasUnique1, searchData.hasUnique2),
            items: [
              DropdownMenuItem<(bool?, bool?)>(
                value: (null, null),
                child: Text('全部', style: TextStyle(fontSize: 14)),
              ),
              DropdownMenuItem(
                value: (true, null),
                child: Text('专武1', style: TextStyle(fontSize: 14)),
              ),
              DropdownMenuItem(
                value: (true, true),
                child: Text('专武2', style: TextStyle(fontSize: 14)),
              ),
            ],
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
    final texttheme = Theme.of(context).textTheme;
    // 如果正在搜索，显示加载状态
    if (widget.isSearching) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Color(CustomColors.colorPrimary),
            ),
            const SizedBox(height: 16),
            Text(
              '搜索中: "${widget.searchQuery}"',
              style: TextStyle(
                color: Color(CustomColors.colorGray),
                fontSize: 16,
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
            Text(widget.searchQuery.isEmpty ? '输入角色名称开始搜索' : '暂无搜索结果',
                style: texttheme.bodyLarge?.copyWith(
                  color: Color(CustomColors.colorGray).withAlpha(150),
                ))
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
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final unitId = widget.unitIds[index];
                return Hero(
                  tag: "unit_card_$unitId",
                  child: UnitCard(
                    unitId: unitId,
                    isR6: widget.r6Units[unitId] ?? false,
                    size: (cardWidth, cardWidth * 792 / 1408),
                  ),
                );
              },
              childCount: widget.unitIds.length,
            ),
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
  final SearchController _searchController = SearchController();
  final FocusNode _searchFocusNode = FocusNode();
  List<int> results = []; // 统一的结果列表，包含默认和搜索结果
  List<int>? defaultResult;
  String _searchQuery = '';
  bool isSearching = false; // 是否正在搜索
  bool _isSearchById = false; // 是否按ID搜索
  UnitSearchData _searchData = UnitSearchData();

  @override
  void initState() {
    results = widget.perUnitIds;
    super.initState();
    final db = ref.read(dbProvider);
    db.getUnitsData(type: UnitRankType.lastUpdate).then((units) {
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
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _searchQuery = query.trim();
    setState(() {
      if (_isSearchById) {
        // 按ID搜索
        _searchData.unitId =
            _searchQuery.isEmpty ? null : int.tryParse(_searchQuery);
        _searchData.unitName = null;
      } else {
        // 按角色名搜索
        _searchData.unitName = _searchQuery.isEmpty ? null : _searchQuery;
        _searchData.unitId = null;
      }
    });
    _performSearchWithFilters();
  }

  void _toggleSearchMode() {
    setState(() {
      _isSearchById = !_isSearchById;
      _searchController.clear();
      _searchQuery = '';
      _searchData.unitId = null;
      _searchData.unitName = null;
    });
    _loadDefaultResults();
    _searchFocusNode.requestFocus();
  }

  void _loadDefaultResults() async {
    setState(() {
      results = defaultResult ?? [];
      isSearching = false;
    });
  }

  Future<void> _performSearch(String query) async {
    try {
      final db = ref.read(dbProvider);
      final searchResults = await db.getUnitsData(
        type: UnitRankType.lastUpdate,
        searchData: _searchData,
      );
      if (mounted) {
        setState(() {
          results = searchResults.map((e) => e.unitId).toList();
          isSearching = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          results = [];
          isSearching = false;
        });
      }
    }
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _searchQuery = '';
      _searchData.unitName = null;
      _searchData.unitId = null;
      _searchData.searchAreaWidth = null;
      _searchData.atkType = null;
      _searchData.isR6 = null;
      _searchData.hasUnique1 = null;
      _searchData.hasUnique2 = null;
    });
    _loadDefaultResults();
    _searchFocusNode.requestFocus();
  }

  void _performSearchWithFilters() {
    if (_searchQuery.isEmpty &&
        _searchData.searchAreaWidth == null &&
        _searchData.atkType == null &&
        _searchData.isR6 == null &&
        _searchData.hasUnique1 == null &&
        _searchData.unitId == null) {
      _loadDefaultResults();
    } else {
      setState(() {
        isSearching = true;
      });
      _performSearch(_searchQuery);
    }
  }

  bool _hasActiveFilters() {
    return _searchData.searchAreaWidth != null ||
        _searchData.atkType != null ||
        _searchData.isR6 != null ||
        _searchData.hasUnique1 != null;
  }

  void _clearFilters() {
    setState(() {
      _searchData.searchAreaWidth = null;
      _searchData.atkType = null;
      _searchData.isR6 = null;
      _searchData.hasUnique1 = null;
      _searchData.hasUnique2 = null;
    });
    _performSearchWithFilters();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final db = ref.watch(dbProvider);
    final r6Units = <int, bool>{};
    for (var id in db.r6Units) {
      r6Units[id] = true;
    }
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
                    controller: _searchController,
                    hintText: _isSearchById ? '输入角色ID' : t.search_hit,
                    onChanged: _onSearchChanged,
                    textInputAction: TextInputAction.search,
                    keyboardType: _isSearchById
                        ? TextInputType.number
                        : TextInputType.text,
                    leading: Icon(
                      Icons.search,
                      color: Color(CustomColors.colorPrimary),
                    ),
                    trailing: _searchQuery.isNotEmpty || _hasActiveFilters()
                        ? [
                            if (_hasActiveFilters())
                              IconButton(
                                icon: Icon(
                                  Icons.filter_list_off,
                                  color: Color(CustomColors.colorOrange),
                                  size: 20,
                                ),
                                onPressed: _clearFilters,
                                tooltip: '清除过滤器',
                              ),
                            if (_searchQuery.isNotEmpty)
                              IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: Color(CustomColors.colorGray),
                                ),
                                onPressed: _clearSearch,
                              ),
                          ]
                        : <Widget>[],
                    backgroundColor:
                        WidgetStateProperty.all(Colors.grey.shade50),
                    shadowColor: WidgetStateProperty.all(Colors.transparent),
                    surfaceTintColor:
                        WidgetStateProperty.all(Colors.transparent),
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
                  onTap: _toggleSearchMode,
                  child: Icon(
                    _isSearchById ? Icons.tag : Icons.person,
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
              searchData: _searchData,
              onSearchDataChanged: (newSearchData) {
                setState(() {
                  _searchData = newSearchData;
                });
                _performSearchWithFilters();
              },
            ),
          ),
          // 搜索结果区域
          Expanded(
            child: ShowResult(
              unitIds: results,
              r6Units: r6Units,
              isSearching: isSearching,
              searchQuery: _searchQuery,
            ),
          ),
        ],
      ),
    );
  }
}
