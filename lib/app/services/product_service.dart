import 'dart:convert';

import 'package:api_flutter/app/models/products.dart';
import 'package:api_flutter/app/utils/constance.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Products>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(getProductUrl));
      if (response.statusCode == 200) {
        List<dynamic> products = json.decode(response.body);
        return products.map((m) => Products.fromJson(m)).toList();
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
