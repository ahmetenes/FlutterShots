import 'dart:async';

import 'package:flutter/services.dart';

class Xmljson {
  static const MethodChannel _channel =
      const MethodChannel('xmljson');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
