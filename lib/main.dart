import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faketwitter/app/view/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:auth/auth.dart' as auth;
import 'package:faketwitter_api/faketwitter_api.dart' as f_api;
import 'package:mem_cache/mem_cache.dart';
import 'firebase_options.dart';

void main() async {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      final auth.Auth _auth = auth.Auth(
        auth: FirebaseAuth.instance,
        cache: MemCache(),
      );

      final _api = f_api.FakeTwitterApi(
        FirebaseFirestore.instance,
        MemCache(),
      );

      runApp(
        App(
          authRepo: _auth,
          api: _api,
        ),
      );
    },
  );
}
