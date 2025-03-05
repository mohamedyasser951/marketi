import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/settings/data/models/user_profile_model.dart';
import 'package:marketi/features/settings/data/repositories/profile_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final ProfileRepo profileRepo;

  SettingsCubit({required this.profileRepo}) : super(SettingsState());

  Future<void> getProfile() async {
    emit(const SettingsState(status: SettingsStatus.loading));
    final result = await profileRepo.getProfile();

    result.when(
      success: (data) => emit(SettingsState(
          status: SettingsStatus.success, userProfileModel: data)),
      error: (apiError) => emit(SettingsState(
        status: SettingsStatus.error,
        errorMessage: apiError.message,
      )),
    );
  }

  Future<void> updateProfile(
      String name, String email, File? profileImage) async {
    emit(const SettingsState(status: SettingsStatus.loading));
    final result = await profileRepo.updateProfile(name, email, profileImage);

    result.when(
      success: (data) => emit(SettingsState(
          status: SettingsStatus.success, userProfileModel: data)),
      error: (apiError) => emit(SettingsState(
        status: SettingsStatus.error,
        errorMessage: apiError.message,
      )),
    );
  }
}
