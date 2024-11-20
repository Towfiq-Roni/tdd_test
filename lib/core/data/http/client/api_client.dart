import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../domain/error/exceptions.dart';
import '../../../domain/error/failure.dart';

enum HTTPType { get, post, put, delete, patch, download }

abstract class ApiClient {
  dynamic invokeApi(String path, HTTPType method,
      {Map<String, dynamic>? data,
      bool? isAuth,
      bool? isRefresh,
      bool isFile = false,
      Map<String, dynamic>? queryParams});
}

class ApiClientImpl extends ApiClient {
  final Dio _dio;

  ApiClientImpl(this._dio);

  @override
  dynamic invokeApi(String path, HTTPType method,
      {Map<String, dynamic>? data,
      bool? isAuth,
      bool? isXApi,
      bool? isPaymentXApi,
      bool? isRefresh,
      bool isFile = false,
      Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await _dio.request(
        path,
        queryParameters: queryParams,
        data: isFile != false
            ? data != null
                ? FormData.fromMap(data)
                : Map<String, dynamic>
            : data,
        options: Options(
            method: method.name.toUpperCase().toString(),
            extra: <String, dynamic>{
              'isAuth': isAuth ?? false,
            }),
      );
      return response.data;
    } on DioException catch (error) {
      APIFailure apiFailure = _handleError(error);
      return Left(apiFailure);
    } on Exception catch (e) {
      return const Left(APIFailure(message: "exception", statusCode: 800));
    }
  }

  Future<Response<dynamic>> fetch(RequestOptions options) =>
      _dio.fetch(options);

  APIFailure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return APIFailure.fromException(const APIException(
            message: {"message": "timeout"}, statusCode: 600));
      case DioExceptionType.receiveTimeout:
        return APIFailure.fromException(const APIException(
            message: {"message": "timeout"}, statusCode: 600));

      case DioExceptionType.badResponse:
        int? statusCode = error.response?.statusCode;

        if (statusCode == null && error.response!.data != null) {
          return APIFailure.fromException(
              APIException(message: error.response?.data, statusCode: 400));
        }
        if (statusCode! >= 500 && statusCode < 600) {
          return APIFailure.fromException(APIException(
              message: const {"message": "serverError"},
              statusCode: statusCode));
        }

        return APIFailure.fromException(APIException(
            message: error.response?.data,
            statusCode: error.response?.statusCode ?? 400));
      case DioExceptionType.cancel:
        return APIFailure.fromException(const APIException(
            message: {'message': "cancel"}, statusCode: 700));
      case DioExceptionType.connectionError:
        return APIFailure.fromException(const APIException(
            message: {"message": "notConnected"}, statusCode: 800));
      case DioExceptionType.unknown:
        return APIFailure.fromException(const APIException(
            message: {'message': "unknown"}, statusCode: 600));
      case DioExceptionType.sendTimeout:
        return APIFailure.fromException(const APIException(
            message: {"message": "timeout"}, statusCode: 600));
      case DioExceptionType.badCertificate:
        return APIFailure.fromException(const APIException(
            message: {"message": "Bad Certificate"}, statusCode: 900));
    }
  }
}
