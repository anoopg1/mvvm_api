import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvvm_project/model/product_model/product.dart';
import 'package:mvvm_project/model/product_model/product_model.dart';

class ApiServices {
  Future<List<Product>?> fetchData() async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/products#"),
    );
    final convertedData = jsonDecode(response.body);
    var res = ProductModel.fromJson(convertedData);
    var list = res.products;
    return list;
  }
}
