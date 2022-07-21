import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
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
  }

  /// Instance Of Auth Repo
  final a.Auth _auth;

  void _onEmailChanged(
    EmailChanged event,
    Emitter<CreateAccountState> emit,
  ) async {
    // TODO: implement event handler
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<CreateAccountState> emit,
  ) async {
    // TODO: implement event handler
  }

  void _onPasswordConfirmChanged(
    PasswordConfirmChanged event,
    Emitter<CreateAccountState> emit,
  ) async {
    // TODO: implement event handler
  }

  Future<void> _onSubmitPressed(
    SubmitPressed event,
    Emitter<CreateAccountState> emit,
  ) async {
    // TODO: implement event handler
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
