import 'package:faketwitter/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth/auth.dart' as auth;
import 'package:faketwitter/entry_point/entry_point.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authRepo,
  }) : super(key: key);
  final auth.Auth authRepo;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<auth.Auth>(create: (context) => authRepo),
      ],
      child: const AppBloc(),
    );
  }
}

class AppBloc extends StatelessWidget {
  const AppBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            context.read<auth.Auth>(),
          ),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        EntryPoint.route: (context) => const EntryPoint(),
      },
    );
  }
}
