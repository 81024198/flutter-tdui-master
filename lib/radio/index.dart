import 'package:flutter/material.dart';
import '../theme/index.dart';
import '../icon/index.dart';

class TdRadioGroup<T> extends StatefulWidget {
  // 默认值
  final T? defaultValue;
  // 当前值
  final T? value;
  // 点击时触发
  final void Function(T data)? onChange;
  // 内容
  final Widget? child;

  TdRadioGroup(
      {this.defaultValue, this.value, this.onChange, @required this.child});

  @override
  TdRadioGroupState createState() => TdRadioGroupState<T>();
}

class TdRadioGroupState<T> extends State<TdRadioGroup> {
  late T value;

  @override
  void initState() {
    super.initState();
    // 非受控组件才能使用defaultValue，受控组件直接使用value控制
    value = widget.value == null ? widget.defaultValue : widget.value;
  }

  @override
  void didUpdateWidget(TdRadioGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      this.setState(() {
        value = widget.value;
      });
    }
  }

  void onChange(T id) {
    this.setState(() {
      value = id;
    });

    // 调用onChange
    if (widget.onChange is Function) {
      if (widget.onChange != null) {
        widget.onChange!(value);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RadioGroupScope(
      radioGroup: this,
      child: widget.child,
    );
  }
}

class TdRadio<T> extends StatefulWidget {
  // 禁用状态
  final bool disabled;
  // 选中的value
  final T value;
  // 内容
  final Widget child;

  TdRadio({
    this.disabled = false,
    required this.value,
    required this.child,
  });

  @override
  TdRadioState createState() => TdRadioState();
}

class TdRadioState extends State<TdRadio> {
  bool isChecked = false;
  final double _iconBoxSize = 18;

  void toggleChecked() {
    final RadioGroupScope? group = RadioGroupScope.of(context);
    group!.radioGroup.onChange(widget.value);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final RadioGroupScope? group = RadioGroupScope.of(context);
    isChecked = group!.radioGroup.value == widget.value;
  }

  Map<String, Color> _getColor() {
    final TdTheme theme = TdUi.getTheme(context);

    if (widget.disabled) {
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
            borderRadius: BorderRadius.all(Radius.circular(_iconBoxSize / 2)),
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

class RadioGroupScope extends InheritedWidget {
  final TdRadioGroupState radioGroup;

  RadioGroupScope({
    Key? key,
    child,
    required this.radioGroup,
  }) : super(key: key, child: child);

  static RadioGroupScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: RadioGroupScope);
  }

  @override
  bool updateShouldNotify(RadioGroupScope oldWidget) {
    return true;
  }
}
