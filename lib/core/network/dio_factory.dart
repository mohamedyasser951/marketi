import 'package:dio/dio.dart';
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
    }
    return dio!;
  }

  static void sendTokenAfterUserLogin(String token) {
    dio!.options.headers = {"Authorization": "Bearer $token"};
  }

  static void addDioHeaders({String? token}) {
    token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQxMTQ3MDAzLCJpYXQiOjE3NDExMTEwMDMsImp0aSI6IjVjZjFhZTMwZDVkZDQ5OTU5YmFjMmM5NTJjYWIxYTMwIiwidXNlcl9pZCI6N30.7WbXUCe4JUOTQ4Y43ldzCHkGji8Y7kFmhKnvyihJW00";
    //incase this User is logged in
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
