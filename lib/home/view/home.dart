import 'package:faketwitter/app/app.dart';
import 'package:faketwitter/create_profile/view/create_profile_page.dart';
import 'package:faketwitter/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faketwitter/create_profile/create_profile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        if (state.hasNoProfile) {
          return const CreateProfilePage();
        }

        if (state.hasProfile) {
          return const HomePage();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
