part of 'create_tweet_page.dart';

class _TweetField extends StatelessWidget {
  const _TweetField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: context.l10n.createTweetPageFieldTweetLabel,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
      maxLength: 160,
      textCapitalization: TextCapitalization.sentences,
      maxLines: 4,
      onChanged: (value) {
        context.read<CreateTweetBloc>().add(TweetInputChanged(value));
      },
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      context.l10n.createTweetPageTitle,
      style: Theme.of(context).textTheme.headline4!.copyWith(
            color: Colors.black,
          ),
    );
  }
}
