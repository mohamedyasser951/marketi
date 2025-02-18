import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/Auth/data/models/login_request_body.dart';
import 'package:marketi/features/Auth/data/models/signup_request_body.dart';

import 'package:marketi/features/Auth/data/repositories/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepo authRepo;
  AuthCubit({required this.authRepo})
      : super(const AuthState(status: AuthStatus.initial));

  void login({required String email, required String password}) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await authRepo.login(
        loginRequestBody: LoginRequestBody(email: email, password: password));
    result.when(
      success: (data) {
        emit(state.copyWith(status: AuthStatus.loggedIn, token: data.access));
      },
      error: (message) {
        emit(state.copyWith(status: AuthStatus.error, message: message));
      },
    );
  }

  void signup(SignupRequestBody signupRequestBody) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await authRepo.signup(signupRequestBody: signupRequestBody);
    result.when(
      success: (data) {
        emit(state.copyWith(
            status: AuthStatus.loggedIn, token: data.accessToken));
      },
      error: (message) {
        emit(state.copyWith(status: AuthStatus.error, message: message));
      },
    );
  }

  void logout() async {
    final result = await authRepo.logout(token: state.token!);
    result.when(
      success: (data) {
        emit(state.copyWith(status: AuthStatus.loggedOut));
      },
      error: (message) {
        emit(state.copyWith(status: AuthStatus.error, message: message));
      },
    );
  }
}
