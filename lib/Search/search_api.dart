import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sasto_wholesale/TopProducts/top_product_all_item_model.dart';

class SearchProductsApi {
  static Future<List<TopProductData>> searchProductList(String q) async {
    final url = Uri.parse(
        'https://seller.sastowholesale.com/api/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List product = json.decode(response.body)["data"];

      return product.map((json) => TopProductData.fromJson(json)).where((product) {
        final titleLower = product.title.toLowerCase();
       // final priceLower = product.price.toLowerCase();
        final searchLower = q.toLowerCase();

        return titleLower.contains(searchLower);
           // priceLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}