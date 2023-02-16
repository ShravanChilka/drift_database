import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
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
            'Welcome Back,',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'Login to continue',
            style: Theme.of(context).textTheme.titleMedium,
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
              onPressed: () {},
              child: const Text('Login'),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Not registered yet, '),
              TextButton(
                onPressed: () {},
                child: const Text('Register'),
              )
            ],
          )
        ],
      ),
    );
  }
}
