import 'dart:async';

import 'package:flutter/services.dart';

class BarcodeReader {
  static const MethodChannel _channel =
      const MethodChannel('Reader');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  static Future<int> get openCamera async {
    final Map<dynamic,dynamic> resultMap = await _channel.invokeMethod('openCamera');

    return resultMap["texture_id"];
  }
}
