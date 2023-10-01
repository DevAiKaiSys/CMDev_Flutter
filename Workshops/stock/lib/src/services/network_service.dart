import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:stock/src/constants/api.dart';
import 'package:stock/src/models/post.dart';
import 'package:stock/src/models/product.dart';
import 'package:http_parser/http_parser.dart';

class NetworkService {
  // singleton
  NetworkService._internal();

  static final NetworkService _instance = NetworkService._internal();

  factory NetworkService() => _instance;

  //

  // final dio = Dio();
  //
  // void interceptors() {
  //   dio.interceptors.add(
  //     InterceptorsWrapper(
  //       onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
  //         // Do something before request is sent.
  //         // If you want to resolve the request with custom data,
  //         // you can resolve a `Response` using `handler.resolve(response)`.
  //         // If you want to reject the request with a error message,
  //         // you can reject with a `DioException` using `handler.reject(dioError)`.
  //         return handler.next(options);
  //       },
  //       onResponse: (Response response, ResponseInterceptorHandler handler) {
  //         // Do something with response data.
  //         // If you want to reject the request with a error message,
  //         // you can reject a `DioException` object using `handler.reject(dioError)`.
  //         return handler.next(response);
  //       },
  //       onError: (DioException e, ErrorInterceptorHandler handler) {
  //         // Do something with response error.
  //         // If you want to resolve the request with some custom data,
  //         // you can resolve a `Response` object using `handler.resolve(response)`.
  //         return handler.next(e);
  //       },
  //     ),
  //   );
  // }

  final dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.baseUrl = API.BASE_URL;
          options.connectTimeout = Duration(seconds: 5);
          options.receiveTimeout = Duration(seconds: 3);
          print(options.baseUrl + options.path);
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (e, handler) {
          // return handler.next(e);
          DioException exception = e.copyWith(message: 'Network failed');
          return handler.next(exception);
        },
      ),
    );

  Future<List<Product>> getAllProduct() async {
    // final url = '${API.BASE_URL}${API.PRODUCT}';
    final url = API.PRODUCT;
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return productFromJson(jsonEncode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<String> addProduct(Product product, {File? imageFile}) async {
    final url = API.PRODUCT;

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

    // Response response = await dio.post(url, data: product); // send json
    Response response = await dio.post(url, data: data); // send formdata
    if (response.statusCode == 201) {
      return 'Add Successfully';
    }
    throw Exception('Network failed');
  }

  Future<String> editProduct(Product product, {File? imageFile}) async {
    final url = '${API.PRODUCT}/${product.id}';

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

    Response response = await dio.put(url, data: data); // send formdata
    if (response.statusCode == 200) {
      return 'Edit Successfully';
    }
    throw Exception('Network failed');
  }

  Future<String> deleteProduct(int productId) async {
    final url = '${API.PRODUCT}/$productId';

    Response response = await dio.delete(url);
    if (response.statusCode == 204) {
      return 'Delete Successfully';
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
