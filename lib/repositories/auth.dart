import 'package:http/http.dart' as http;
import 'package:ralewayapp/api.dart';
import 'package:ralewayapp/repositories/repo_set/http_methods.dart';

class AuthRepository {
  static Future<void> register(
      http.Client client, Map<String, dynamic> data) async {
    await RepositoryUtils.postData(client, Api.register, data: data);
  }
}
