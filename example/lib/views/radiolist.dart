import 'package:flutter/material.dart';
import '../layout/sample.dart';
import 'package:tdui/tdui.dart';
import '../components/title.dart';

class RadioListPage extends StatefulWidget {
  @override
  _RadioListState createState() => _RadioListState();
}

class _RadioListState extends State<RadioListPage> {
  String? value;
  final List<TdRadiolistItem> options = [
    TdRadiolistItem(label: '选项一', value: '1'),
    TdRadiolistItem(label: '选项二', value: '2'),
    TdRadiolistItem(label: '选项三', value: '3')
  ];
  final List<TdRadiolistItem> options2 = [
    TdRadiolistItem(label: '选项一', value: '1'),
    TdRadiolistItem(label: '选项二 - 默认选中', value: '2'),
    TdRadiolistItem(label: '选项三', value: '3')
  ];
  final List<TdRadiolistItem> options3 = [
    TdRadiolistItem(label: '选项一 禁用', value: '1', disabled: true),
    TdRadiolistItem(label: '选项二 - 默认选中', value: '2', disabled: true),
    TdRadiolistItem(label: '选项二 - 默认选中禁用', value: '3')
  ];

  @override
  Widget build(BuildContext context) {
    return Sample(
      'Radiolist',
      showPadding: false,
      describe: '单选列表',
      child: TdForm(
        children: <Widget>[
          TextTitle('单选列表'),
          TdRadiolist(children: options),
          TextTitle('默认选中'),
          TdRadiolist(children: options2, defaultValue: '2'),
          TextTitle('受控组件'),
          TdRadiolist(
            children: options,
            value: value == null ? "" : value!,
            onChange: (checkedValue) {
              setState(() {
                value = checkedValue;
              });
            },
          ),
          Padding(
              padding: EdgeInsets.all(8),
              child:
                  TdButton('选中第二个', theme: TdButtonType.primary, onClick: () {
                setState(() {
                  value = '2';
                });
              })),
          TextTitle('禁用'),
          TdRadiolist(children: options3, defaultValue: '2')
        ],
      ),
    );
  }
}
