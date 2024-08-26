import 'dart:convert';

import 'package:e_commerce_app_assignment/models/productmodel.dart';
import 'package:http/http.dart' as http;

Future<Product> fetchProducts() async {
  const url = 'https://dummyjson.com/products';
  
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    return Product.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load products');
  }
}