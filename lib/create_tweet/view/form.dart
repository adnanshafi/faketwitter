part of 'create_tweet_page.dart';

class _Form extends StatelessWidget {
  const _Form({Key? key}) : super(key: key);
  static const _pagePadding =
      EdgeInsets.only(top: 128, left: 16, right: 16, bottom: 16);
  static const _spacer = SizedBox(height: 32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CreateTweetBloc, CreateTweetState>(
        listener: (context, state) {
          if (state.isSuccess) {
            Navigator.of(context).pop();
          }
          if (state.hasError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Something Went Wrong!')),
            );
          }
        },
        listenWhen: (p, c) {
          if (!p.isSuccess && c.isSuccess) return true;
          if (!p.hasError && c.hasError) return true;
          return false;
        },
        child: Padding(
          padding: _pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _Title(),
              _spacer,
              _TweetField(),
            ],
          ),
        ),
      ),
      floatingActionButton: const _SubmitButton(),
    );
  }
}
