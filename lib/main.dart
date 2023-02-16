import 'package:drift_database/repository/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'application.dart';

void main() {
  runApp(
    RepositoryProvider(
      create: (_) => MyDatabase(),
      child: const Application(),
    ),
  );
}
