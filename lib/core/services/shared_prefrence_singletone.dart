import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceSingletone {
  SharedPrefrenceSingletone._();
  static final SharedPrefrenceSingletone instance =
      SharedPrefrenceSingletone._();
  late SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setBool(String key, bool value) async {
    await instance._sharedPreferences.setBool(key, value);
  }

  static getBool(String key) {
    return instance._sharedPreferences.getBool(key) ?? false;
  }
}
