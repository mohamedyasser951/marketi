part of 'favorite_cubit.dart';

enum FavoriteStatus { initial, loading, success, failure }

extension FavoriteStatusX on FavoriteStatus {
  bool get isInitial => this == FavoriteStatus.initial;
  bool get isLoading => this == FavoriteStatus.loading;
  bool get isSuccess => this == FavoriteStatus.success;
  bool get isFailure => this == FavoriteStatus.failure;
}

class FavoriteState extends Equatable {
  final FavoriteStatus status;
  final List<FavoriteModel> favorites;
  final String errorMessage;

  const FavoriteState({
    this.favorites = const [],
    this.status = FavoriteStatus.initial,
    this.errorMessage = '',
  });

  FavoriteState copyWith({
    List<FavoriteModel>? favorites,
    FavoriteStatus? status,
    String? errorMessage,
  }) {
    return FavoriteState(
      favorites: favorites ?? this.favorites,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [favorites, status];
}
