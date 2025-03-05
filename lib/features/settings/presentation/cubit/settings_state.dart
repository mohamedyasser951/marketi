part of 'settings_cubit.dart';

enum SettingsStatus { initial, loading, success, error }
extension SettingsStatusX on SettingsStatus {
  bool get isInitial => this == SettingsStatus.initial;
  bool get isLoading => this == SettingsStatus.loading;
  bool get isSuccess => this == SettingsStatus.success;
  bool get isError => this == SettingsStatus.error;
}
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
