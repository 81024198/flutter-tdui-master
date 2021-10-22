import 'package:flutter/material.dart';
import '../layout/sample.dart';
import 'package:tdui/tdui.dart';

class CallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sample('Cell',
        showPadding: false,
        describe: '列表',
        child: TdCells(children: [
          TdCell(label: '标题文字'),
          TdCell(label: Text('手机号'), content: Text('content')),
          TdCell(
              label: Row(children: <Widget>[
                Padding(
                    child: Icon(TdIcons.info),
                    padding: EdgeInsets.only(right: 2)),
                Text('标题文字')
              ]),
              content: '带图标的标题'),
          TdCell(
              label: '标题文字',
              content: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        child: Icon(TdIcons.info),
                        padding: EdgeInsets.only(right: 2)),
                    Text('带图标的内容')
                  ])),
          TdCell(label: '带icon', content: '内容', footer: Icon(TdIcons.clear)),
          TdCell(
              label: '标题文字',
              content: '带点击效果的',
              onClick: () {
                print('click');
              }),
          TdCell(
              label: '自定义内容',
              content:
                  Container(child: TdButton('Button', size: TdButtonSize.mini)))
        ]));
  }
}
