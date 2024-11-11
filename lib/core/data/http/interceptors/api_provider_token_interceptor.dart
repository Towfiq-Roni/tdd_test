import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiProviderTokenInterceptor extends QueuedInterceptor {
  ApiProviderTokenInterceptor();

  int retry = 1;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // res.fold((l) => null, (r) {
    //   options.headers.addAll({'Accept-Language': r.locale ?? 'en'});
    // });
    if (options.extra['isAuth'] == true) {
      options.extra.clear();
      String accessToken = "await authCacheDataSource.getAccessToken()";
      if (accessToken.isNotEmpty) {
        options.headers.addAll({
          'Authorization': 'Bearer $accessToken',
          'accept': 'application/json',
        });
      } else {
        // serviceLocator<LogoutService>().doLogout();
      }

      debugPrint("__________________->>>${options.headers}");

      handler.next(options);
    } else {
      handler.next(options);
    }
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      if (err.response == null) {
        return handler.next(err);
      }
      if ((err.response!.statusCode == 401)) {
        final options = err.requestOptions;

        // if (retry >= 0) {
        //   --retry;
        //   // refresh the api then call again
        //   AuthRepository authRepository = serviceLocator<AuthRepository>();
        //   var result = await authRepository.refreshToken();
        //   if (result.isLeft()) {
        //     ++retry;
        //     Fluttertoast.showToast(
        //         msg: NavigationService.navigatorKey.currentContext!.resources
        //                 .strings?.sessionExpired ??
        //             "");
        //     await cleanCache();
        //     return handler.reject(err);
        //   }
        //   String? accessToken = await authCacheDataSource.getAccessToken();
        //   if (accessToken.isEmpty) {
        //     ++retry;
        //     await cleanCache();
        //     return handler.reject(err);
        //   }
        //   options.headers.addAll({'Authorization': 'Bearer $accessToken'});
        //
        //   AuthHttpDataSource authHttpDataSource =
        //       serviceLocator<AuthHttpDataSource>();
        //   options.extra.clear();
        //   Response res = await authHttpDataSource.fetchOptions(options);
        //   ++retry;
        //   return handler.resolve(res);
        // } else {
        //   await cleanCache();
        //   return handler.next(err);
        // }
      } else {
        return handler.next(err);
      }
    } on Exception catch (e) {
      // await cleanCache();
      return handler.next(err);
    }
  }

  Future<void> cleanCache() async {
    //call logout service then clear the cache
    // serviceLocator<LogoutService>().doLogout();
  }
}
