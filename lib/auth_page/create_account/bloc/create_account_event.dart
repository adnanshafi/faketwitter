part of 'create_account_bloc.dart';

abstract class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();

  @override
  List<Object> get props => [];
}

/// Email Field Change Event
class EmailChanged extends CreateAccountEvent {
  const EmailChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

/// Password Field Change Event
class PasswordChanged extends CreateAccountEvent {
  const PasswordChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

/// Password Confirm Field Change Event
class PasswordConfirmChanged extends CreateAccountEvent {
  const PasswordConfirmChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

/// Toggle password visibility
class PasswordVisibilityToggled extends CreateAccountEvent {
  const PasswordVisibilityToggled();
}

/// Create Account Error from Auth Repo
/// [errorString] : error description
class CreateAccountError extends CreateAccountEvent {
  const CreateAccountError(this.errorString);

  final String errorString;

  @override
  List<Object> get props => [errorString];
}

/// Submit Button Pressed Event
class SubmitPressed extends CreateAccountEvent {
  const SubmitPressed();
}

/// Successful Create Account creation Event
class LoginSuccessful extends CreateAccountEvent {
  const LoginSuccessful();
}
