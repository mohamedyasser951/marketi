import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/settings/data/repositories/profile_repo.dart';
import 'package:marketi/features/settings/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileState());

  Future<void> getProfile() async {
    emit(const ProfileState(profileStatus: ProfileStatus.loading));
    final result = await profileRepo.getProfile();

    result.when(
      success:
          (data) => emit(
            ProfileState(
              profileStatus: ProfileStatus.success,
              userProfileModel: data,
            ),
          ),
      error:
          (apiError) => emit(
            ProfileState(
              profileStatus: ProfileStatus.error,
              errorMessage: apiError.message,
            ),
          ),
    );
  }

  Future<void> updateProfile(
    String name,
    String email,
    File? profileImage,
  ) async {
    emit(const ProfileState(updateProfileStatus: ProfileStatus.loading));
    final result = await profileRepo.updateProfile(name, email, profileImage);

    result.when(
      success:
          (data) => emit(
            ProfileState(
              updateProfileStatus: ProfileStatus.success,
              userProfileModel: data,
            ),
          ),
      error:
          (apiError) => emit(
            ProfileState(
              updateProfileStatus: ProfileStatus.error,
              errorMessage: apiError.message,
            ),
          ),
    );
  }
}
