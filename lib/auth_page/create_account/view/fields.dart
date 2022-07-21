part of 'create_account_page.dart';

class _EmailField extends StatelessWidget {
  const _EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const ValueKey('email'),
      decoration: _emailDecoration,
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const ValueKey('password'),
      decoration: _passwordDecoration,
    );
  }
}

class PasswordConfirmField extends StatelessWidget {
  const PasswordConfirmField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const ValueKey('password_confirm'),
      decoration: _passwordDecoration,
    );
  }
}

const InputDecoration _commonInputDecoration = InputDecoration(
  border: OutlineInputBorder(),
);

InputDecoration _emailDecoration = _commonInputDecoration.copyWith();
InputDecoration _passwordDecoration = _commonInputDecoration.copyWith();
