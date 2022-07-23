import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart' as f;
import 'package:auth/auth.dart' as a;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(a.Auth auth)
      : _auth = auth,
        super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<PasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<SubmitPressed>(_onSubmitPressed);
    on<LoginSuccessful>(_onLoginSuccessful);
    on<LoginError>(_onLoginError);
  }

  final a.Auth _auth;

  void _onEmailChanged(
    EmailChanged event,
    Emitter<LoginState> emit,
  ) async {
    return emit(state.newStateFromInput(f.EmailInput.dirty(event.value)));
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<LoginState> emit,
  ) async {
    return emit(state.newStateFromInput(f.PasswordInput.dirty(event.value)));
  }

  Future<void> _onSubmitPressed(
    SubmitPressed event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status != f.FormzStatus.valid) {
      return;
    }

    emit(state.copyWith(status: f.FormzStatus.submissionInProgress));

    await _auth.signInEmailPassword(
      email: state.emailInput.value.trim(),
      password: state.passwordInput.value,
      onFailure: (s) {},
      onSuccess: () {},
    );
  }

  void _onPasswordVisibilityToggled(
    PasswordVisibilityToggled event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  Future<void> _onLoginSuccessful(
    LoginSuccessful event,
    Emitter<LoginState> emit,
  ) async {
    // TODO: implement event handler
  }

  void _onLoginError(
    LoginError event,
    Emitter<LoginState> emit,
  ) async {
    // TODO: implement event handler
  }
}
