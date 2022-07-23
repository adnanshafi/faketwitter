part of 'login_page.dart';

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
    final text = context.l10n.loginTitle;

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

/// Simple widget for debug purpose
class _DebugBlocWidget extends StatelessWidget {
  const _DebugBlocWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          children: [],
        );
      },
    );
  }
}
