import 'package:equatable/equatable.dart';
import 'package:marketi/features/settings/data/models/user_profile_model.dart';

enum ProfileStatus { initial, loading, success,update ,error }
extension ProfileStatusX on ProfileStatus {
  bool get isInitial => this == ProfileStatus.initial;
  bool get isLoading => this == ProfileStatus.loading;
  bool get isSuccess => this == ProfileStatus.success;
  bool get isUpdate => this == ProfileStatus.update;
  bool get isError => this == ProfileStatus.error;
}
class ProfileState extends Equatable {
  const ProfileState({
    this.status = ProfileStatus.initial,
    this.userProfileModel,
    this.errorMessage,
  });

  final ProfileStatus status;
  final String? errorMessage;
  final UserProfileModel? userProfileModel;

  @override
  List<Object?> get props => [status, errorMessage, userProfileModel];

  ProfileState copyWith(
      {ProfileStatus? status,
      String? errorMessage,
      UserProfileModel? userProfileModel}) {
    return ProfileState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        userProfileModel: userProfileModel ?? this.userProfileModel);
  }
}
