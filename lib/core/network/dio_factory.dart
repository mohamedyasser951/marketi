import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;

  DioFactory._();
  static Dio getDio() {
    Duration timeout = const Duration(seconds: 60);
    if (dio == null) {
      dio = Dio();
      dio!.options
        ..connectTimeout = timeout
        ..receiveTimeout = timeout;
      addInterceptors();
    }
    return dio!;
  }

  static void addInterceptors() {
    dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      error: true
    ));
  }
}
