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
    String? token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQxMjA0OTQ3LCJpYXQiOjE3NDExNjg5NDcsImp0aSI6ImYwNGM0YzYxZWI3NzQxM2ZhYTMzN2M0NGFmNWYxYmZjIiwidXNlcl9pZCI6N30.iJIF9B1nxB9T8FgOzhJ0Lrt10U9j504vxiA-K_ryKog";
    print(token);
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
