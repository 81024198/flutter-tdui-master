import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../icon/index.dart';
import '../utils.dart';

// 间距
final double _spacing = 8.0;
// 背景色
final Color _color = Color(0xff303133);

// 方向
enum TdTipPlacement { top, right, bottom, left }

class TdTip extends StatefulWidget {
  // 位置
  final TdTipPlacement placement;
  // 元素
  final Widget child;
  // 提示内容
  final Widget content;

  TdTip(
      {this.placement = TdTipPlacement.top,
      required this.child,
      required this.content});

  @override
  TdTipState createState() => TdTipState();
}

class TdTipState extends State<TdTip> {
  GlobalKey _boxKey = GlobalKey();
  late Function remove;

  void show() {
    remove = createOverlayEntry(
        context: context,
        child: _TdTipWidget(
            maskClick: close,
            boxContext: _boxKey.currentContext,
            placement: widget.placement,
            child: widget.content),
        willPopCallback: close);
  }

  void close() {
    remove();
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Column(mainAxisSize: MainAxisSize.min, children: [
        GestureDetector(key: _boxKey, onTap: show, child: widget.child)
      ])
    ]);
  }
}

class _TdTipWidget extends StatelessWidget {
  final Function maskClick;
  final Widget child;
  final boxContext;
  final TdTipPlacement placement;
  late Offset offset;
  late double top;
  late double left;
  late Offset triangleOffset;
  late double triangleTop;
  late double triangleLeft;
  late double angle;

  _TdTipWidget(
      {required this.maskClick,
      required this.child,
      this.boxContext,
      required this.placement}) {
    final Size size = boxContext.size;
    final RenderBox box = boxContext.findRenderObject();
    final Offset boxOffset = box.localToGlobal(Offset.zero);

    // 判断方向
    switch (placement) {
      // top
      case TdTipPlacement.top:
        top = boxOffset.dy - _spacing;
        left = boxOffset.dx + (size.width / 2);
        offset = Offset(-0.5, -1);
        // 三角形
        triangleOffset = offset;
        triangleTop = boxOffset.dy + 2;
        triangleLeft = left;
        angle = math.pi;
        break;
      // right
      case TdTipPlacement.right:
        top = boxOffset.dy + (size.height / 2);
        left = boxOffset.dx + size.width + _spacing;
        offset = Offset(0, -0.5);
        // 三角形
        triangleOffset = offset;
        triangleTop = top;
        triangleLeft = boxOffset.dx + size.width - 2;
        angle = (math.pi / 2) * 3;
        break;
      // bottom
      case TdTipPlacement.bottom:
        top = boxOffset.dy + size.height + _spacing;
        left = boxOffset.dx + (size.width / 2);
        offset = Offset(-0.5, 0);
        // 三角形
        triangleOffset = offset;
        triangleTop = boxOffset.dy + size.height - 2;
        triangleLeft = left;
        angle = 0;
        break;
      // left
      case TdTipPlacement.left:
        top = boxOffset.dy + (size.height / 2);
        left = boxOffset.dx - _spacing;
        offset = Offset(-1, -0.5);
        // 三角形
        triangleOffset = offset;
        triangleTop = top;
        triangleLeft = boxOffset.dx + 2;
        angle = math.pi / 2;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(children: [
      GestureDetector(
          onPanDown: (_) {
            maskClick();
          },
          child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.transparent),
              child: SizedBox(width: size.width, height: size.height))),
      Positioned(
          top: top,
          left: left,
          child: FractionalTranslation(
              translation: offset,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: _color,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: DefaultTextStyle(
                      style: TextStyle(color: Colors.white, fontSize: 13.0),
                      child: Padding(
                          padding: EdgeInsets.all(10), child: child))))),
      Positioned(
          top: triangleTop,
          left: triangleLeft,
          child: FractionalTranslation(
              translation: triangleOffset,
              child: Transform.rotate(
                  angle: angle,
                  child: Icon(TdIcons.triangle, color: _color, size: 14))))
    ]);
  }
}
