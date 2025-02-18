import 'package:marketi/core/network/api_result.dart';
import 'package:marketi/features/Auth/data/models/login_request_body.dart';
import 'package:marketi/features/Auth/data/models/login_response_body.dart';
import 'package:marketi/features/Auth/data/models/signup_request_body.dart';
import 'package:marketi/features/Auth/data/models/signup_response_body.dart';

abstract class AuthRepo {
  Future<ApiResult<LoginResponseBody>> login(
      {required LoginRequestBody loginRequestBody});

  Future<ApiResult<SignupResponseBody>> signup(
      {required SignupRequestBody signupRequestBody});

  Future<ApiResult<void>> logout({required String token});
}
