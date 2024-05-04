import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioInterceptors {
  static final Dio _dio = Dio();

  static Dio get dio => _dio;

  static void setupInterceptors() {
    _dio.options.baseUrl = 'https://example.com/api'; // Your base URL
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Modify request options
          debugPrint(
              "Request: ${options.method} ${options.baseUrl}${options.path}");
          return handler.next(options); // continue
        },
        onResponse: (response, handler) {
          // Do something with the response data
          return handler.next(response); // continue
        },
        onError: (DioException e, handler) {
          // Do something with the error
          return handler.next(e); // continue
        },
      ),
    );
  }
}
