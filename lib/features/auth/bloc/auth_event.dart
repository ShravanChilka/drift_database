import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

@immutable
class AuthEventGoToLoginPage extends AuthEvent {
  const AuthEventGoToLoginPage();
}

@immutable
class AuthEventGoToRegisterPage extends AuthEvent {
  const AuthEventGoToRegisterPage();
}

@immutable
class AuthEventLogin extends AuthEvent {
  final String email;
  final String password;
  const AuthEventLogin({
    required this.email,
    required this.password,
  });
}

@immutable
class AuthEventRegister extends AuthEvent {
  final String name;
  final String email;
  final String password;
  const AuthEventRegister({
    required this.name,
    required this.email,
    required this.password,
  });
}

@immutable
class AuthEventLogOut extends AuthEvent {
  const AuthEventLogOut();
}

@immutable
class AuthEventDeleteAccount extends AuthEvent {
  const AuthEventDeleteAccount();
}
