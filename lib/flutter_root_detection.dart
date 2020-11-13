import 'dart:async';

import 'package:flutter/services.dart';

final FlutterRootDetection flutterRootDetection = FlutterRootDetection._();

class FlutterRootDetection {
  static const MethodChannel _channel =
      const MethodChannel('flutter_root_detection');

  FlutterRootDetection._();

  Future<bool> get rooted async {
    final isRooted = await _channel.invokeMethod('rooted');
    return isRooted == true || isRooted == 1;
  }

  Future<bool> get developerMode async {
    final inDevMode = await _channel.invokeMethod('developerMode');
    return inDevMode == true || inDevMode == 1;
  }
}
