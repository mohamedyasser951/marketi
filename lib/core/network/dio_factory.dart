import 'package:dio/dio.dart';
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
    String? token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQxMjMyNTg1LCJpYXQiOjE3NDExOTY1ODUsImp0aSI6ImUyMzNjZmE2YzVkMjQyYjE5YjdlNmNmNTZmMzM1MjMyIiwidXNlcl9pZCI6N30.uTh6i6mnBD3q-OMpY8jfDL3dLcr_h1K5DxFvB871uDc";
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
