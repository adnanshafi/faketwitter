part of 'auth_bloc.dart';

enum AuthStatus {
  unknown,
  unauthenticated,
  authenticated,
}

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.unknown,
    this.user = auth.User.empty,
  });

  factory AuthState.authenticated(auth.User user) =>
      AuthState(status: AuthStatus.authenticated, user: user);
  factory AuthState.unauthenticated() =>
      const AuthState(status: AuthStatus.unauthenticated);

  /// User porovided from auth repo
  final auth.User user;

  /// Current Auth Status
  final AuthStatus status;

  copyWith({
    AuthStatus? status,
    auth.User? user,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [user, status];
}

extension AuthStateX on AuthState {
  bool get isUnknown => status == AuthStatus.unknown;
  bool get isAuthenticated =>
      status == AuthStatus.authenticated && !user.isEmpty;
  bool get isUnauthenticated =>
      status == AuthStatus.unauthenticated && user.isEmpty;
}
