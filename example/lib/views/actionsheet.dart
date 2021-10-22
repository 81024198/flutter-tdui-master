import 'package:example/layout/sample.dart';
import 'package:flutter/material.dart';
import 'package:tdui/tdui.dart';

// final list = [
//   Text('选项一'),
//   Text('选项二'),
//   Text('选项三')
// ];

final options = [
  TdActionsheetItem(label: '选项一', value: '1'),
  TdActionsheetItem(label: '选项二', value: '2'),
  TdActionsheetItem(label: '选项三', value: '3')
];

class ActionsheetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TdActionsheetAndroid actionsheetAndroid =
        TdActionsheet.android(context);
    final TdActionsheetIos actionsheetIos = TdActionsheet.ios(context);

    return Sample('Actionsheet',
        describe: '弹出式菜单',
        child: Column(children: <Widget>[
          TdButton('android', theme: TdButtonType.primary, onClick: () {
            actionsheetAndroid(
                options: options,
                onChange: (String value) {
                  TdToast.info(context)('选择了$value');
                },
                onClose: () {
                  TdToast.info(context)('关闭');
                });
          }),
          Container(height: 20.0),
          TdButton('ios', theme: TdButtonType.primary, onClick: () {
            actionsheetIos(
                title: '请选择',
                options: options,
                cancelButton: '取消',
                onChange: (String value) {
                  TdToast.info(context)('选择了$value');
                },
                onClose: () {
                  TdToast.info(context)('关闭');
                });
          }),
          Container(height: 20.0),
          TdButton('ios 无取消按钮', theme: TdButtonType.primary, onClick: () {
            actionsheetIos(
                title: '请选择',
                options: options,
                onChange: (String value) {
                  TdToast.info(context)('选择了$value');
                },
                onClose: () {
                  TdToast.info(context)('关闭');
                });
          }),
          Container(height: 20.0),
          TdButton('android 禁止遮罩层点击', theme: TdButtonType.primary, onClick: () {
            actionsheetAndroid(
                options: options,
                maskClosable: false,
                onChange: (String value) {
                  TdToast.info(context)('选择了$value');
                },
                onClose: () {
                  TdToast.info(context)('关闭');
                });
          }),
          Container(height: 20.0),
          TdButton('ios 禁止遮罩层点击', theme: TdButtonType.primary, onClick: () {
            actionsheetIos(
                title: '请选择',
                options: options,
                maskClosable: false,
                cancelButton: '取消',
                onChange: (String value) {
                  TdToast.info(context)('选择了$value');
                },
                onClose: () {
                  TdToast.info(context)('关闭');
                });
          }),
        ]));
  }
}
