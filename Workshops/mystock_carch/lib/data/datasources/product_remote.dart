import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mystock_carch/constants/api.dart';

import '../models/product.dart';

class ProductRemoteDataSource {
  final Dio client;

  ProductRemoteDataSource({required this.client});

  Future<List<Product>> getAllProduct() async {
    const url = '${API.baseUrl}${API.product}';
    debugPrint(url);
    Response response = await client.get(url);
    if (response.statusCode == 200) {
      return productFromJson(jsonEncode(response.data));
    }
    throw Exception('Network failed');
  }
}
