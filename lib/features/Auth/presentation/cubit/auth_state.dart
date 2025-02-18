part of 'auth_cubit.dart';

enum AuthStatus { initial, loading, loggedIn, loggedOut, error }

class LoginState extends Equatable {
  final AuthStatus status;
  final String? token;
  final String message;

  const LoginState({
    this.status = AuthStatus.initial,
    this.token,
    this.message = '',
  });

  LoginState copyWith({
    AuthStatus? status,
    String? token,
    String? message,
  }) {
    return LoginState(
      status: status ?? this.status,
      token: token ?? this.token,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, token, message];
}
