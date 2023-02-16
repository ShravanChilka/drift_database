import 'package:drift_database/features/auth/bloc/auth_bloc.dart';
import 'package:drift_database/features/auth/bloc/auth_event.dart';
import 'package:drift_database/features/auth/bloc/auth_state.dart';
import 'package:drift_database/features/auth/login_page.dart';
import 'package:drift_database/features/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => AuthBloc(),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthEventGoToRegisterPage) {
              return const RegisterPage();
            } else {
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
