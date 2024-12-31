import 'package:flutter/services.dart';

class PlatformService {
  static const MethodChannel _channel = MethodChannel('com.example/my_channel');

  // Example method to invoke platform-specific code
  static Future<String?> getPlatformData(String data) async {
    try {
      final String? result = await _channel.invokeMethod('getPlatformData',{"data":data});
      return result;
    } on PlatformException catch (e) {
      
      print('Failed to get platform data: ${e.message}');
      return null;
    }
  }
}