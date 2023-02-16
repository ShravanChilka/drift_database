import 'package:drift_database/features/auth/bloc/auth_bloc.dart';
import 'package:drift_database/features/auth/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'New User,',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'Create your account',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          TextFormField(
            controller: _emailController,
            validator: (value) => value ??= 'This field cannot be empty',
          ),
          TextFormField(
            controller: _passwordController,
            validator: (value) => value ??= 'This field cannot be empty',
          ),
          const SizedBox(height: 16),
          Center(
            child: FilledButton(
              onPressed: () => context.read<AuthBloc>().add(
                    AuthEventLogin(
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  ),
              child: const Text('Login'),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already registered, '),
              TextButton(
                onPressed: () => context.read<AuthBloc>().add(
                      const AuthEventGoToLoginPage(),
                    ),
                child: const Text('Login'),
              )
            ],
          )
        ],
      ),
    );
  }
}
