import 'package:flutter/material.dart';
import '../layout/sample.dart';
import 'package:tdui/tdui.dart';

class Loadmore extends StatefulWidget {
  @override
  LoadmorePageState createState() => LoadmorePageState();
}

class LoadmorePageState extends State {
  @override
  Widget build(BuildContext context) {
    return Sample('Loadmore',
        describe: '加载中',
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TdLoadmore(loading: true, loadingChild: Text('自定义加载中内容...')),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              TdLoadmore(moreChild: Text('自定义加载更多内容...'))
            ]));
  }
}
