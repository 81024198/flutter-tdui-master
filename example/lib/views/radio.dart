import 'package:flutter/material.dart';
import 'package:tdui/tdui.dart';
import '../layout/sample.dart';
import '../components/title.dart';

class RadioPage extends StatefulWidget {
  @override
  RadioPageState createState() => RadioPageState();
}

final Widget child = Row(
  children: [
    Padding(
      padding: EdgeInsets.only(right: 15),
      child: TdRadio(
        value: '1',
        child: Text('选项一'),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(right: 15),
      child: TdRadio(
        value: '2',
        child: Text('选项二'),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(right: 15),
      child: TdRadio(
        value: '3',
        child: Text('选项三'),
      ),
    ),
  ],
);

class RadioPageState extends State {
  String? value;

  @override
  Widget build(BuildContext context) {
    return Sample('Radio',
        describe: '单选',
        child: Container(
            child: Column(children: <Widget>[
          TextTitle('默认', noPadding: true),
          TdRadioGroup(
            child: child,
          ),
          TextTitle('设置默认值', noPadding: true),
          TdRadioGroup(
            defaultValue: '1',
            child: child,
          ),
          TextTitle('onChange', noPadding: true),
          TdRadioGroup(
            child: child,
            onChange: (value) {
              TdToast.info(context)(value.toString());
            },
          ),
          TextTitle('受控组件', noPadding: true),
          TdRadioGroup(
            value: value == null ? "" : value!,
            onChange: (data) {
              this.setState(() {
                value = data as String;
              });
            },
            child: child,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: TdButton('设置第二个选中', onClick: () {
              this.setState(() {
                value = '2';
              });
            }),
          ),
          TextTitle('禁用', noPadding: true),
          TdRadioGroup(
              defaultValue: '2',
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: TdRadio(
                      value: '1',
                      disabled: true,
                      child: Text('选项一'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: TdRadio(
                      value: '2',
                      disabled: true,
                      child: Text('选项二'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: TdRadio(
                      value: '3',
                      child: Text('选项三'),
                    ),
                  ),
                ],
              )),
        ])));
  }
}
