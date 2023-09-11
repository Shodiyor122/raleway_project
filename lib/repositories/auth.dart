import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ralewayapp/api.dart';
import 'package:ralewayapp/models/login_data.dart';
import 'package:ralewayapp/repositories/repo_set/http_methods.dart';

class AuthRepository {
  static Future<void> register(
      http.Client client, Map<String, dynamic> data) async {
    await RepositoryUtils.postData(client, Api.register, data: data);
  }

  static Future<LoginData> login(
    http.Client client,
    Map<String, dynamic> data,
  ) async {
    final response =
        await RepositoryUtils.postData(client, Api.login, data: data);

    // Parse response.
    var body = json.decode(response.body);

    return LoginData.fromJson(body);
  }
}
