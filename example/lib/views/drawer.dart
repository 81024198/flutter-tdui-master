import 'package:flutter/material.dart';
import '../layout/sample.dart';
import 'package:tdui/tdui.dart';

class DrawerPage extends StatefulWidget {
  @override
  DrawerPageState createState() => DrawerPageState();
}

class DrawerPageState extends State {
  void show(TdDrawerPlacement placement) {
    tdDrawer(context)(
        placement: placement,
        child: Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.all(40.0), child: Text('我是内容, 可以随意自定义'))));
  }

  @override
  Widget build(BuildContext context) {
    return Sample('Drawer',
        describe: '抽屉',
        child: Column(children: [
          TdButton('top', theme: TdButtonType.primary, onClick: () {
            show(TdDrawerPlacement.top);
          }),
          SizedBox(height: 20.0),
          TdButton('right', theme: TdButtonType.primary, onClick: () {
            show(TdDrawerPlacement.right);
          }),
          SizedBox(height: 20.0),
          TdButton('bottom', theme: TdButtonType.primary, onClick: () {
            show(TdDrawerPlacement.bottom);
          }),
          SizedBox(height: 20.0),
          TdButton('left', theme: TdButtonType.primary, onClick: () {
            show(TdDrawerPlacement.left);
          }),
          SizedBox(height: 20.0),
          TdButton('无遮罩', theme: TdButtonType.primary, onClick: () {
            late Function close;
            close = tdDrawer(context)(
                mask: false,
                placement: TdDrawerPlacement.right,
                child: SizedBox(
                    width: 300.0,
                    child: Align(
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: TdButton('关闭', theme: TdButtonType.primary,
                                onClick: () {
                              close();
                            })))));
          })
        ]));
  }
}
