import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

xLog({required String message}) {
  if (kDebugMode) {
  debugPrint(
    '🐛 $message',
  );
  }
}

xPrettyLog({required String message}) {
  if (kDebugMode) {
  Logger().d(message);
  }
}
