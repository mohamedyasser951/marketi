import 'dart:io';

import 'package:marketi/core/network/api_result.dart';
import 'package:marketi/features/settings/data/models/user_profile_model.dart';

abstract class ProfileRepo {
  Future<ApiResult<UserProfileModel>> getProfile();
  Future<ApiResult<UserProfileModel>> updateProfile(
    String name,
    String email,
    File? profileImage, // Optional image upload
  );
}
