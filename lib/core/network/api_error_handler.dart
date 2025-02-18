// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ErrorHandler {

  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      return _handleError(error);
    }
     else {
      return ApiErrorModel(
          message: "An unexpected error occurred. Please try again.");
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ApiErrorModel(
          message:
              "Connection timeout. Please check your internet connection and try again.");
    case DioExceptionType.sendTimeout:
      return ApiErrorModel(
          message: "Unable to send the request. Please try again.");
    case DioExceptionType.receiveTimeout:
      return ApiErrorModel(
          message:
              "The server took too long to respond. Please try again later.");
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } 
      else {
        return ApiErrorModel(
            message: "An unexpected error occurred. Please try again.");
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return ApiErrorModel(
            message: "An unknown error occurred. Please contact support.");
      }
    case DioExceptionType.cancel:
      return ApiErrorModel(
          message: "The request was canceled. Please try again.");
    case DioExceptionType.connectionError:
      return ApiErrorModel(
          message:
              "Unable to connect to the server. Please check your network connection.");
    case DioExceptionType.badCertificate:
      return ApiErrorModel(
          message: "A certificate error occurred. Please contact support.");
  }
}