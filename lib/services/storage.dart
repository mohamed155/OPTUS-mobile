import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  factory StorageService() {
    return _instance;
  }

  StorageService._create() {
    init();
  }

  static final StorageService _instance = StorageService._create();

  static late SharedPreferences _storage;

  static Future<void> init() async {
    _storage = await SharedPreferences.getInstance();
  }

  String? retrieve(String key) {
    return _storage.getString(key);
  }

  Future<void> store({required String key, required String value}) {
    return _storage.setString(key, value);
  }

  Future<void> remove({required String key}) {
    return _storage.remove(key);
  }

  Future<void> clear() {
    return _storage.clear();
  }
}
