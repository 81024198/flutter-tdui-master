import 'package:flutter/material.dart';
import '../theme/index.dart';
import '../icon/index.dart';

class TdCheckboxGroup<T> extends StatefulWidget {
  // 最大选中数限制
  final int? max;
  // 默认值
  final List<T>? defaultValue;
  // 当前值
  final List<T>? value;
  // 点击时触发
  final void Function(List<T>)? onChange;
  // 内容
  final Widget child;

  TdCheckboxGroup(
      {this.max,
      this.defaultValue,
      this.value,
      this.onChange,
      required this.child});

  @override
  TdCheckboxGroupState createState() => TdCheckboxGroupState<T>();
}

class TdCheckboxGroupState<T> extends State<TdCheckboxGroup> {
  List<T> value = [];

  @override
  void initState() {
    super.initState();
    // 非受控组件才能使用defaultValue，受控组件直接使用value控制
    final List<T> defaultValue =
        widget.defaultValue == null ? [] : widget.defaultValue as List<T>;
    value = widget.value == null ? defaultValue : widget.value as List<T>;
  }

  @override
  void didUpdateWidget(TdCheckboxGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      this.setState(() {
        value = widget.value as List<T>;
      });
    }
  }

  void onChange(T id) {
    // 拷贝
    final List<T> newValue = [];
    newValue.addAll(value);

    // 判断是否已经存在
    if (newValue.indexOf(id) >= 0) {
      newValue.remove(id);
    } else {
      newValue.add(id);
    }

    // 判断是否受控
    if (widget.value == null) {
      this.setState(() {
        value = newValue;
      });
    }

    if (widget.onChange is Function) widget.onChange!(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxGroupScope(
      checkboxGroup: this,
      child: widget.child,
    );
  }
}

class TdCheckbox<T> extends StatefulWidget {
  // 禁用状态
  final bool disabled;
  // 选中的value
  final T value;
  // 内容
  final Widget child;

  TdCheckbox({
    this.disabled = false,
    required this.value,
    required this.child,
  });

  @override
  TdCheckboxState createState() => TdCheckboxState();
}

class TdCheckboxState extends State<TdCheckbox> {
  bool isChecked = false;
  final double _iconBoxSize = 18;

  void toggleChecked() {
    final checkboxGroup = CheckboxGroupScope.of(context)!.checkboxGroup;
    final int? max = checkboxGroup!.widget.max;
    if (max != null && checkboxGroup.value.length >= max && !isChecked) {
      return;
    }

    final CheckboxGroupScope group = CheckboxGroupScope.of(context)!;
    group.checkboxGroup!.onChange(widget.value);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final CheckboxGroupScope group = CheckboxGroupScope.of(context)!;
    isChecked = group.checkboxGroup!.value.indexOf(widget.value) >= 0;
  }

  Map<String, Color> _getColor() {
    final TdTheme theme = TdUi.getTheme(context);
    final group = CheckboxGroupScope.of(context)!.checkboxGroup;
    final int? max = group!.widget.max;
    // 判断是否到达最大限制
    final bool isMax =
        max == null ? false : group.value.length >= max && !isChecked;

    if (widget.disabled || isMax) {
      return {'borderColor': Color(0xffd8d8d8), 'bgColor': Color(0xfff8f8f8)};
    } else if (isChecked) {
      return {'borderColor': theme.primaryColor, 'bgColor': theme.primaryColor};
    } else {
      return {'borderColor': theme.defaultBorderColor, 'bgColor': Colors.white};
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> colors = _getColor();

    final Widget child = Row(mainAxisSize: MainAxisSize.min, children: [
      Stack(children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: colors['bgColor'],
            border: Border.all(width: 1, color: colors['borderColor']!),
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
          child: SizedBox(width: _iconBoxSize, height: _iconBoxSize),
        ),
        Positioned(
            top: 1.4,
            right: 0,
            left: 0,
            child: Align(
                alignment: Alignment.topCenter,
                child: Transform.scale(
                    scale: isChecked ? 1 : 0,
                    child: Icon(TdIcons.hook,
                        size: 14,
                        color: widget.disabled
                            ? Color(0xffd8d8d8)
                            : Colors.white))))
      ]),
      DefaultTextStyle(
          style: TextStyle(fontSize: 16, color: Colors.black),
          child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Padding(
                  padding: EdgeInsets.only(left: 6), child: widget.child)))
    ]);

    // 判断是否禁用
    if (widget.disabled) {
      return child;
    }

    return GestureDetector(onTap: toggleChecked, child: child);
  }
}

class CheckboxGroupScope extends InheritedWidget {
  final TdCheckboxGroupState? checkboxGroup;

  CheckboxGroupScope({
    Key? key,
    child,
    this.checkboxGroup,
  }) : super(key: key, child: child);

  static CheckboxGroupScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(
        aspect: CheckboxGroupScope);
  }

  @override
  bool updateShouldNotify(CheckboxGroupScope oldWidget) {
    return true;
  }
}
