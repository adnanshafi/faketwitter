part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

/// Email Field Change Event
class EmailChanged extends LoginEvent {
  const EmailChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

/// Password Field Change Event
class PasswordChanged extends LoginEvent {
  const PasswordChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

/// Toggle password visibility
class PasswordVisibilityToggled extends LoginEvent {
  const PasswordVisibilityToggled();
}

/// Submit Button Pressed Event
class SubmitPressed extends LoginEvent {
  const SubmitPressed();
}

/// Successful Create Account creation Event
class LoginSuccessful extends LoginEvent {
  const LoginSuccessful();
}

/// Login Account Error from Auth Repo
/// [errorString] : error description
class LoginError extends LoginEvent {
  const LoginError(this.errorString);

  final String errorString;

  @override
  List<Object> get props => [errorString];
}
