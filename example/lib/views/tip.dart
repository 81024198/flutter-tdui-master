import 'package:flutter/material.dart';
import '../layout/sample.dart';
import 'package:tdui/tdui.dart';

class TipPage extends StatefulWidget {
  @override
  SwipePageState createState() => SwipePageState();
}

class SwipePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Sample('TdTip',
        describe: '提示气泡框',
        child: Column(children: <Widget>[
          SizedBox(
              height: 50,
              child: TdTip(
                  content: Text('这是一个 tip'),
                  child: TdBadge(
                    child: 'top',
                  ))),
          SizedBox(
              height: 50,
              child: TdTip(
                  placement: TdTipPlacement.right,
                  content: Text('这是一个tip'),
                  child: TdBadge(
                    child: 'right',
                  ))),
          SizedBox(
              // height: 50,
              child: TdTip(
                  placement: TdTipPlacement.bottom,
                  content: Text('这是一个 tip'),
                  child: TdBadge(
                    child: 'bottom',
                  ))),
          SizedBox(
              height: 50,
              child: TdTip(
                  placement: TdTipPlacement.left,
                  content: Text('这是一个 tip'),
                  child: TdBadge(
                    child: 'left',
                  )))
        ]));
  }
}
