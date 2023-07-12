import 'package:flutter/foundation.dart';

class LogUtility {
  static void info({
    required String tag,
    required String message
  }) => debugPrint('[HelpMeApp] [📘] $tag: $message');

  static void ok({
    required String tag,
    required String message
  }) => debugPrint('[HelpMeApp] [📗] $tag: $message');

  static void warning({
    required String tag,
    required String message,
    StackTrace? stackTrace
  }) {
    debugPrint('[HelpMeApp] [📙] $tag: $message');
    if (stackTrace != null) {
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  static void error({
    required String tag,
    required String message,
    StackTrace? stackTrace
  }) {
    debugPrint('[HelpMeApp] [📕] $tag: $message');
    if (stackTrace != null) {
      debugPrintStack(stackTrace: stackTrace);
    }
  }
}
