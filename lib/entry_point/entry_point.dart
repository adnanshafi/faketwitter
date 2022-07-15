import 'package:faketwitter/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faketwitter/onboard/onboard.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);
  static const String route = '/';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.isUnknown) {
          return Text('black');
        }
        if (state.isAuthenticated) {
          return Text('authenticated');
        }
        if (state.isUnauthenticated) {
          return const OnboardScreen();
        }
        return Container();
      },
    );
  }
}
