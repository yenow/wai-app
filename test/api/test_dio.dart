

import 'package:dio/dio.dart';

var testDio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.0.2:8080/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {
        "Accept": "application/json",
        "Content-Type" : "application/json; charset=UTF-8",
      }
    )
)..interceptors.add(LogInterceptor(
  responseBody: true,
  requestBody: true,
  requestHeader: true,
  responseHeader: true,
  error: true,
));
