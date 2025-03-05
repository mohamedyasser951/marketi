part of 'auth_cubit.dart';

enum AuthStatus { initial, loading, loggedIn, loggedOut, error }

extension AuthStatusX on AuthStatus {
  bool get isInitial => this == AuthStatus.initial;
  bool get isLoading => this == AuthStatus.loading;
  bool get isLoggedIn => this == AuthStatus.loggedIn;
  bool get isLoggedOut => this == AuthStatus.loggedOut;
  bool get isError => this == AuthStatus.error;
}

class AuthState extends Equatable {
  final AuthStatus status;
  final String? refreshToken;
  final String? accessToken;

  final String message;

  const AuthState({
    this.status = AuthStatus.initial,
    this.refreshToken,
    this.accessToken,
    this.message = '',
  });

  AuthState copyWith({
    AuthStatus? status,
    String? refreshToken,
    String? accessToken,
    String? message,
  }) {
    return AuthState(
      status: status ?? this.status,
      refreshToken: refreshToken ?? this.refreshToken,
      accessToken: accessToken ?? this.accessToken,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, refreshToken, accessToken, message];
}
