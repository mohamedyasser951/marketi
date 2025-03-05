part of 'settings_cubit.dart';

enum SettingsStatus { initial, loading, success, error }

class SettingsState extends Equatable {
  const SettingsState({
    this.status = SettingsStatus.initial,
    this.userProfileModel,
    this.errorMessage,
  });

  final SettingsStatus status;
  final String? errorMessage;
  final UserProfileModel? userProfileModel;

  @override
  List<Object?> get props => [status, errorMessage];

  SettingsState copyWith(
      {SettingsStatus? status,
      String? errorMessage,
      UserProfileModel? userProfileModel}) {
    return SettingsState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        userProfileModel: userProfileModel ?? this.userProfileModel);
  }
}
