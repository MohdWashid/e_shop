// lib/repositories/product_repository.dart
import 'dart:convert';
import 'package:e_shop/feautures/home/model/productmodel.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  static const String baseUrl = 'https://dummyjson.com';

  Future<ProductResponse> fetchProducts({int skip = 0, int limit = 10}) async {
    final response = await http.get(
      Uri.parse('$baseUrl/products?skip=$skip&limit=$limit'),
    );

    if (response.statusCode == 200) {
      return ProductResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> fetchProductById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$id'));

    if (response.statusCode == 200) {
      return Product.fromJson(response.body);
    } else {
      throw Exception('Failed to load product');
    }
  }
}
