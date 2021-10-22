import 'package:flutter/material.dart';
import '../cell/index.dart';

class TdForm extends StatefulWidget {
  final bool boxBorder;
  final double spacing;
  final double height;
  final List<Widget> children;

  TdForm(
      {key,
      this.boxBorder = true,
      this.spacing = labelSpacing,
      this.height = 50,
      required this.children})
      : super(key: key);

  static TdFormState of(BuildContext context) {
    final TdFormScope? scope =
        context.dependOnInheritedWidgetOfExactType(aspect: TdFormScope);
    return scope!.state;
  }

  @override
  TdFormState createState() => TdFormState();
}

class TdFormState extends State<TdForm> {
  final Map<dynamic, dynamic> formValue = {};

  // 设置表单值
  void setValue(Map<dynamic, dynamic> value) {
    setState(() {
      formValue.addAll(value);
    });
  }

  validate() {}

  @override
  Widget build(BuildContext context) {
    return TdFormScope(
        state: this,
        formValue: formValue,
        child: TdCells(
            boxBorder: widget.boxBorder,
            spacing: widget.spacing,
            children: widget.children));
  }
}

class TdFormScope extends InheritedWidget {
  final TdFormState state;
  final formValue;

  TdFormScope(
      {Key? key, required this.state, this.formValue, required Widget child})
      : super(key: key, child: child);

  static TdFormScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: TdFormScope);
  }

  //是否重建widget就取决于数据是否相同
  @override
  bool updateShouldNotify(TdFormScope oldWidget) {
    return formValue != oldWidget.formValue;
  }
}
