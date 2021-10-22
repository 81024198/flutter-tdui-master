import 'package:flutter/material.dart';
import '../layout/sample.dart';
import 'package:tdui/tdui.dart';
import '../components/title.dart';

class ChecklistPage extends StatefulWidget {
  @override
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State {
  List<String> value = [];
  final List<TdChecklistItem> options = [
    TdChecklistItem(label: '选项一', value: '1'),
    TdChecklistItem(label: '选项二', value: '2'),
    TdChecklistItem(label: '选项三', value: '3')
  ];
  final List<TdChecklistItem> options2 = [
    TdChecklistItem(label: '选项一 - 禁用', value: '1', disabled: true),
    TdChecklistItem(label: '选项二 - 选中禁用', value: '2', disabled: true),
    TdChecklistItem(label: '选项三', value: '3'),
    TdChecklistItem(label: '选项四', value: '4')
  ];

  @override
  Widget build(BuildContext context) {
    return Sample(
      'Checklist',
      showPadding: false,
      describe: '多选列表',
      child: TdForm(
        children: <Widget>[
          TextTitle('复选列表项'),
          TdChecklist(children: options),
          // 又对齐
          TextTitle('右对齐'),
          TdChecklist(align: 'right', children: options),
          // 受控组件
          TextTitle('受控组件'),
          TdChecklist(
              children: options,
              value: value,
              onChange: (checkedValue) {
                print(checkedValue);
                setState(() {
                  value = checkedValue;
                });
              }),
          Padding(
              padding: EdgeInsets.all(10),
              child: TdButton(value.indexOf('2') >= 0 ? '移除第二个' : '选中第二个',
                  theme: TdButtonType.primary, onClick: () {
                setState(() {
                  if (value.indexOf('2') >= 0) {
                    value.remove('2');
                  } else {
                    value.add('2');
                  }
                });
              })),
          // 又对齐
          TextTitle('最多选择二个'),
          TdChecklist(max: 2, children: options),
          // 禁用
          TextTitle('禁用'),
          TdChecklist(defaultValue: ['2'], children: options2)
        ],
      ),
    );
  }
}
