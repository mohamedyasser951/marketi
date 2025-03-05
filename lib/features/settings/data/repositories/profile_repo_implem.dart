import 'dart:io';
import 'package:marketi/features/settings/data/models/multi_part_wrapper.dart';
import 'package:path/path.dart';

import 'package:dio/dio.dart';
import 'package:marketi/core/network/api_error_handler.dart';
import 'package:marketi/core/network/api_result.dart';
import 'package:marketi/features/settings/data/datasources/remote/profile_api_service.dart';
import 'package:marketi/features/settings/data/models/user_profile_model.dart';
import 'package:marketi/features/settings/data/repositories/profile_repo.dart';

class ProfileRepoImplem extends ProfileRepo {
  final ProfileApiService profileApiService;

  ProfileRepoImplem({required this.profileApiService});

  @override
  Future<ApiResult<UserProfileModel>> getProfile() async {
    try {
      return ApiResult.success(await profileApiService.getProfile());
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<UserProfileModel>> updateProfile(
      String name, String email, File? profileImage) async {
    MultipartFileWrapper? imageMultipart;
    if (profileImage != null) {
      final file = await MultipartFile.fromFile(
        profileImage.path,
        filename: basename(profileImage.path),
      );
      imageMultipart = MultipartFileWrapper(file);
    }

    try {
      return ApiResult.success(
          await profileApiService.updateProfile(name, email, imageMultipart));
    } catch (e) {
      return ApiResult.error(ErrorHandler.handle(e));
    }
  }
}
