import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/scheduler.dart';
import 'package:form_inputs/form_inputs.dart' as f;
import 'package:auth/auth.dart' as a;

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  CreateAccountBloc(a.Auth auth)
      : _auth = auth,
        super(const CreateAccountState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<PasswordConfirmChanged>(_onPasswordConfirmChanged);
    on<SubmitPressed>(_onSubmitPressed);
    on<LoginSuccessful>(_onLoginSuccessful);
    on<CreateAccountError>(_onCreateAccountError);
    on<PasswordVisibilityToggled>(_onPasswordVisibilityToggled);
  }

  /// Instance Of Auth Repo
  final a.Auth _auth;

  void _onEmailChanged(
    EmailChanged event,
    Emitter<CreateAccountState> emit,
  ) async {
    return emit(state.newStateFromInput(f.EmailInput.dirty(event.value)));
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<CreateAccountState> emit,
  ) async {
    return emit(state.newStateFromInput(f.PasswordInput.dirty(event.value)));
  }

  void _onPasswordConfirmChanged(
    PasswordConfirmChanged event,
    Emitter<CreateAccountState> emit,
  ) async {
    return emit(
        state.newStateFromInput(f.PasswordConfirmInput.dirty(event.value)));
  }

  void _onPasswordVisibilityToggled(
    PasswordVisibilityToggled event,
    Emitter<CreateAccountState> emit,
  ) async {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  Future<void> _onSubmitPressed(
    SubmitPressed event,
    Emitter<CreateAccountState> emit,
  ) async {
    if (state.status != f.FormzStatus.valid) {
      return;
    }

    _auth.createAccountWithEmailPassword(
      email: state.emailInput.value,
      password: state.passwordInput.value,
      onFailure: (s) {
        add(CreateAccountError(s));
      },
      onSuccess: () {
        add(const LoginSuccessful());
      },
    );
  }

  Future<void> _onLoginSuccessful(
    LoginSuccessful event,
    Emitter<CreateAccountState> emit,
  ) async {
    // TODO: implement event handler
  }

  void _onCreateAccountError(
    CreateAccountError event,
    Emitter<CreateAccountState> emit,
  ) async {
    // TODO: implement event handler
  }
}
