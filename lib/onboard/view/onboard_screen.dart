import 'package:faketwitter/auth_page/create_account/view/create_account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faketwitter/intro_pages/intro_pages.dart';
import 'package:faketwitter/onboard/onboard.dart';
import 'package:faketwitter/auth_page/auth_page.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);
  static const String route = '/intro';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardCubit>(
      create: (context) => OnboardCubit(),
      child: BlocBuilder<OnboardCubit, OnboardState>(
        buildWhen: (p, c) => p.pageType != c.pageType,
        builder: ((context, state) {
          switch (state.pageType) {
            case PageType.intro:
              return const IntroPages();
            case PageType.createAccount:
              return const CreateAccountPage();
            case PageType.login:
              // return Login Page
              break;
          }
          return Container();
        }),
      ),
    );
  }
}

class _IntroPageHolder extends StatelessWidget {
  const _IntroPageHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(),
      bottomNavigationBar: Container(
        height: 30,
        width: 50,
        color: Colors.green,
      ),
    );
  }
}
