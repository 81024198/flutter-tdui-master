import 'package:flutter/material.dart';
import '../layout/sample.dart';
import 'package:tdui/tdui.dart';
import '../components/title.dart';

final Widget rowBox = SizedBox(height: 15);

class ToastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sample('Toast',
        describe: '弹出式提示',
        child: Column(children: <Widget>[
          TextTitle('Toast.info', noPadding: true),
          TdButton('default', theme: TdButtonType.primary, onClick: () {
            TdToast.info(context)('提示');
          }),
          rowBox,
          TdButton('info top', theme: TdButtonType.primary, onClick: () {
            TdToast.info(context)('提示 - top', align: TdToastInfoAlign.top);
          }),
          rowBox,
          TdButton('info bottom', theme: TdButtonType.primary, onClick: () {
            TdToast.info(context)('提示 - bottom',
                align: TdToastInfoAlign.bottom);
          }),
          rowBox,
          TdButton('info 自定义时间', theme: TdButtonType.primary, onClick: () {
            TdToast.info(context)('5秒消失...', duration: 5000);
          }),
          rowBox,
          TdButton('自定义距离', theme: TdButtonType.primary, onClick: () {
            TdToast.info(context)('只适合align为top或bottom...',
                align: TdToastInfoAlign.top, distance: 250.0);
          }),
          rowBox,
          TdButton('带Widget的内容', theme: TdButtonType.primary, onClick: () {
            TdToast.info(context)(
                Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Icon(TdIcons.loading, color: Colors.white),
              Padding(
                  padding: EdgeInsets.only(left: 10), child: Text('任意内容...'))
            ]));
          }),
          rowBox,
          TextTitle('其他提示', noPadding: true),
          TdButton('loading', theme: TdButtonType.primary, onClick: () {
            final Function close = TdToast.loading(context)(message: '加载中...');
            // 五秒后关闭
            Future.delayed(Duration(milliseconds: 5000), () {
              close();
            });
          }),
          rowBox,
          TdButton('loading - 无文字', theme: TdButtonType.primary, onClick: () {
            TdToast.loading(context)(duration: 3000);
          }),
          rowBox,
          TdButton('success', theme: TdButtonType.primary, onClick: () {
            TdToast.success(context)(message: '已完成');
          }),
          rowBox,
          TdButton('success - 无文字', theme: TdButtonType.primary, onClick: () {
            TdToast.success(context)();
          }),
          rowBox,
          TdButton('fail', theme: TdButtonType.primary, onClick: () {
            TdToast.fail(context)(message: '操作失败');
          }),
          rowBox,
          TdButton('fail - 无文字', theme: TdButtonType.primary, onClick: () {
            TdToast.fail(context)();
          }),
        ]));
  }
}
