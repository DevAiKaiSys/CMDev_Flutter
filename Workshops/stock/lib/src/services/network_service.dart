import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:stock/src/models/post.dart';

class NetworkService {
  // singleton
  NetworkService._internal();

  static final NetworkService _instance = NetworkService._internal();

  factory NetworkService() => _instance;

  //

  final dio = Dio();

  Future<List<Post>> fetchPosts(int startIndex, {int limit = 10}) async {
    const url = 'https://jsonplaceholder.typicode.com/posts?_start=0&_limit=10';
    Response response;
    response = await dio.get(url);
    if (response.statusCode == 200) {
      return postFromJson(jsonEncode(response.data));
    }
    throw Exception('Network failed');
  }
}
