part of 'create_tweet_page.dart';

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTweetBloc, CreateTweetState>(
      buildWhen: (p, c) {
        return p.buttonEnabled != c.buttonEnabled;
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.buttonEnabled
              ? () {
                  context.read<CreateTweetBloc>().add(const SubmitPressed());
                }
              : null,
          child: Text(context.l10n.createTweetPageButtonSubmit),
        );
      },
    );
  }
}
