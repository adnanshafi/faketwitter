part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = f.FormzStatus.pure,
    this.emailInput = const f.EmailInput.pure(),
    this.passwordInput = const f.PasswordInput.pure(),
    this.obscurePassword = true,
  });

  final f.FormzStatus status;
  final f.EmailInput emailInput;
  final f.PasswordInput passwordInput;

  final bool obscurePassword;

  LoginState copyWith({
    f.FormzStatus? status,
    f.EmailInput? emailInput,
    f.PasswordInput? passwordInput,
    bool? obscurePassword,
  }) {
    return LoginState(
      status: status ?? this.status,
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }

  @override
  List<Object> get props => [
        status,
        emailInput,
        passwordInput,
      ];
}

extension LoginStateX on LoginState {
  bool get interactionEnabled => status != f.FormzStatus.submissionInProgress;
  bool get buttonSubmitEnabled => status == f.FormzStatus.valid;

  LoginState newStateFromInput(f.FormzInput input) {
    switch (input.runtimeType) {
      case f.EmailInput:
        return copyWith(
          emailInput: input as f.EmailInput,
          status: f.Formz.validate([input, passwordInput]),
        );
      case f.PasswordInput:
        return copyWith(
          passwordInput: input as f.PasswordInput,
          status: f.Formz.validate([emailInput, input]),
        );
      default:
        return const LoginState();
    }
  }
}
