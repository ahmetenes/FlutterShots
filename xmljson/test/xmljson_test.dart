import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xmljson/xmljson.dart';

void main() {
  const MethodChannel channel = MethodChannel('xmljson');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Xmljson.platformVersion, '42');
  });
}
