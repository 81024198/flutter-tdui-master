import 'package:flutter/material.dart';
import 'package:tdui/tdui.dart';
import '../layout/sample.dart';
import '../components/title.dart';

class CheckboxPage extends StatefulWidget {
  @override
  CheckboxPageState createState() => CheckboxPageState();
}

final Widget child = Row(
  children: [
    Padding(
      padding: EdgeInsets.only(right: 15),
      child: TdCheckbox(
        value: '1',
        child: Text('选项一'),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(right: 15),
      child: TdCheckbox(
        value: '2',
        child: Text('选项二'),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(right: 15),
      child: TdCheckbox(
        value: '3',
        child: Text('选项三'),
      ),
    ),
  ],
);

class CheckboxPageState extends State {
  List<Object?> value = [];

  @override
  Widget build(BuildContext context) {
    return Sample('Checkbox',
        describe: '多选',
        child: Container(
            child: Column(children: <Widget>[
          TextTitle('默认', noPadding: true),
          TdCheckboxGroup(
            child: child,
          ),
          TextTitle('设置默认值', noPadding: true),
          TdCheckboxGroup(
            defaultValue: ['1'],
            child: child,
          ),
          TextTitle('onChange', noPadding: true),
          TdCheckboxGroup(
            child: child,
            onChange: (value) {
              TdToast.info(context)(value.toString());
            },
          ),
          TextTitle('受控组件', noPadding: true),
          TdCheckboxGroup(
            value: value,
            onChange: (data) {
              this.setState(() {
                value = data;
              });
            },
            child: child,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: TdButton('设置第二个选中', onClick: () {
              this.setState(() {
                value = ['2'];
              });
            }),
          ),
          TextTitle('禁用', noPadding: true),
          TdCheckboxGroup(
              defaultValue: ['2'],
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: TdCheckbox(
                      value: '1',
                      disabled: true,
                      child: Text('选项一'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: TdCheckbox(
                      value: '2',
                      disabled: true,
                      child: Text('选项二'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: TdCheckbox(
                      value: '3',
                      child: Text('选项三'),
                    ),
                  ),
                ],
              )),
          TextTitle('选中数限制 - 最多选择两个', noPadding: true),
          TdCheckboxGroup(
            max: 2,
            child: child,
          ),
        ])));
  }
}
