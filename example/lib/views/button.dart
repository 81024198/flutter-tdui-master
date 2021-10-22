import 'package:flutter/material.dart';
import 'package:tdui/tdui.dart';
import '../layout/sample.dart';

final Widget box = Container(height: 10, child: null);

final Widget rowBox = Container(width: 10, child: null);

// 标题
class Title extends StatelessWidget {
  final String title;

  Title(this.title);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 8),
            child: Text(title, style: TextStyle(fontSize: 16))));
  }
}

class ButtonPage extends StatefulWidget {
  @override
  ButtonPageState createState() => ButtonPageState();
}

class ButtonPageState extends State {
  // loading
  bool loading = true;
  bool disabled = true;

  toggleLoading() {
    setState(() {
      loading = !loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sample('Button',
        describe: '按钮',
        child: Container(
            child: Column(children: <Widget>[
          // 按钮
          Title('按钮'),
          TdButton('default'),
          box,
          TdButton('primary', theme: TdButtonType.primary),
          box,
          TdButton('warn', theme: TdButtonType.warn),
          box,
          Title('disabled 状态'),
          // 禁用状态
          TdButton('default 禁用状态', disabled: disabled),
          box,
          TdButton('warn 禁用状态', theme: TdButtonType.warn, disabled: disabled),
          box,
          TdButton('primary 禁用状态',
              theme: TdButtonType.primary, disabled: disabled),
          box,
          TdButton('primary',
              theme: TdButtonType.primary, hollow: true, disabled: disabled),
          box,

          Title('loading 状态'),
          TdButton('loading', loading: loading),
          box,
          TdButton(
            'loading',
            theme: TdButtonType.primary,
            loading: loading,
          ),
          box,
          TdButton('loading', theme: TdButtonType.warn, loading: loading),
          box,
          // box,
          Title('hollow'),
          // hollow
          TdButton('default', hollow: true),
          box,
          TdButton('primary', theme: TdButtonType.primary, hollow: true),
          box,
          TdButton('warn', theme: TdButtonType.warn, hollow: true),
          box,
          // mini
          Title('mini'),
          Row(children: <Widget>[
            TdButton('default', size: TdButtonSize.mini),
            rowBox,
            TdButton('primary',
                theme: TdButtonType.primary, size: TdButtonSize.mini),
            rowBox,
            TdButton('warn', theme: TdButtonType.warn, size: TdButtonSize.mini)
          ]),
          box,
          Title('mini loading'),
          Row(children: <Widget>[
            TdButton('default', size: TdButtonSize.mini, loading: true),
            rowBox,
            TdButton('primary',
                theme: TdButtonType.primary,
                size: TdButtonSize.mini,
                loading: true),
            rowBox,
            TdButton('warn',
                theme: TdButtonType.warn,
                size: TdButtonSize.mini,
                loading: true)
          ])
        ])));
  }
}
