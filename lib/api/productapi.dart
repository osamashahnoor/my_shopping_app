import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_shopping_app/model/product.dart';

class ProductService {
  static const String baseUrl = "https://fakestoreapi.com/products";

  Future<List<Product>?> getAllProducts() async {
    final productsUrl = Uri.parse(baseUrl);

    try {
      final response = await http.get(productsUrl);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((item) => Product.fromJson(item)).toList();
      } else {
        ("Failed to load products. ");
        return null;
      }
    } catch (e) {
      ("Error fetching products: $e");
      return null;
    }
  }

  Future<Product?> getSingleProduct(int productId) async {
    final productUrl = Uri.parse("$baseUrl/$productId");

    try {
      final response = await http.get(productUrl);

      if (response.statusCode == 200) {
        return Product.fromJson(json.decode(response.body));
      } else {
        ("Failed to load product. ");
        return null;
      }
    } catch (e) {
    ("Error fetching product: $e");
      return null;
    }
  }
}