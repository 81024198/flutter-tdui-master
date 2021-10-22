import 'package:flutter/material.dart';
import '../layout/sample.dart';
import 'package:tdui/tdui.dart';
import '../components/title.dart';

class DialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sample('Dialog',
        describe: '对话框',
        child: Column(children: <Widget>[
          TextTitle('ios 主题', noPadding: true),
          TdButton('alert', theme: TdButtonType.primary, onClick: () {
            TdDialog.alert(context)('弹窗内容', onConfirm: () {
              TdToast.info(context)('点击了确认');
            });
          }),
          SizedBox(height: 20.0),
          TdButton('alert - 无标题', theme: TdButtonType.primary, onClick: () {
            TdDialog.alert(context)('弹窗内容', title: null, onConfirm: () {
              TdToast.info(context)('点击了确认');
            });
          }),
          SizedBox(height: 20.0),
          TdButton('confirm', theme: TdButtonType.primary, onClick: () {
            TdDialog.confirm(context)('弹窗内容，告知当前状态、信息和解决方法，描述文字尽量控制在三行内',
                onCancel: () {
              TdToast.info(context)('点击了取消');
            }, onConfirm: () {
              TdToast.info(context)('点击了确认');
            });
          }),
          SizedBox(height: 20.0),
          TdButton('confirm - 无标题', theme: TdButtonType.primary, onClick: () {
            TdDialog.confirm(context)('弹窗内容，告知当前状态、信息和解决方法，描述文字尽量控制在三行内',
                title: null, onCancel: () {
              TdToast.info(context)('点击了取消');
            }, onConfirm: () {
              TdToast.info(context)('点击了确认');
            });
          }),
          SizedBox(height: 20.0),
          TextTitle('android 主题', noPadding: true),
          TdButton('alert', theme: TdButtonType.primary, onClick: () {
            TdDialog.alert(context)('弹窗内容', theme: TdDialogTheme.android,
                onConfirm: () {
              TdToast.info(context)('点击了确认');
            });
          }),
          SizedBox(height: 20.0),
          TdButton('alert - 无标题', theme: TdButtonType.primary, onClick: () {
            TdDialog.alert(context)('弹窗内容',
                title: null, theme: TdDialogTheme.android, onConfirm: () {
              TdToast.info(context)('点击了确认');
            });
          }),
          SizedBox(height: 20.0),
          TdButton('confirm', theme: TdButtonType.primary, onClick: () {
            TdDialog.confirm(context)('弹窗内容，告知当前状态、信息和解决方法，描述文字尽量控制在三行内',
                theme: TdDialogTheme.android, onCancel: () {
              TdToast.info(context)('点击了取消');
            }, onConfirm: () {
              TdToast.info(context)('点击了确认');
            });
          }),
          SizedBox(height: 20.0),
          TdButton('confirm - 无标题', theme: TdButtonType.primary, onClick: () {
            TdDialog.confirm(context)('弹窗内容，告知当前状态、信息和解决方法，描述文字尽量控制在三行内',
                theme: TdDialogTheme.android, title: null, onCancel: () {
              TdToast.info(context)('点击了取消');
            }, onConfirm: () {
              TdToast.info(context)('点击了确认');
            });
          })
        ]));
  }
}
