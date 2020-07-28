
import 'package:barcode_reader/barcode_reader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarcodeScreen extends StatefulWidget {
  @override
  _SearchBarcodeScreenState createState() => _SearchBarcodeScreenState();
}

class _SearchBarcodeScreenState extends State<SearchBarcodeScreen> {
  final BarcodeReader reader = new BarcodeReader();
  int textureId;
  String barcode;

  Future<void> getTextureId() async {
    int _textureId;
    _textureId = await BarcodeReader.openCamera;

    setState(() {
      textureId = _textureId;
    });
  }

  Future<void> getBarcode() async {
    List<String> _barcode;
    _barcode = await BarcodeReader.detectBarcode;

    setState(() {
      barcode = _barcode.isEmpty ? "null" : _barcode[0];
    });
    Navigator.of(context).pop(barcode);
  }

  @override
  void initState() {
    super.initState();
    getTextureId();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    ? "$barcode"
                    : "Nothing Returned",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: textureId != null
                  ? Container(
                child: Texture(textureId: textureId),
              )
                  : Text(textureId.toString()),
            ),
          ]),
      floatingActionButton: FloatingActionButton(onPressed: () {
        getBarcode();
      }),
    );
  }
}
