import 'dart:developer';
import 'package:drift_database/repository/database.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  Stream<List<User>> users = const Stream.empty();

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
    final database = context.read<MyDatabase>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Enter email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Enter password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        final result =
                            await database.into(database.users).insert(
                                  UsersCompanion.insert(
                                    name: _nameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    createdAt: DateTime.now(),
                                    updatedAt: DateTime.now(),
                                  ),
                                );
                        log('Create $result');
                      }
                    },
                    child: const Text('Create'),
                  ),
                  FilledButton(
                    onPressed: () {},
                    child: const Text('Read'),
                  ),
                  FilledButton(
                    onPressed: () async {
                      final result = await (database.update(database.users)
                            ..where(
                                (t) => t.email.equals(_emailController.text)))
                          .write(
                        const UsersCompanion().copyWith(
                          name: drift.Value(_nameController.text),
                          password: drift.Value(_passwordController.text),
                        ),
                      );
                      log('Update $result');
                    },
                    child: const Text('Update'),
                  ),
                  FilledButton(
                    onPressed: () async {
                      final result = await database.users.deleteWhere(
                          (t) => t.email.equals(_emailController.text));
                      log('Delete $result');
                    },
                    child: const Text('Delete'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              StreamBuilder<List<User>>(
                  stream: database.select(database.users).watch(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final users = snapshot.data!;
                      return Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Users',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  (snapshot.data?.length ?? '').toString(),
                                ),
                              ],
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: users.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .primaryContainer,
                                      child: Text(users[index].id.toString()),
                                    ),
                                    title: Text(users[index].name),
                                    subtitle: Text(users[index].email),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return const Center(
                        child: Text('No records found!'),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
