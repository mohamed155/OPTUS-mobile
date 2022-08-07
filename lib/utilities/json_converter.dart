import 'dart:convert';

class JSONConverter {
  static const JsonEncoder _encoder = JsonEncoder();
  static const JsonDecoder _decoder = JsonDecoder();

  static dynamic decode(String data) {
    return _decoder.convert(data);
  }

  static String encode(dynamic data) {
    return _encoder.convert(data);
  }
}