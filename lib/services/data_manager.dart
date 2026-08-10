import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_logger.dart';

class DataManager {
  static DataManager? _instance;

  DataManager._internal();

  static DataManager get instance {
    _instance ??= DataManager._internal();
    return _instance!;
  }

  /// Lazily-initialized SharedPreferences instance.
  static SharedPreferences? _prefs;

  Future<SharedPreferences> get _preferences async {
    if (_prefs != null) return _prefs!;
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  /// Save a string value to SharedPreferences
  Future<bool> setString(String key, String value) async {
    try {
      final prefs = await _preferences;
      return await prefs.setString(key, value);
    } catch (e) {
      AppLogger.error('Error setting string preference: $e');
      return false;
    }
  }

  /// Get a string value from SharedPreferences
  Future<String?> getString(String key, {String? defaultValue}) async {
    try {
      final prefs = await _preferences;
      final value = prefs.getString(key);
      return value ?? defaultValue;
    } catch (e) {
      AppLogger.error('Error getting string preference: $e');
      return defaultValue;
    }
  }

  /// Save an integer value to SharedPreferences
  Future<bool> setInt(String key, int value) async {
    try {
      final prefs = await _preferences;
      return await prefs.setInt(key, value);
    } catch (e) {
      AppLogger.error('Error setting int preference: $e');
      return false;
    }
  }

  /// Get an integer value from SharedPreferences
  Future<int?> getInt(String key, {int? defaultValue}) async {
    try {
      final prefs = await _preferences;
      final value = prefs.getInt(key);
      return value ?? defaultValue;
    } catch (e) {
      AppLogger.error('Error getting int preference: $e');
      return defaultValue;
    }
  }

  /// Save a boolean value to SharedPreferences
  Future<bool> setBool(String key, bool value) async {
    try {
      final prefs = await _preferences;
      return await prefs.setBool(key, value);
    } catch (e) {
      AppLogger.error('Error setting bool preference: $e');
      return false;
    }
  }

  /// Get a boolean value from SharedPreferences
  Future<bool?> getBool(String key, {bool? defaultValue}) async {
    try {
      final prefs = await _preferences;
      final value = prefs.getBool(key);
      return value ?? defaultValue;
    } catch (e) {
      AppLogger.error('Error getting bool preference: $e');
      return defaultValue;
    }
  }

  /// Save a double value to SharedPreferences
  Future<bool> setDouble(String key, double value) async {
    try {
      final prefs = await _preferences;
      return await prefs.setDouble(key, value);
    } catch (e) {
      AppLogger.error('Error setting double preference: $e');
      return false;
    }
  }

  /// Get a double value from SharedPreferences
  Future<double?> getDouble(String key, {double? defaultValue}) async {
    try {
      final prefs = await _preferences;
      final value = prefs.getDouble(key);
      return value ?? defaultValue;
    } catch (e) {
      AppLogger.error('Error getting double preference: $e');
      return defaultValue;
    }
  }

  /// Remove a key from SharedPreferences
  Future<bool> remove(String key) async {
    try {
      final prefs = await _preferences;
      return await prefs.remove(key);
    } catch (e) {
      AppLogger.error('Error removing preference: $e');
      return false;
    }
  }

  /// Clear all SharedPreferences
  Future<bool> clear() async {
    try {
      final prefs = await _preferences;
      return await prefs.clear();
    } catch (e) {
      AppLogger.error('Error clearing preferences: $e');
      return false;
    }
  }

  /// Check if a key exists in SharedPreferences
  Future<bool> containsKey(String key) async {
    try {
      final prefs = await _preferences;
      return prefs.containsKey(key);
    } catch (e) {
      AppLogger.error('Error checking key existence: $e');
      return false;
    }
  }

  /// Get all keys from SharedPreferences
  Future<Set<String>> getKeys() async {
    try {
      final prefs = await _preferences;
      return prefs.getKeys();
    } catch (e) {
      AppLogger.error('Error getting keys: $e');
      return <String>{};
    }
  }
}
