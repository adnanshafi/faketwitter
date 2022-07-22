part of 'create_account_bloc.dart';

class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.status = f.FormzStatus.pure,
    this.emailInput = const f.EmailInput.pure(),
    this.passwordInput = const f.PasswordInput.pure(),
    this.passwordConfirmInput = const f.PasswordConfirmInput.pure(),
    this.obscurePassword = true,
  });

  // Input fields
  final f.EmailInput emailInput;
  final f.PasswordInput passwordInput;
  final f.PasswordConfirmInput passwordConfirmInput;

  // Form Status
  final f.FormzStatus status;

  // Password Visibility
  final bool obscurePassword;

  @override
  List<Object> get props => [
        emailInput,
        passwordInput,
        passwordConfirmInput,
        obscurePassword,
      ];

  CreateAccountState copyWith({
    f.FormzStatus? status,
    f.EmailInput? emailInput,
    f.PasswordInput? passwordInput,
    f.PasswordConfirmInput? passwordConfirmInput,
    bool? obscurePassword,
  }) {
    return CreateAccountState(
      status: status ?? this.status,
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      passwordConfirmInput: passwordConfirmInput ?? this.passwordConfirmInput,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }
}

extension CreateAccountStateX on CreateAccountState {
  bool get interactionEnabled => status != f.FormzStatus.submissionInProgress;
  bool get buttonSubmitEnabled => status == f.FormzStatus.valid;

  List<f.FormzInput> get fields => [
        emailInput,
        passwordInput,
        passwordConfirmInput,
      ];

  /// Derive new state from FormzInput `input`
  CreateAccountState newStateFromInput(f.FormzInput input) {
    switch (input.runtimeType) {
      case f.EmailInput:
        return copyWith(
          emailInput: input as f.EmailInput,
          status: f.Formz.validate([
            input,
            passwordInput,
            passwordConfirmInput,
          ]),
        );
      case f.PasswordInput:
        final newConfValue = f.PasswordConfirmInput.dirty(
            passwordConfirmInput.value, input.value);
        return copyWith(
          passwordInput: input as f.PasswordInput,
          passwordConfirmInput: newConfValue,
          status: f.Formz.validate([
            input,
            emailInput,
            newConfValue,
          ]),
        );
      case f.PasswordConfirmInput:
        final newConfValue = f.PasswordConfirmInput.dirty(
          input.value,
          passwordInput.value,
        );
        return copyWith(
          passwordConfirmInput: newConfValue,
          status: f.Formz.validate([
            newConfValue,
            emailInput,
            passwordInput,
          ]),
        );
      default:
        return const CreateAccountState();
    }
  }
}
