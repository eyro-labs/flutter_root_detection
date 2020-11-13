import 'dart:async';

import 'package:flutter/services.dart';

final FlutterRootDetection flutterRootDetection = FlutterRootDetection._();

class FlutterRootDetection {
  static const MethodChannel _channel =
      const MethodChannel('flutter_root_detection');

  FlutterRootDetection._() : throwWhenRooted = false;

  bool throwWhenRooted;

  Future<bool> get rooted async {
    final rooted = await _channel.invokeMethod('rooted');
    bool isRooted = rooted == true || rooted == 1;

    if (throwWhenRooted == true && !isRooted) {
      throw FlutterRootDetectionException();
    }

    return isRooted;
  }

  Future<bool> get developerMode async {
    final inDevMode = await _channel.invokeMethod('developerMode');
    return inDevMode == true || inDevMode == 1;
  }
}

class FlutterRootDetectionException implements Exception {
  @pragma("vm:entry-point")
  FlutterRootDetectionException();

  @override
  String toString() => 'Device is rooted/jailbroken';
}
