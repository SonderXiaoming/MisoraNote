import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misora_note/constants.dart';
import 'package:misora_note/core/di/di.dart';
import 'package:misora_note/features/component/custom_icon.dart';
import 'package:misora_note/features/component/base.dart';
import 'package:misora_note/features/component/card/unit_card.dart';
import 'package:misora_note/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class EnemySearch extends ConsumerStatefulWidget {
  final EnemyType searchType;
  const EnemySearch({super.key, this.searchType = EnemyType.all});

  @override
  ConsumerState<EnemySearch> createState() => _EnemySearchState();
}

class _EnemySearchState extends ConsumerState<EnemySearch> {
  final SearchController searchController = SearchController();
  final FocusNode searchFocusNode = FocusNode();
  late EnemyType searchType;

  Map<EnemyType, int> results = {}; // 统一的结果列表，包含默认和搜索结果
  Map<EnemyType, int>? defaultResult;
  String searchQuery = '';
  bool isSearching = false; // 是否正在搜索
  bool isSearchById = false; // 是否按ID搜索
  bool isAscending = false; // 是否正序排列

  @override
  void initState() {
    super.initState();
    searchType = widget.searchType;
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchSumbit(String query) {
    searchQuery = query.trim();
    setState(() {});
    performSearch(searchQuery);
  }

  void toggleSearchMode() {
    setState(() {
      isSearchById = !isSearchById;
      searchController.clear();
      searchQuery = '';
    });
    loadDefaultResults();
    searchFocusNode.requestFocus();
  }

  void loadDefaultResults() async {
    return;
  }

  void toggleSortOrder() {
    setState(() {
      isAscending = !isAscending;
    });
    if (searchQuery.isEmpty) {
      loadDefaultResults();
    } else {
      performSearch(searchQuery);
    }
  }

  bool hasActiveFilters() {
    return false;
  }

  void performSearchWithFilters() {
    return;
  }

  void changeEnemyType(EnemyType? newType) {
    if (newType != null && newType != searchType) {
      setState(() {
        searchType = newType;
      });
      if (searchQuery.isEmpty && !hasActiveFilters()) {
        loadDefaultResults();
      } else {
        performSearchWithFilters();
      }
    }
  }

  Future<void> performSearch(String query) async {
    try {
      final enemyId = int.tryParse(query) ?? -1;
      final width = MediaQuery.of(context).size.width;
      context.push(
        AppRoutes.unitDetail,
        extra: UnitCard(
          unitId: enemyId,
          unitType: UnitType.enemy,
          size: (width, 200),
        ),
      );

      setState(() {
        isSearching = false;
      });
    } catch (e) {
      print('搜索失败: $e');
    }
  }

  void _clearSearch() {
    searchController.clear();
    setState(() {
      searchQuery = '';
    });
    loadDefaultResults();
    searchFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final db = ref.watch(dbProvider);
    final r6Units = <int, bool>{};
    for (var id in db.r6Units) {
      r6Units[id] = true;
    }
    final textTheme = Theme.of(context).textTheme;
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
                    onChanged: null,
                    onSubmitted: _onSearchSumbit,
                    textInputAction: TextInputAction.search,
                    keyboardType: isSearchById
                        ? TextInputType.number
                        : TextInputType.text,
                    leading: Icon(
                      Icons.search,
                      color: Color(CustomColors.colorPrimary),
                    ),
                    trailing: searchQuery.isNotEmpty
                        ? [
                            if (searchQuery.isNotEmpty)
                              IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  color: Color(CustomColors.colorGray),
                                ),
                                onPressed: _clearSearch,
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

                PopupMenuButton<EnemyType>(
                  onSelected: changeEnemyType,
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
                    return EnemyType.values.map((EnemyType type) {
                      final isSelected = type == searchType;
                      return PopupMenuItem<EnemyType>(
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
                                style: textTheme.bodyMedium,
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

          // 搜索结果区域
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
