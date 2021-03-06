import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:barcode_reader/barcode_reader.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  int _textureId;
  List<String> barcode;

  @override
  void initState() {
    super.initState();
    getTextureId();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await BarcodeReader.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> getTextureId() async {
    int textureId;

    textureId = await BarcodeReader.openCamera;

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return -1;

    setState(() {
      _textureId = textureId;
    });
  }

  Future<void> detectBarcode() async {
    List<String> _barcode;

    _barcode = await BarcodeReader.detectBarcode;

    setState(() {
      barcode = _barcode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Barcode Reader Plugin Example'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Text(
                  (barcode != null && barcode.length > 0)
                      ? "${barcode[0]}"
                      : "Nothing Returned",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: _textureId != null
                    ? Container(
                        child: Texture(textureId: _textureId),
                      )
                    : Text(_textureId.toString()),
              ),
            ]),
        floatingActionButton: FloatingActionButton(onPressed: () {
          detectBarcode();
        }),
      ),
    );
  }
}
