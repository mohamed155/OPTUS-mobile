import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _storage;

  static Future<void> init() async {
    _storage = await SharedPreferences.getInstance();
  }

  static String? retrieve(String key) {
    return _storage.getString(key);
  }

  static Future<void> store({required String key, required String value}) {
    return _storage.setString(key, value);
  }

  static Future<void> remove({required String key}) {
    return _storage.remove(key);
  }

  static Future<void> clear() {
    return _storage.clear();
  }
}