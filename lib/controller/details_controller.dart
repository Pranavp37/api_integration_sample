import 'dart:developer';

import 'package:api_integration_sample/model/product_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailsController with ChangeNotifier {
  ProductModel? product;

  bool isLoading = false;
  Future<void> getData(int count) async {
    isLoading = true;
    notifyListeners();
    var url = Uri.parse('https://fakestoreapi.com/products/$count');
    var response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        product = detailsModelFromJson(response.body);
      }
    } catch (e) {
      log('$e');
    }
    isLoading = false;
    notifyListeners();
  }
}
