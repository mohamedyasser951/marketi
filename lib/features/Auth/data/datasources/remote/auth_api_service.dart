import 'package:dio/dio.dart';
import 'package:marketi/core/network/api_constant.dart';
import 'package:marketi/features/Auth/data/models/login_request_body.dart';
import 'package:marketi/features/Auth/data/models/login_response_body.dart';
import 'package:marketi/features/Auth/data/models/signup_request_body.dart';
import 'package:marketi/features/Auth/data/models/signup_response_body.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signUp)
  Future<SignupResponseBody> signup(
      @Body() SignupRequestBody signupRequestBody);

  @POST(ApiConstants.logout)
  Future<void> logout(@Header("Authorization") String token);
}
