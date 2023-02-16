import 'package:drift_database/repository/database.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthState {
  final bool isLoading;
  const AuthState({
    this.isLoading = false,
  });
}

@immutable
class AuthStateLoggedIn extends AuthState {
  final User user;
  const AuthStateLoggedIn({
    super.isLoading,
    required this.user,
  });
}

@immutable
class AuthStateLoginPage extends AuthState {
  const AuthStateLoginPage({
    super.isLoading,
  });
}

@immutable
class AuthStateRegisterPage extends AuthState {
  const AuthStateRegisterPage({
    super.isLoading,
  });
}
