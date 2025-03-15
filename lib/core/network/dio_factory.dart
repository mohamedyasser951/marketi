import 'package:dio/dio.dart';
import 'package:marketi/core/constants/constants.dart';
import 'package:marketi/core/helper/shared_pref_helper.dart';
import 'package:marketi/core/network/app_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;

  DioFactory._();
  static Dio getDio() {
    Duration timeout = const Duration(seconds: 1500);
    if (dio == null) {
      dio = Dio();
      dio!.options
        ..connectTimeout = timeout
        ..receiveTimeout = timeout;

      addInterceptors();
      addDioHeaders();
      dio!.interceptors.add(AppIntercepters(client: dio!));
    }
    return dio!;
  }

  static void sendTokenAfterUserLogin(String token) {
    dio!.options.headers = {"Authorization": "Bearer $token"};
  }

  static void addDioHeaders() async {
    String? token = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
    dio!.options.headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  static void addInterceptors() {
    dio!.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        error: true));
  }
}
