import 'package:flutter/material.dart';
import 'package:tdui/tdui.dart';
import '../layout/sample.dart';
import '../components/title.dart';

class SwitchPage extends StatefulWidget {
  @override
  SwitchPageState createState() => SwitchPageState();
}

class SwitchPageState extends State {
  bool open = true;

  @override
  Widget build(BuildContext context) {
    return Sample('Switch',
        describe: '滑动开关',
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextTitle('默认', noPadding: true),
          TdSwitch(),
          TextTitle('自定义size', noPadding: true),
          TdSwitch(size: 20.0),
          TextTitle('自定义颜色', noPadding: true),
          TdSwitch(
            color: Colors.red,
          ),
          TextTitle('禁用', noPadding: true),
          TdSwitch(
            disabled: true,
            checked: true,
          ),
          TextTitle('onChange', noPadding: true),
          TdSwitch(onChange: (bool value) {
            TdToast.info(context)(value ? 'open' : 'close');
          }),
          TextTitle('外部控制 - 受控', noPadding: true),
          TdSwitch(
              checked: open,
              onChange: (value) {
                setState(() {
                  open = value;
                });
              }),
          SizedBox(height: 10.0),
          TdButton(open ? '关闭' : '打开', theme: TdButtonType.primary,
              onClick: () {
            setState(() {
              open = !open;
            });
          }),
          // TdButton('qrcode', theme: TdButtonType.primary, onClick: scan)
        ]));
  }
}
