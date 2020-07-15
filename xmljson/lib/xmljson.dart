import 'dart:async';

import 'package:flutter/services.dart';

class Xmljson {
  static const MethodChannel _channel =
      const MethodChannel('xmljson');

  static Future<String> get convertXmlToJson async {
    final String xmlString = "An XML string";
    final String version = await _channel.invokeMethod('convertXmlToJson',<String,dynamic>{
      "xmlString":xmlString,
    });
    return version;
  }
}
