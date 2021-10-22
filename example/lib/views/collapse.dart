import 'package:flutter/material.dart';
import '../layout/sample.dart';
import 'package:tdui/tdui.dart';
import '../components/title.dart';

class CollapsePage extends StatefulWidget {
  @override
  CollapsePageState createState() => CollapsePageState();
}

class CollapsePageState extends State {
  @override
  Widget build(BuildContext context) {
    final List<TdCollapseItem> options = [];

    ['1', '2', '3'].forEach((item) {
      options
          .add(TdCollapseItem(title: Text('选项$item'), child: Text('内容$item')));
    });

    return Sample('Collapse',
        showPadding: false,
        describe: '折叠面板',
        child: Column(children: <Widget>[
          TextTitle('默认'),
          TdCollapse(children: options),
          TextTitle('设置默认展示'),
          TdCollapse(defaultActive: ['1'], children: options),
          TextTitle('卡片方式'),
          TdCollapse(card: true, children: options),
          TextTitle('手风琴模式'),
          TdCollapse(accordion: true, children: options),
          TextTitle('onChange'),
          TdCollapse(
              children: options,
              onChange: (List<String> value) {
                TdToast.info(context)('当前打开的：' + value.toString());
              })
        ]));
  }
}
