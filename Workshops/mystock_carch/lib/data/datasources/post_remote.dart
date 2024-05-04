import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/post.dart';

class PostRemoteDataSource {
  final Dio client;

  PostRemoteDataSource({required this.client});

  Future<List<Post>> fetchPosts(int startIndex, {int limit = 10}) async {
    final url =
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit';
    final Response response = await client.get(url);
    if (response.statusCode == 200) {
      return postFromJson(jsonEncode(response.data));
    }
    throw Exception('Network failed');
  }
}
