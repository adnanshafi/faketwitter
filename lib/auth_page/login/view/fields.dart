part of 'login_page.dart';

class _EmailField extends StatelessWidget {
  const _EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          key: const ValueKey('email'),
          decoration: _emailDecoration(l10n.loginFieldLabelEmail),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(value));
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
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          key: const ValueKey('password'),
          keyboardType: TextInputType.visiblePassword,
          decoration: _passwordDecoration(
            context,
            l10n.loginFieldLabelPassword,
            state.obscurePassword,
          ),
          obscureText: state.obscurePassword,
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(value));
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
        context.read<LoginBloc>().add(const PasswordVisibilityToggled());
      },
      icon: Icon(icon),
    ),
  );
}
