import 'package:ralewayapp/settings.dart';

class Api {
  static String get baseURL => Settings.baseUrl;
  static String get register => '$baseURL/auth/users/first/edit';
  static String get login => '$baseURL/auth/login';
  static String get users => '$baseURL/auth/users';
}
