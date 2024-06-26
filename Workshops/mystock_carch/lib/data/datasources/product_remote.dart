import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mystock_carch/constants/api.dart';

import '../models/product.dart';

class ProductRemoteDataSource {
  final Dio client;

  ProductRemoteDataSource({required this.client});

  Future<List<Product>> getAllProduct() async {
    /*const url = '${API.baseUrl}${API.product}';
    debugPrint(url);*/
    const url = API.product;
    Response response = await client.get(url);
    if (response.statusCode == 200) {
      return productFromJson(jsonEncode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<String> addProduct(Product product, {File? imageFile}) async {
    const url = API.product;

    FormData data = FormData.fromMap({
      'name': product.name,
      'price': product.price,
      'stock': product.stock,
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        )
    });

    final Response response = await client.post(url, data: data);
    if (response.statusCode == 201) {
      return 'Add Successfully';
    }
    throw Exception('Network failed');
  }

  Future<String> editProduct(Product product, {File? imageFile}) async {
    final url = '${API.product}/${product.id}';

    FormData data = FormData.fromMap({
      'name': product.name,
      'price': product.price,
      'stock': product.stock,
      if (imageFile != null)
        'photo': await MultipartFile.fromFile(
          imageFile.path,
          contentType: MediaType('image', 'jpg'),
        )
    });

    Response response = await client.put(url, data: data); // send formdata
    if (response.statusCode == 200) {
      return 'Edit Successfully';
    }
    throw Exception('Network failed');
  }

  Future<String> deleteProduct(int productId) async {
    final url = '${API.product}/$productId';

    Response response = await client.delete(url);
    if (response.statusCode == 204) {
      return 'Delete Successfully';
    }
    throw Exception('Network failed');
  }
}
