import 'package:flutter/material.dart';
import 'package:drift_database/features/auth/auth_screen.dart';
import 'screens/home_page.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}
