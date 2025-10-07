import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _instance;
  static bool _initialized = false;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
    _initialized = true;
  }

  // Set a boolean value. Returns true if the operation succeeded.
  static Future<bool> setBool(String key, bool value) async {
    _ensureInitialized();
    return await _instance.setBool(key, value);
  }

  // Set a string value. Returns true if the operation succeeded.
  static Future<bool> setString(String key, String value) async {
    _ensureInitialized();
    return await _instance.setString(key, value);
  }

  // Get a stored string or null if not present.
  static String? getString(String key) {
    _ensureInitialized();
    return _instance.getString(key);
  }

  // Get a stored bool. Returns null if not present.
  static bool? getBool(String key) {
    _ensureInitialized();
    return _instance.getBool(key) ?? false;
  }

  static void _ensureInitialized() {
    if (!_initialized) {
      throw StateError('Prefs.init() must be called before using Prefs');
    }
  }
}
