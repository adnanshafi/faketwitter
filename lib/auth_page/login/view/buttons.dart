part of 'login_page.dart';

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (p, c) => p.status != c.status,
      builder: (context, state) {
        return Center(
          child: ElevatedButton(
            onPressed: state.buttonSubmitEnabled
                ? () {
                    context.read<LoginBloc>().add(const SubmitPressed());
                  }
                : null,
            child: Text(l10n.loginButton),
          ),
        );
      },
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (p, c) => p.status != c.status,
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<OnboardCubit>().loadIntroStartPage();
          },
          iconSize: 48,
          icon: const Icon(
            Icons.navigate_before_rounded,
            color: Colors.black,
          ),
        );
      },
    );
  }
}

class _CreateAccountInstead extends StatelessWidget {
  const _CreateAccountInstead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (p, c) => p.status != c.status,
      builder: (context, state) {
        return Center(
          child: TextButton(
            onPressed: state.interactionEnabled
                ? () {
                    context.read<OnboardCubit>().loadCreateAccountPage();
                  }
                : null,
            child: Text(l10n.loginButtonCreateAccountInsted),
          ),
        );
      },
    );
  }
}
