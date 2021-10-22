/**
 * @author [allan]
 * @email [1440806569@mail.com]
 * @create date 2019-05-15 11:31:57
 * @modify date 2019-05-15 11:31:57
 * @desc [TdSpin]
 */

import 'package:flutter/material.dart';
import '../animation/rotating.dart';

class TdSpin extends StatelessWidget {
  // 显示状态
  final bool isShow;
  // 提示文字
  final Widget? tip;
  // 内容
  final Widget? child;

  TdSpin({
    this.isShow = true,
    this.tip,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      Rotating(Image.asset('assets/images/loading.png',
          height: 30.0, package: 'tdui')),
    ];

    // 判断是否添加tip
    if (tip != null) {
      children.add(
        Padding(
          padding: EdgeInsets.only(top: 6.0),
          child: Center(
            child: DefaultTextStyle(
              style: TextStyle(fontSize: 14, color: Colors.black),
              child: tip == null ? Container() : tip!,
            ),
          ),
        ),
      );
    }

    return isShow
        ? Container(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          )
        : (child == null ? Container() : child!);
  }
}
