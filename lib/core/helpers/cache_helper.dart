import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _preferences;
  static const String onBoardingKey = 'onBoarding';
  static const String userDataKey = 'userData';

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Save data
  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await _preferences.setString(key, value);
    if (value is int) return await _preferences.setInt(key, value);
    if (value is bool) return await _preferences.setBool(key, value);
    if (value is double) return await _preferences.setDouble(key, value);
    return false;
  }

  // get data
  static dynamic getData(String key) {
    return _preferences.get(key);
  }
  static String getStringData(String key) {
    return _preferences.getString(key) ?? '';
  }
  // Remove data
  static Future<bool> removeData(String key) async {
    return await _preferences.remove(key);
  }
}

bool? isSkippedOnBoarding;
