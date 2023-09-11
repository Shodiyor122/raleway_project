import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ralewayapp/api.dart';
import 'package:ralewayapp/models/product.dart';
import 'package:ralewayapp/repositories/repo_set/http_methods.dart';

class ProductRepository {
  static Future<List<Product>> fetchProducts(http.Client client) async {
    final response =
        await RepositoryUtils.fetchData(client, "${Api.products}?populate=*");

    // Parse response.
    var data = json.decode(response.body);

    List<Product> products = [];
    for (var product in data) {
      products.add(Product.fromJson(product));
    }

    return products;
  }
}
