import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:stock/src/constants/api.dart';
import 'package:stock/src/models/post.dart';
import 'package:stock/src/models/product.dart';

class NetworkService {
  // singleton
  NetworkService._internal();

  static final NetworkService _instance = NetworkService._internal();

  factory NetworkService() => _instance;

  //

  final dio = Dio();

  Future<List<Product>> getAllProduct() async {
    final url = '${API.BASE_URL}${API.PRODUCT}';
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return productFromJson(jsonEncode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<List<Post>> fetchPosts(int startIndex, {int limit = 10}) async {
    final url =
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit';
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return postFromJson(jsonEncode(response.data));
    }
    throw Exception('Network failed');
  }
}
