import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ralewayapp/api.dart';
import 'package:ralewayapp/models/user.dart';
import 'package:ralewayapp/repositories/repo_set/http_methods.dart';

class UserRepository {
  static Future<User> fetchUser(http.Client client) async {
    final response = await RepositoryUtils.fetchData(client, "${Api.users}/me");

    // Parse response.
    var data = json.decode(response.body);

    return User.fromJson(data);
  }
}
