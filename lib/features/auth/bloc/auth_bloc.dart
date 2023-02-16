import 'dart:async';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthStateLoginPage()) {
    on<AuthEventGoToLoginPage>(_goToLoginPageEvent);
    on<AuthEventGoToRegisterPage>(_goToRegisterPageEvent);
    on<AuthEventLogin>(_loginEvent);
    on<AuthEventRegister>(_registerEvent);
    on<AuthEventLogOut>(_logOutEvent);
    on<AuthEventDeleteAccount>(_deleteAccount);
  }

  FutureOr<void> _goToLoginPageEvent(
    AuthEventGoToLoginPage event,
    Emitter<AuthState> emit,
  ) {}

  FutureOr<void> _goToRegisterPageEvent(
    AuthEventGoToRegisterPage event,
    Emitter<AuthState> emit,
  ) {}

  FutureOr<void> _loginEvent(
    AuthEventLogin event,
    Emitter<AuthState> emit,
  ) {}

  FutureOr<void> _registerEvent(
    AuthEventRegister event,
    Emitter<AuthState> emit,
  ) {}

  FutureOr<void> _logOutEvent(
    AuthEventLogOut event,
    Emitter<AuthState> emit,
  ) {}

  FutureOr<void> _deleteAccount(
    AuthEventDeleteAccount event,
    Emitter<AuthState> emit,
  ) {}
}
