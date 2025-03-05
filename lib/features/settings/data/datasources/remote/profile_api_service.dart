import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:marketi/features/settings/data/models/multi_part_wrapper.dart';
import 'package:marketi/features/settings/data/models/user_profile_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/network/api_constant.dart';
part "profile_api_service.g.dart";

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio) => _ProfileApiService(dio);

  @GET(ApiConstants.userProfile)
  Future<UserProfileModel> getProfile();


  @MultiPart()
  @PUT(ApiConstants.userProfile)
  Future<UserProfileModel> updateProfile(
    @Part(name: "name") String name,
    @Part(name: "email") String email,
    @Part(name: "profile_image") MultipartFileWrapper? profileImage, // Updated type
  );
}
