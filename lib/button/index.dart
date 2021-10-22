import 'package:flutter/material.dart';
import '../animation/rotating.dart';
import '../theme/index.dart';
import '../icon/index.dart';

// 颜色类型
enum TdButtonType { acquiescent, primary, warn }

// size
enum TdButtonSize { acquiescent, mini }

// 大小配置
final List<Map<String, double>> _sizeConfig = [
  {'fontSize': 18.0, 'height': 45.0, 'iconSize': 16.0, 'borderSize': 0.5},
  {'fontSize': 13.0, 'height': 30.0, 'iconSize': 14.0, 'borderSize': 0.4}
];

class TdButton extends StatefulWidget {
  // 内容
  final dynamic child;
  // 禁用
  final bool disabled;
  // 点击回调
  final Function? onClick;
  // loading
  final bool loading;
  // 空心
  final bool hollow;
  // 按钮大小类型
  final TdButtonSize sizeType;
  // 按钮大小
  final Map<String, double> size;
  // 主题
  final TdButtonType theme;

  TdButton(
    this.child, {
    TdButtonSize size = TdButtonSize.acquiescent,
    this.onClick,
    this.hollow = false,
    this.theme = TdButtonType.acquiescent,
    this.disabled = false,
    this.loading = false,
  })  : this.size = _sizeConfig[size.index],
        this.sizeType = size;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<TdButton> {
  // 主题
  late List<Map<String, Color>> themeConfig;
  // 按钮主题
  late Map<String, Color> theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final TdTheme theme = TdUi.getTheme(context);
    // 按钮主题
    themeConfig = [
      // 默认
      {
        'backgroundColor': theme.defaultBackgroundColor,
        'fontColor': Colors.black,
        'disabledBackgroundColor': Color(0xfff7f7f7),
        'borderColor': theme.defaultBorderColor,
        'hollowColor': Color(0xff353535)
      },
      // primary
      {
        'backgroundColor': theme.primaryColor,
        'fontColor': Colors.white,
        'disabledBackgroundColor': theme.primaryColorDisabled,
        'borderColor': theme.primaryColor,
        'hollowColor': theme.primaryColor
      },
      // warn
      {
        'backgroundColor': theme.warnColor,
        'fontColor': Colors.white,
        'disabledBackgroundColor': theme.warnColorDisabled,
        'borderColor': theme.warnColor,
        'hollowColor': theme.warnColor
      }
    ];

    final themeConf = themeConfig[widget.theme.index];
    // 判断是否空心
    if (widget.hollow) {
      this.theme = {
        'backgroundColor': Colors.transparent,
        'fontColor': themeConf['hollowColor']!,
        'disabledBackgroundColor': Colors.white,
        'borderColor': themeConf['hollowColor']!
      };
    } else {
      this.theme = themeConf;
    }
  }

  // 按钮点击
  onClick() {
    if (widget.onClick is Function) {
      widget.onClick!();
    }
  }

  // 渲染按钮内容
  Widget renderChild(content) {
    // size
    final size = widget.size;
    // 是否禁用状态
    final bool disabled = widget.loading || widget.disabled;
    Widget child;
    if (content is String) {
      child = Text(content);
    } else {
      child = content;
    }

    // 内容
    List<Widget> children = [
      DefaultTextStyle(
          style:
              TextStyle(fontSize: size['fontSize'], color: theme['fontColor']),
          child: child)
    ];

    if (widget.loading) {
      final Widget icon = Padding(
          padding: EdgeInsets.only(right: 5),
          child: Rotating(Icon(TdIcons.loading,
              color: theme['fontColor'], size: size['iconSize'])));
      children.insert(0, icon);
    }

    return Opacity(
        opacity: disabled ? 0.7 : 1,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: widget.sizeType == TdButtonSize.mini
                ? MainAxisSize.min
                : MainAxisSize.max,
            children: children));
  }

  @override
  Widget build(BuildContext context) {
    // size
    final size = widget.size;
    // 是否禁用状态
    final bool disabled = widget.loading || widget.disabled;
    // 圆角
    final BorderRadius borderRadius = BorderRadius.all(Radius.circular(4));
    // 按钮
    final Widget button = Container(
        height: size['height'],
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            color: disabled ? theme['disabledBackgroundColor'] : null,
            borderRadius: borderRadius,
            // 空心或者默认按钮才添加边框
            border: widget.hollow || widget.theme == TdButtonType.acquiescent
                ? Border.all(
                    width: size['borderSize']!, color: theme['borderColor']!)
                : null),
        child: renderChild(widget.child));

    // 禁用状态
    if (disabled) {
      return button;
    }

    return Material(
        borderRadius: borderRadius,
        color: theme['backgroundColor'],
        child:
            InkWell(onTap: onClick, borderRadius: borderRadius, child: button));
  }
}
