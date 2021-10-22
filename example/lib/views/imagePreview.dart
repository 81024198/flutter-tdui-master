import 'package:flutter/material.dart';
import '../layout/sample.dart';
import 'package:tdui/tdui.dart';

final Widget box = SizedBox(height: 20.0);
final List<String> images = [
  'https://img.yzcdn.cn/public_files/2017/09/05/3bd347e44233a868c99cf0fe560232be.jpg',
  'https://img.yzcdn.cn/public_files/2017/09/05/c0dab461920687911536621b345a0bc9.jpg',
  'https://img.yzcdn.cn/public_files/2017/09/05/4e3ea0898b1c2c416eec8c11c5360833.jpg'
];

class ImagePreviewPage extends StatefulWidget {
  @override
  ImagePreviewState createState() => ImagePreviewState();
}

class ImagePreviewState extends State {
  @override
  Widget build(BuildContext context) {
    return Sample('imagePreview',
        describe: '图片预览',
        child: Column(children: [
          TdButton('图片预览', theme: TdButtonType.primary, onClick: () {
            tdImagePreview(context)(images: images);
          }),
          box,
          TdButton('隐藏指标', theme: TdButtonType.primary, onClick: () {
            tdImagePreview(context)(images: images, indicators: false);
          }),
          box,
          TdButton('默认展示第二张', theme: TdButtonType.primary, onClick: () {
            tdImagePreview(context)(images: images, defaultIndex: 1);
          })
        ]));
  }
}
