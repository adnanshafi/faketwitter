import 'package:faketwitter/app/app.dart';
import 'package:faketwitter_api/faketwitter_api.dart' as f_api;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth/auth.dart' as auth;
import 'package:faketwitter/entry_point/entry_point.dart';
import 'package:faketwitter/onboard/onboard.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'theme.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authRepo,
    required this.api,
  }) : super(key: key);
  final auth.Auth authRepo;
  final f_api.FakeTwitterApi api;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<auth.Auth>(create: (context) => authRepo),
        RepositoryProvider(create: (context) => api),
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
        BlocProvider<DataBloc>(
          create: (context) {
            return DataBloc(
              authBloc: context.read<AuthBloc>(),
              api: context.read<f_api.FakeTwitterApi>(),
            );
          },
        )
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.signOut();
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      routes: {
        EntryPoint.route: (context) => const EntryPoint(),
        OnboardScreen.route: (context) => const OnboardScreen(),
      },
    );
  }
}
