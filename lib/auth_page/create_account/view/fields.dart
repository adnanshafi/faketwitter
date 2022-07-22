part of 'create_account_page.dart';

class _EmailField extends StatelessWidget {
  const _EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      builder: (context, state) {
        return TextFormField(
          key: const ValueKey('email'),
          decoration: _emailDecoration(l10n.createAccountFieldEmail),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.read<CreateAccountBloc>().add(EmailChanged(value));
          },
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      builder: (context, state) {
        return TextFormField(
          key: const ValueKey('password'),
          keyboardType: TextInputType.visiblePassword,
          decoration: _passwordDecoration(
            context,
            l10n.createAccountFieldPassword,
            state.obscurePassword,
          ),
          obscureText: state.obscurePassword,
          onChanged: (value) {
            context.read<CreateAccountBloc>().add(PasswordChanged(value));
          },
        );
      },
    );
  }
}

class _PasswordConfirmField extends StatelessWidget {
  const _PasswordConfirmField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      builder: (context, state) {
        return TextFormField(
          key: const ValueKey('password'),
          keyboardType: TextInputType.visiblePassword,
          decoration: _passwordDecoration(
            context,
            l10n.createAccountFieldConfirmPassword,
            state.obscurePassword,
          ),
          obscureText: state.obscurePassword,
          onChanged: (value) {
            context
                .read<CreateAccountBloc>()
                .add(PasswordConfirmChanged(value));
          },
        );
      },
    );
  }
}

const InputDecoration _commonInputDecoration = InputDecoration(
  border:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
);

InputDecoration _emailDecoration(String label) =>
    _commonInputDecoration.copyWith(labelText: label);
InputDecoration _passwordDecoration(
  BuildContext context,
  String label,
  obscure,
) {
  final icon =
      obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  return _commonInputDecoration.copyWith(
    labelText: label,
    suffixIcon: IconButton(
      onPressed: () {
        context
            .read<CreateAccountBloc>()
            .add(const PasswordVisibilityToggled());
      },
      icon: Icon(icon),
    ),
  );
}
