import 'package:flutter/material.dart';
import '../toast/index.dart';

const Color _primaryColor = Color(0xff07C160);
const Color _primaryColorDisabled = Color(0xff06AD56);
const Color _warnColor = Color(0xffE64340);
const Color _warnColorDisabled = Color(0xffEC8B89);
const Color _defaultBackgroundColor = Color(0xfff8f8f8);
const Color _defaultBorderColor = Color(0xffd8d8d8);
const Color _maskColor = Color.fromRGBO(17, 17, 17, 0.6);

final _defaultTheme = TdTheme();
final _defaultConfig = TdConfig();

// 主题
class TdTheme {
  // 主色
  late final Color primaryColor;
  // 主色禁用
  late final Color primaryColorDisabled;
  // 警告色
  late final Color warnColor;
  // 警告色禁用
  late final Color warnColorDisabled;
  // 默认背景色
  late final Color defaultBackgroundColor;
  // 默认边框色
  late final Color defaultBorderColor;
  // 遮罩层颜色
  late final Color maskColor;

  TdTheme(
      {this.primaryColor = _primaryColor,
      this.primaryColorDisabled = _primaryColorDisabled,
      this.warnColor = _warnColor,
      this.warnColorDisabled = _warnColorDisabled,
      this.defaultBackgroundColor = _defaultBackgroundColor,
      this.defaultBorderColor = _defaultBorderColor,
      this.maskColor = _maskColor});
}

// 配置
class TdConfig {
  // toast 位置
  final TdToastInfoAlign toastInfoAlign;
  // toast info自动关闭时间
  final int toastInfoDuration;
  // toast loading关闭时间
  final int? toastLoadingDuration;
  // toast success关闭时间
  final int toastSuccessDuration;
  // toast fail关闭时间
  final int toastFailDuration;
  // notify自动关闭时间
  final int notifyDuration;
  // notify成功关闭时间
  final int notifySuccessDuration;
  // notify错误关闭时间
  final int notifyErrorDuration;

  TdConfig({
    this.toastInfoAlign = TdToastInfoAlign.center,
    this.toastInfoDuration = 2500,
    this.toastLoadingDuration,
    this.toastSuccessDuration = 2500,
    this.toastFailDuration = 2500,
    this.notifyDuration = 3000,
    this.notifySuccessDuration = 3000,
    this.notifyErrorDuration = 3000,
  });
}

class TdUi extends InheritedWidget {
  final TdTheme theme;
  final TdConfig config;

  TdUi({Key? key, required this.theme, required this.config, Widget? child})
      : super(key: key, child: child!);

  static TdUi? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: TdUi);
  }

  // 获取主题配置
  static TdTheme getTheme(BuildContext context) {
    final TdUi? tdui = TdUi.of(context);
    return tdui == null || tdui.theme == null ? _defaultTheme : tdui.theme;
  }

  // 获取全局配置
  static TdConfig getConfig(BuildContext context) {
    final TdUi tdui = TdUi.of(context)!;
    return tdui == null || tdui.config == null ? _defaultConfig : tdui.config;
  }

  @override
  bool updateShouldNotify(TdUi oldWidget) {
    return true;
  }
}
