import 'package:flutter/material.dart';
import '../layout/sample.dart';
import 'package:tdui/tdui.dart';

class SpinPage extends StatefulWidget {
  @override
  SpinPageState createState() => SpinPageState();
}

class SpinPageState extends State {
  bool loading = true;

  void toggle() {
    setState(() {
      loading = !loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sample(
      'Spin',
      describe: '用于页面和数据的加载中状态',
      child: Column(
        children: [
          Container(
            height: 300,
            child: TdSpin(
              isShow: loading,
              tip: Text('加载中'),
              child: Container(
                color: Colors.yellow,
                child: Center(
                  child: Text('这个是内容'),
                ),
              ),
            ),
          ),
          Container(
            height: 10.0,
          ),
          TdButton(loading ? '停止加载' : '加载',
              theme: TdButtonType.primary, onClick: toggle),
        ],
      ),
    );
  }
}
