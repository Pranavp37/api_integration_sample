import 'dart:developer';

import 'package:api_integration_sample/model/product_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductController with ChangeNotifier {
  List<ProductModel> product = [];
  bool isLoading = false;
  Future<void> getData() async {
    isLoading = true;
    notifyListeners();
    var url = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        product = productModelFromJson(response.body);
      }
    } catch (e) {
      log('$e');
    }
    isLoading = false;
    notifyListeners();
  }
}
