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
    //incase this User is logged in
    token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQwNTE5NDY5LCJpYXQiOjE3NDA1MTkxNjksImp0aSI6ImI2ODg1MGI5ZmJmNDRiMTc5OGE0NGZkYjUwZWY1MmJjIiwidXNlcl9pZCI6N30.rzq6bHVO-fvedXwjOMpOIILYmAN36ZQEf61Rq0O9Jic";
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
