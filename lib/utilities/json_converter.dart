import 'dart:convert';

class JSONConverter {
  factory JSONConverter() {
    return _instance;
  }

  JSONConverter._create();

  static final _instance = JSONConverter._create();

  static const JsonEncoder _encoder = JsonEncoder();
  static const JsonDecoder _decoder = JsonDecoder();

  dynamic decode(String data) {
    return _decoder.convert(data);
  }

  String encode(dynamic data) {
    return _encoder.convert(data);
  }
}
