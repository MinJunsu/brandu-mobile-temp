import 'dart:convert';

import 'package:brandu/models/product.dart';
import 'package:brandu/providers/main.dart';
import 'package:http/http.dart';

class ProductClient extends APIClient {
  Future<List<SimpleProduct>> getHotDeals() async {
    Response response = await getRequest('/api/v1/products/hot-deal/');
    if (response.statusCode == 200) {
      List<dynamic> iterator = jsonDecode(utf8.decode(response.bodyBytes));
      return List.from(iterator.map((model) => SimpleProduct.fromJson(model)));
    }
    throw Error();
  }

  Future<List<MainCategory>> getCategories() async {
    Response response = await getRequest('/api/v1/products/categories/');
    if (response.statusCode == 200) {
      List<dynamic> iterator = jsonDecode(utf8.decode(response.bodyBytes));
      return List.from(iterator.map((model) => MainCategory.fromJson(model)));
    }
    throw Error();
  }
}
