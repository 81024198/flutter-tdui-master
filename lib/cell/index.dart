import 'package:flutter/material.dart';
import '../theme/index.dart';

// 间距
const double labelSpacing = 20.0;

class TdCells extends StatelessWidget {
  final bool boxBorder;
  final double spacing;
  final List<Widget>? children;

  TdCells({
    this.boxBorder = true,
    this.spacing = labelSpacing,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    // 边框
    final Color borderColor = TdUi.getTheme(context).defaultBorderColor;
    final Divider _border = Divider(height: 1, color: borderColor);
    final List<Widget> newChildren = [];

    if (children != null) {
      children!.forEach((item) {
        if (item != children![0]) {
          newChildren.add(
              Padding(padding: EdgeInsets.only(left: spacing), child: _border));
        }
        newChildren.add(item);
      });
    }

    // 判断是否添加容器边框
    if (boxBorder) {
      newChildren.add(_border);
      newChildren.insert(0, _border);
    }

    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: _TdCellsScope(
          tdCells: this,
          child: Column(children: newChildren),
        ));
  }
}

class TdCell extends StatelessWidget {
  // label
  final Widget label;
  // 内容
  final Widget content;
  // footer
  final Widget? footer;
  // 对齐方式
  final Alignment align;
  // 间距
  final double spacing;
  // 最小高度
  final double minHeight;
  // 点击
  final Function? onClick;

  TdCell(
      {label,
      content,
      this.footer,
      this.align = Alignment.centerRight,
      this.spacing = labelSpacing,
      this.minHeight = 46.0,
      this.onClick})
      : this.label = label == null
            ? Container()
            : (label is String ? Text(label) : label),
        this.content = content == null
            ? Text("")
            : (content is String ? Text(content) : content);

  // 点击
  void onTap() {
    if (onClick != null) onClick!();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    final _TdCellsScope? tdCellsScope = _TdCellsScope.of(context);
    final double _spacing =
        tdCellsScope == null ? spacing : tdCellsScope.tdCells.spacing;

    // label
    if (label is Widget) {
      children = [label];

      if (content is Widget) {
        children.add(
            Expanded(flex: 1, child: Align(alignment: align, child: content)));
      }
    } else {
      children = [Expanded(flex: 1, child: content)];
    }

    // footer
    if (footer != null) {
      children.add(Padding(padding: EdgeInsets.only(left: 5), child: footer));
    }

    final child = Container(
        constraints: BoxConstraints(minHeight: minHeight),
        child: DefaultTextStyle(
            style: TextStyle(fontSize: 16.0, color: Colors.black),
            child: Padding(
                padding: EdgeInsets.only(left: _spacing, right: _spacing),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children))));

    if (onClick == null) {
      return child;
    }

    return Material(
        color: Colors.white, child: InkWell(onTap: onTap, child: child));
  }
}

class _TdCellsScope extends InheritedWidget {
  final TdCells tdCells;

  _TdCellsScope({
    Key? key,
    child,
    required this.tdCells,
  }) : super(key: key, child: child);

  static _TdCellsScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: _TdCellsScope);
  }

  @override
  bool updateShouldNotify(_TdCellsScope oldWidget) {
    return true;
  }
}
