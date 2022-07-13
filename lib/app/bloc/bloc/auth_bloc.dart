import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:auth/auth.dart' as auth;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(auth.Auth auth)
      : _auth = auth,
        super(const AuthState()) {
    on<AuthUserChanged>(_onAuthUserChanged);
    on<LogoutRequested>(_onLogoutRequested);

    _userSubscription = auth.user.listen((user) {
      add(AuthUserChanged(user));
    });
  }

  final auth.Auth _auth;
  late final StreamSubscription<auth.User> _userSubscription;

  void _onAuthUserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emit,
  ) async {
    if (event.user.isEmpty) {
      return emit(AuthState.unauthenticated());
    }
    return emit(AuthState.authenticated(event.user));
  }

  void _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    unawaited(_auth.logout());
    return emit(AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
