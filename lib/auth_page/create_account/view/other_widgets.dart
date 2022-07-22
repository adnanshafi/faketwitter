part of 'create_account_page.dart';

class _AppBar extends AppBar {
  _AppBar()
      : super(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: const _BackButton());
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // title text
    final text = context.l10n.createAccountTitle;

    // Define style here
    final _style = Theme.of(context)
        .textTheme
        .headline3!
        .copyWith(color: Colors.black, height: 1.4);

    return Text(
      text,
      style: _style,
    );
  }
}

class _DebugBlocWidget extends StatelessWidget {
  const _DebugBlocWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountBloc, CreateAccountState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(f.Formz.validate([state.emailInput]).toString()),
            Text(f.Formz.validate([state.passwordInput]).toString()),
            Text('${f.Formz.validate([
                  state.passwordConfirmInput
                ])}  ${state.passwordConfirmInput.valid}'),
            Text(state.status.toString()),
          ],
        );
      },
    );
  }
}
