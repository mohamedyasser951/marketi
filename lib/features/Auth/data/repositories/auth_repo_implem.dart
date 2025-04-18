import 'package:marketi/core/constants/constants.dart';
import 'package:marketi/core/helper/shared_pref_helper.dart';
import 'package:marketi/core/network/api_error_handler.dart';
import 'package:marketi/core/network/api_result.dart';
import 'package:marketi/features/Auth/data/datasources/remote/auth_api_service.dart';
import 'package:marketi/features/Auth/data/models/login_request_body.dart';
import 'package:marketi/features/Auth/data/models/login_response_body.dart';
import 'package:marketi/features/Auth/data/models/signup_request_body.dart';
import 'package:marketi/features/Auth/data/models/signup_response_body.dart';
import 'package:marketi/features/Auth/data/repositories/auth_repo.dart';

class AuthRepoImplem extends AuthRepo {
  AuthApiService authApiService;
  AuthRepoImplem({required this.authApiService});

  @override
  Future<ApiResult<LoginResponseBody>> login({
    required LoginRequestBody loginRequestBody,
  }) async {
    try {
      return ApiResult.success(await authApiService.login(loginRequestBody));
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<SignupResponseBody>> signup({
    required SignupRequestBody signupRequestBody,
  }) async {
    try {
      return ApiResult.success(await authApiService.signup(signupRequestBody));
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<void>> logout() async {
    try {
      final token = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.userToken,
      );
      
      return ApiResult.success(await authApiService.logout("Bearer $token"));
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }
}
