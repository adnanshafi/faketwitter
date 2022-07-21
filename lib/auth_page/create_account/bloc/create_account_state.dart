part of 'create_account_bloc.dart';

class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.status = f.FormzStatus.pure,
    this.emailInput = const f.EmailInput.pure(),
    this.passwordInput = const f.PasswordInput.pure(),
    this.confirmPasswordInput = const f.PasswordConfirmInput.pure(),
    this.obscurePassword = true,
  });

  // Input fields
  final f.EmailInput emailInput;
  final f.PasswordInput passwordInput;
  final f.PasswordConfirmInput confirmPasswordInput;

  // Form Status
  final f.FormzStatus status;

  // Password Visibility
  final bool obscurePassword;

  @override
  List<Object> get props => [
        emailInput,
        passwordInput,
        confirmPasswordInput,
        obscurePassword,
      ];

  CreateAccountState copyWith({
    f.FormzStatus? status,
    f.EmailInput? emailInput,
    f.PasswordInput? passwordInput,
    f.PasswordConfirmInput? confirmPasswordInput,
    bool? obscurePassword,
  }) {
    return CreateAccountState(
      status: status ?? this.status,
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      confirmPasswordInput: confirmPasswordInput ?? this.confirmPasswordInput,
      obscurePassword: obscurePassword ?? this.obscurePassword,
    );
  }
}

extension CreateAccountStateX on CreateAccountState {}
