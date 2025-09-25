import 'package:flutter/material.dart';
import 'package:misora_note/constants.dart';

class LeadingDot extends StatelessWidget {
  final bool visible;
  final Color? color;
  final double size;
  final EdgeInsets margin;

  const LeadingDot({
    super.key,
    this.visible = true,
    this.color,
    this.size = 8,
    this.margin = const EdgeInsets.only(right: 6),
  });

  @override
  Widget build(BuildContext context) {
    final dotColor = color ?? Color(CustomColors.colorPrimary);
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 120),
      opacity: visible ? 1 : 0,
      child: Container(
        width: size,
        height: size,
        margin: margin,
        decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
      ),
    );
  }
}

/// 开头对齐的下拉菜单（带单选圆点）
class FilterDropdownWithRadio<T> extends StatefulWidget {
  final String label;
  final T? value;
  final T? selectedValue;
  final List<(T?, String)> items;
  final ValueChanged<T?> onChanged;
  final TextStyle? Function(T?)? itemStyleBuilder;

  /// 收起时左侧小圆点
  final bool showLeadingDot;
  final Color? leadingDotColor;

  /// 菜单最大高度
  final double menuMaxHeight;

  /// 菜单宽度；为 0 表示与触发器同宽
  final double menuWidth;

  /// 菜单圆角
  final double borderRadius;

  /// 每项内边距
  final EdgeInsets itemPadding;

  /// 竖直方向位移（正数向下）
  final double verticalOffset;

  final Widget? triggerChild;

  const FilterDropdownWithRadio({
    super.key,
    required this.label,
    required this.value,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    this.itemStyleBuilder,
    this.showLeadingDot = true,
    this.leadingDotColor,
    this.menuMaxHeight = 280,
    this.menuWidth = 0, // 0 表示跟触发器同宽
    this.borderRadius = 12,
    this.itemPadding = const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    this.verticalOffset = 8,
    this.triggerChild,
  });

  @override
  State<FilterDropdownWithRadio<T>> createState() =>
      _FilterDropdownWithRadioState<T>();
}

class _FilterDropdownWithRadioState<T>
    extends State<FilterDropdownWithRadio<T>> {
  final _triggerKey = GlobalKey();
  double _triggerW = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyleDefault = theme.textTheme.bodyMedium;

    // 实时测量触发器宽度
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final box = _triggerKey.currentContext?.findRenderObject() as RenderBox?;
      if (box != null) {
        final w = box.size.width;
        if (w != _triggerW) setState(() => _triggerW = w);
      }
    });

    String displayText() {
      final map = {for (final it in widget.items) it.$1: it.$2};
      return map[widget.value] ?? widget.label;
    }

    // 触发器外观
    final trigger = Container(
      key: _triggerKey,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF000000).withAlpha(60)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: widget.triggerChild ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                displayText(),
                style: textStyleDefault?.copyWith(
                  color: Color(CustomColors.colorBlack),
                ),
              ),
              const SizedBox(width: 6),
              Icon(Icons.keyboard_arrow_down,
                  size: 18, color: Color(CustomColors.colorBlack)),
            ],
          ),
    );

    // 计算菜单宽度与水平偏移（把右对齐改为左对齐）
    final menuW = (widget.menuWidth > 0 ? widget.menuWidth : _triggerW);
    // 如果 triggerW 还没测到（初次构建），暂时不做水平偏移，避免闪跳
    final dx = (_triggerW == 0) ? 0.0 : -(menuW - _triggerW);

    return PopupMenuButton<T?>(
      tooltip: '',
      position: PopupMenuPosition.under,
      offset: Offset(dx, widget.verticalOffset), // 关键：左对齐
      elevation: 10,
      color: Colors.white,
      surfaceTintColor: Colors.white, // 避免材质上色
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      constraints: BoxConstraints(
        minWidth: menuW,
        maxWidth: menuW,
        maxHeight: widget.menuMaxHeight,
      ),
      itemBuilder: (context) {
        return widget.items.map((item) {
          final isChecked = widget.selectedValue == item.$1;
          final style =
              widget.itemStyleBuilder?.call(item.$1) ?? textStyleDefault;

          return PopupMenuItem<T?>(
            value: item.$1,
            padding: EdgeInsets.zero,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
                widget.onChanged(item.$1);
              },
              child: Padding(
                padding: widget.itemPadding,
                child: Row(
                  children: [
                    Icon(
                      isChecked
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      size: 16,
                      color: isChecked
                          ? Color(CustomColors.colorPrimary)
                          : Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(item.$2, style: style)),
                  ],
                ),
              ),
            ),
          );
        }).toList();
      },
      child: trigger,
    );
  }
}
