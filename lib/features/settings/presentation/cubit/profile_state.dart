import 'package:equatable/equatable.dart';
import 'package:marketi/features/settings/data/models/user_profile_model.dart';

enum ProfileStatus { initial, loading, success, error }

extension ProfileStatusX on ProfileStatus {
  bool get isInitial => this == ProfileStatus.initial;
  bool get isLoading => this == ProfileStatus.loading;
  bool get isSuccess => this == ProfileStatus.success;
  bool get isError => this == ProfileStatus.error;
}

class ProfileState extends Equatable {
  final ProfileStatus profileStatus;
  final ProfileStatus updateProfileStatus;
  final String? errorMessage;
  final UserProfileModel? userProfileModel;

  const ProfileState({
    this.profileStatus = ProfileStatus.initial,
    this.updateProfileStatus = ProfileStatus.initial,
    this.userProfileModel,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
    profileStatus,
    updateProfileStatus,
    errorMessage,
    userProfileModel,
  ];

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    ProfileStatus? updateProfileStatus,
    String? errorMessage,
    UserProfileModel? userProfileModel,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      updateProfileStatus: updateProfileStatus ?? this.updateProfileStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      userProfileModel: userProfileModel ?? this.userProfileModel,
    );
  }
}
