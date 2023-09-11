import 'package:shared_preferences/shared_preferences.dart';

const String introKey = 'RalewayIntro';
const String tokenKey = 'RalewayToken';
const String userStatusKey = 'RalewayUserStatus';

class Preferences {
  static Future<bool> setIntroFinished(bool finished) async {
    final preferences = await SharedPreferences.getInstance();
    final isSaved = await preferences.setBool(introKey, finished);
    return isSaved;
  }

  static Future<bool> getIntroFinished() async {
    final preferences = await SharedPreferences.getInstance();
    final finished = preferences.getBool(introKey) ?? false;
    return finished;
  }

  static Future<bool> setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    final isSaved = await preferences.setString(tokenKey, token);
    return isSaved;
  }

  static Future<String> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString(tokenKey) ?? "";
    return token;
  }

  static Future<bool> removeToken() async {
    final preferences = await SharedPreferences.getInstance();
    final isRemoved = await preferences.remove(tokenKey);
    return isRemoved;
  }

  static Future<bool> setUserStatus(bool userStatus) async {
    final preferences = await SharedPreferences.getInstance();
    final isSaved = await preferences.setBool(userStatusKey, userStatus);
    return isSaved;
  }

  static Future<bool> getUserStatus() async {
    final preferences = await SharedPreferences.getInstance();
    final userStatus = preferences.getBool(userStatusKey) ?? false;
    return userStatus;
  }
}
