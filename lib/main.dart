import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secureshiksha_school/UI/skeleton/skeleton.dart';
import 'package:secureshiksha_school/UI/login/login_page.dart';
import 'package:secureshiksha_school/bloc/login/login_bloc.dart';
import 'package:secureshiksha_school/bloc/login/login_event.dart';
import 'package:secureshiksha_school/bloc/login/login_sate.dart';
import 'package:secureshiksha_school/core/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainApp(),
      theme: theme,
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc()
        ..add(
          InitializeEvent(),
        ),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoggedInState) {
            return const Skeleton();
          }
          return const LoginPage();
        },
      ),
    );
  }
}
