import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';

class FilterDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<DropdownMenuItem<T?>> items;
  final ValueChanged<T?> onChanged;

  const FilterDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(CustomColors.colorGray).withAlpha(100)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T?>(
          value: value,
          hint: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Color(CustomColors.colorGray),
            ),
          ),
          items: items,
          onChanged: onChanged,
          isExpanded: true,
          iconSize: 20,
          style: TextStyle(
            color: Color(CustomColors.colorBlack),
            fontSize: 14,
          ),
          dropdownColor: Colors.white,
          menuMaxHeight: 200,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
      ),
    );
  }
}

class ShowResult extends StatefulWidget {
  final Widget? result;
  final bool isSearching;
  final String searchQuery;
  final String searchTip;
  const ShowResult({
    super.key,
    required this.result,
    this.isSearching = false,
    this.searchQuery = '',
    this.searchTip = '输入角色名称开始搜索',
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
    if (widget.result == null) {
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
            Text(widget.searchQuery.isEmpty ? widget.searchTip : '暂无搜索结果',
                style: texttheme.bodyLarge?.copyWith(
                  color: Color(CustomColors.colorGray).withAlpha(150),
                ))
          ],
        ),
      );
    } else {
      return widget.result!;
    }
  }
}
