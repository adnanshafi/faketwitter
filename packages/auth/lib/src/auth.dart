import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:mem_cache/mem_cache.dart';
import 'user.dart';

class Auth {
  const Auth({
    required firebase_auth.FirebaseAuth auth,
    required MemCache cache,
  })  : _auth = auth,
        _cache = cache;

  static const String _key = '_user_key_';

  /// Instance of FirebaseAuth
  final firebase_auth.FirebaseAuth _auth;

  /// Internal Instance of Cache to cache data
  final MemCache _cache;

  /// Get User Stream
  ///
  /// if (hasAuth) return User with UID
  /// else return empty User
  Stream<User> get user {
    return _auth.authStateChanges().map(
      (user) {
        if (user == null) {
          return User.empty;
        }
        return User(uid: user.uid);
      },
    );
  }

  /// Create Account With Email Password
  /// [email] : email
  /// [password] : password
  /// [onFailure] : Callback For failure
  /// [onSuccess] : Callback if Success
  Future<void> createAccountWithEmailPassword({
    required String email,
    required String password,
    required Function(String message) onFailure,
    required Function() onSuccess,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on firebase_auth.FirebaseAuthException catch (e) {
      onFailure(e.friendlyMessage);
    } on Exception {
      onFailure('An Unknown Error Occured');
    }
  }

  /// Sign In With Email Password
  /// [email] : email
  /// [password] : password
  /// [onFailure] : Callback For failure
  /// [onSuccess] : Callback if Success
  Future<void> signInEmailPassword({
    required String email,
    required String password,
    required Function(String message) onFailure,
    required Function() onSuccess,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      onFailure(e.friendlyMessage);
    } on Exception {
      onFailure('An Unknown Error Occured');
    }
  }

  Future<void> logout() async {
    return _auth.signOut();
  }
}

extension on firebase_auth.FirebaseAuthException {
  String get friendlyMessage {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already in use';
      case 'invalid-email':
        return 'Invalid Email Entered';
      case 'operation-not-allowed':
        return 'This operation is not allowed';
      case 'weak-password':
        return 'The password you have chosen is too weak';
      case 'user-disabled':
        return 'Your account has been disabled';
      case 'user-not-found':
        return 'No user account found for the email';
      case 'wrong-password':
        return 'The password you entered is invalid';
      default:
        return 'Something went wrong';
    }
  }
}
