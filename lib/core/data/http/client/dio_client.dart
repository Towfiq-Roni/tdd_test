import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tdd_test/app/configs/app_config.dart';

import '../interceptors/api_provider_token_interceptor.dart';

class DioClient {
  static final _dioClient = DioClient._internal();

  DioClient._internal();

  Dio dio = Dio(
    BaseOptions(
      baseUrl: appConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: <String, String>{
        'Content-Type': 'application/json',
        // 'Access-Control-Allow-Origin': '*',
        // 'Access-Control-Allow-Credentials': 'true',
        // 'Access-Control-Allow-Headers': 'Content-Type',
        // 'Accept-Language': 'en',
      },
    ),
  );

  factory DioClient() {
    return _dioClient;
  }

  setClient() {
    debugPrint('=================setClient====================');
    dio
      ..interceptors.add(ApiProviderTokenInterceptor())
      ..interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
      ));
  }

  getClient() {
    return dio;
  }
}

final DioClient dioClient = DioClient();
