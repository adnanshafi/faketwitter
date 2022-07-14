part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthUserChanged extends AuthEvent {
  const AuthUserChanged(this.user);
  final auth.User user;

  @override
  List<Object> get props => [user];
}

class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}
