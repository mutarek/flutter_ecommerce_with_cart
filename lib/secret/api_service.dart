import 'dart:convert';

import 'package:ecom/models/product_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  Future<List<ProductModel>> fetchProduct() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<ProductModel>((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
