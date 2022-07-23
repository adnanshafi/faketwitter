import 'package:faketwitter/app/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataBloc, DataState>(
      builder: (context, state) {
        if (state.hasNoProfile) {
          return Scaffold(
            body: Center(
              child: TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text('ola'),
              ),
            ),
          );
        }

        if (state.hasProfile) {
          return Text('Profile');
        }
        return Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () {
                print(state.userData.toJson());
              },
              child: Text('ola'),
            ),
          ),
        );
      },
    );
  }
}
