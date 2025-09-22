import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/component/back_icon.dart';
import 'package:misora_note/features/component/unit_card.dart';
import 'package:misora_note/l10n/app_localizations.dart';

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
            Text(
              widget.searchQuery.isEmpty ? '输入角色名称开始搜索' : '暂无搜索结果',
              style: TextStyle(
                color: Color(CustomColors.colorGray),
                fontSize: 16,
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

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
        scrollbars: false,
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverGrid(
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
        ],
      ),
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
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<int> results = []; // 统一的结果列表，包含默认和搜索结果
  List<int>? defaultResult;
  String _searchQuery = '';
  bool isSearching = false; // 是否正在搜索

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
    setState(() {
      _searchQuery = query.trim();
      if (_searchQuery.isEmpty) {
        // 清空搜索时，恢复默认结果
        isSearching = false;
        _loadDefaultResults();
      } else {
        // 开始搜索
        isSearching = true;
        _performSearch(_searchQuery);
      }
    });
  }

  void _loadDefaultResults() async {
    setState(() {
      results = defaultResult ?? [];
      isSearching = false;
    });
  }

  Future<void> _performSearch(String query) async {
    try {
      // final db = ref.read(dbProvider);
      // TODO: 实现真正的搜索逻辑
      // 这里先模拟搜索过程
      await Future.delayed(Duration(milliseconds: 500));

      if (mounted && _searchQuery == query) {
        // 确保搜索结果对应当前查询
        // TODO: 替换为真正的搜索逻辑
        // final searchResults = await db.searchUnits(query);
        setState(() {
          results = []; // 暂时返回空结果，你需要实现真正的搜索
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
    _onSearchChanged('');
    _searchFocusNode.requestFocus();
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
                BackIcon(
                  backgroundSize: 40,
                  paddingValue: 0,
                  backgroundColor: HSLColor.fromColor(
                    Color(CustomColors.colorPink),
                  ).withLightness(0.95).toColor(),
                ),
                const SizedBox(width: 12),
                // 搜索框
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    onChanged: _onSearchChanged,
                    decoration: InputDecoration(
                      hintText: t.search_hit,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(CustomColors.colorPrimary),
                      ),
                      suffixIcon: _searchQuery.isNotEmpty
                          ? IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: Color(CustomColors.colorGray),
                              ),
                              onPressed: _clearSearch,
                            )
                          : null,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(CustomColors.colorGray).withAlpha(100),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color(CustomColors.colorPrimary),
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      // TODO: 执行搜索
                    },
                  ),
                ),
              ],
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
