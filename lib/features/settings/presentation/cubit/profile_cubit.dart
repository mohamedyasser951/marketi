import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/settings/data/repositories/profile_repo.dart';
import 'package:marketi/features/settings/presentation/cubit/profile_state.dart';



class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileState());

  Future<void> getProfile() async {
    emit(const ProfileState(status: ProfileStatus.loading));
    final result = await profileRepo.getProfile();

    result.when(
      success: (data) => emit(ProfileState(
          status: ProfileStatus.success, userProfileModel: data)),
      error: (apiError) => emit(ProfileState(
        status: ProfileStatus.error,
        errorMessage: apiError.message,
      )),
    );
  }

  Future<void> updateProfile(
      String name, String email, File? profileImage) async {
    emit(const ProfileState(status: ProfileStatus.loading));
    final result = await profileRepo.updateProfile(name, email, profileImage);

    result.when(
      success: (data) => emit(ProfileState(
          status: ProfileStatus.update, userProfileModel: data)),
      error: (apiError) => emit(ProfileState(
        status: ProfileStatus.error,
        errorMessage: apiError.message,
      )),
    );
  }
}
