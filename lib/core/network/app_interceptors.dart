import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:marketi/core/constants/constants.dart';
import 'package:marketi/core/helper/shared_pref_helper.dart';
import 'package:marketi/core/network/api_constant.dart';
import 'package:marketi/core/utils/common.dart';
import 'package:marketi/features/Auth/data/models/refresh_token_response.dart';

class AppIntercepters extends Interceptor {
  final Dio client;
  // final LangLocalDataSource langLocalDataSource;
  // final AuthLocalDataSource authLocalDataSource;
  AppIntercepters(
      {
      // required this.langLocalDataSource,
      // required this.authLocalDataSource,
      required this.client});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers[HttpHeaders.acceptHeader] = ContentType.json;
    // String lang = await langLocalDataSource.getSavedLang();
    // options.headers[AppStrings.lang] = lang;
    // UserModel? authenticatedUser =
    //     await authLocalDataSource.getSavedLoginCredentials();
    // if (authenticatedUser != null) {
    //   options.headers[HttpHeaders.authorizationHeader] =
    //       AppStrings.bearer + authenticatedUser.token!;
    // }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if (err.response?.statusCode == 401) {
      String? refreshTokenText =
          SharedPrefHelper.getSecuredString(SharedPrefKeys.userRefreshToken);

      if (refreshTokenText != null) {
        if (await refreshToken()) {
          return handler.resolve(await retry(err.requestOptions));
        }
      }
    }
    super.onError(err, handler);
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return client.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  Future<bool> refreshToken() async {
    String? refreshToken =
        SharedPrefHelper.getSecuredString(SharedPrefKeys.userRefreshToken);
    final response = await client.post(ApiConstants.tokenRefresh, data: {
      'refresh': refreshToken,
    });
    final jsonResponse = Commons.decodeJson(response);
    RefreshTokenResponse refreshTokenResponse =
        RefreshTokenResponse.fromJson(jsonResponse);
    if (refreshTokenResponse.accessToken.isNotEmpty) {
      // authenticatedUser.token = baseResponse.data["token"];
      // authenticatedUser.refreshToken = baseResponse.data["refreshToken"];
      // authLocalDataSource.saveLoginCredentials(userModel: authenticatedUser);
      SharedPrefHelper.setSecuredString(
          SharedPrefKeys.userToken, refreshTokenResponse.accessToken);

      return true;
    } else {
      return false;
    }
  }
}
