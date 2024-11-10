import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
 static late SharedPreferences sharedPreferences;
 static Future<void> cacheInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static Future<bool> setDate({required String key, required dynamic value}) async {
    if (value is String) {
      await sharedPreferences.setString(key, value);
      return true;
    }
    if (value is int) {
      await sharedPreferences.setInt(key, value);
      return true;
    }
    return false;
  }

  static dynamic getData({required String key}){
    return sharedPreferences.get(key);
  } 
  static dynamic removeData({required String key}){
    return sharedPreferences.remove(key);
  } 
}
