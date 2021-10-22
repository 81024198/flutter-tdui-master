import 'dart:async';
import 'package:flutter/material.dart';
import './notify.dart';
import '../utils.dart';
import '../theme/index.dart';

typedef _Notify = Function({int? duration, @required Widget? child});

typedef _Show = Function(
    {Color? color, int? duration, @required Widget? child});

class TdNotify {
  // 成功
  static _Notify success(BuildContext context) {
    final int notifySuccessDuration =
        TdUi.getConfig(context).notifySuccessDuration;
    return ({duration, child}) {
      TdNotify.show(context)(
          color: TdUi.getTheme(context).primaryColor,
          duration: duration == null ? notifySuccessDuration : duration,
          child: child == null ? Container() : child);
    };
  }

  // 失败
  static error(BuildContext context) {
    final int notifyErrorDuration = TdUi.getConfig(context).notifyErrorDuration;
    return ({duration, child}) {
      TdNotify.show(context)(
          color: TdUi.getTheme(context).warnColor,
          duration: duration == null ? notifyErrorDuration : duration,
          child: child);
    };
  }

  static _Show show(BuildContext context) {
    final int notifyDuration = TdUi.getConfig(context).notifyDuration;
    return ({color, duration, child}) {
      final GlobalKey widgetKey = GlobalKey();
      final Function remove = createOverlayEntry(
          context: context,
          child: NotifyWidget(
              key: widgetKey,
              color: color == null ? TdUi.getTheme(context).warnColor : color,
              child: child == null ? Container() : child));

      void close() async {
        // 反向执行动画
        await (widgetKey.currentState as NotifyWidgetState).reverseAnimation();
        remove();
      }

      Future.delayed(
          Duration(milliseconds: duration == null ? notifyDuration : duration),
          close);
    };
  }
}
