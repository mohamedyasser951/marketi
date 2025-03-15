import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:marketi/core/constants/constants.dart';
import 'package:marketi/core/helper/shared_pref_helper.dart';
import 'package:marketi/core/network/api_constant.dart';

class AppIntercepters extends Interceptor {
  final Dio client;
  AppIntercepters({required this.client});

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      debugPrint("⚠️ Access Token منتهي، يتم تحديثه الآن....");
      String? refreshTokenText = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userRefreshToken,
      );

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
    return client.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<bool> refreshToken() async {
    debugPrint("🔄 Refreshing Access Token...");
    String? refreshToken = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.userRefreshToken,
    );
    final response = await client.post(
      ApiConstants.baseUrl + ApiConstants.tokenRefresh,
      data: {'refresh': refreshToken},
    );
    final String accessToken = response.data['access'];

    if (accessToken.isNotEmpty) {
      debugPrint("✅ تم تحديث التوكن بنجاح!");

      client.options.headers['Authorization'] = 'Bearer $accessToken';

      await SharedPrefHelper.setSecuredString(
        SharedPrefKeys.userToken,
        accessToken,
      );
      return true;
    } else {
      return false;
    }
  }
}

/*
import 'package:dio/dio.dart';

final dio = Dio();
String? accessToken = "INITIAL_ACCESS_TOKEN";
String? refreshToken = "YOUR_REFRESH_TOKEN";

Future<void> refreshAccessToken() async {
  try {
    print("🔄 Refreshing Access Token...");

    final response = await Dio().post(
      'https://api.example.com/refresh',
      data: {'refresh_token': refreshToken},
    );

    accessToken = response.data['access_token']; // ✅ تحديث Token الجديد
    print("✅ تم تحديث التوكن بنجاح!");
  } catch (e) {
    print("❌ فشل في تحديد المستخدم، يجب تسجيل خروج المستخدم.");
    throw Exception("Failed to refresh token");
  }
}

// 🔥 Interceptor لإضافة التوكن والتعامل مع انتهاء صلاحيته
dio.interceptors.add(InterceptorsWrapper(
  onRequest: (options, handler) {
    options.headers['Authorization'] = 'Bearer $accessToken';
    return handler.next(options); // 📨 إرسال الطلب
  },
  onError: (DioException e, handler) async {
    if (e.response?.statusCode == 401) { // 🔴 Unauthorized (انتهت صلاحية التوكن)
      print("⚠️ Access Token منتهي، يتم تحديثه الآن....");
      try {
        await refreshAccessToken(); // 🔄 تحديث التوكن
        options.headers['Authorization'] = 'Bearer $accessToken'; // ✅ إعادة الطلب بالتوكن الجديد
        final retryResponse = await dio.fetch(e.requestOptions); // 🔁 إعادة المحاولة
        return handler.resolve(retryResponse);
      } catch (refreshError) {
        return handler.next(e); // ❌ فشل التحديث، يتم تسجيل الخروج
      }
    }
    return handler.next(e);
  },
)));

 */
