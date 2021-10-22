import 'package:flutter/material.dart';
import '../layout/sample.dart';
import 'package:tdui/tdui.dart';

class NotifyPage extends StatefulWidget {
  @override
  NotifyPageState createState() => NotifyPageState();
}

class NotifyPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Sample('TdNotify',
        describe: '通知',
        child: Column(children: [
          TdButton('success', theme: TdButtonType.primary, onClick: () {
            TdNotify.success(context)(child: Text('我是内容, 可随意布局'));
          }),
          SizedBox(height: 20.0),
          TdButton('error', theme: TdButtonType.primary, onClick: () {
            TdNotify.error(context)(child: Text('我是内容, 可随意布局'));
          }),
          SizedBox(height: 20.0),
          TdButton('自定义', theme: TdButtonType.primary, onClick: () {
            TdNotify.show(context)(
                color: Colors.black,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(TdIcons.info, color: Colors.white)),
                  Text('我是内容, 可自定义背景色和内容')
                ]));
          })
        ]));
  }
}
