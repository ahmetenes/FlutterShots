import 'dart:async';

import 'package:flutter/services.dart';

class BarcodeReader {
  static const MethodChannel _channel = const MethodChannel('Reader');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<int> get openCamera async {
    final Map<dynamic, dynamic> resultMap =
        await _channel.invokeMethod('openCamera');

    return resultMap["texture_id"];
  }

  static Future<List<String>> get detectBarcode async {
    final Map<dynamic, dynamic> resultMap =
        await _channel.invokeMethod('detectBarcode');
    var dlist = new List<dynamic>();
    dlist = resultMap["barcodes"];
    return dlist.cast<String>().toList();
  }
}
