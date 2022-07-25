import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:faketwitter/app/app.dart' as app;
import 'package:faketwitter_api/faketwitter_api.dart' as f_api;
import 'package:faketwitter/create_tweet/create_tweet.dart';

import 'package:faketwitter/l10n/l10n.dart';

part 'app_bar.dart';
part 'buttons.dart';
part 'fields.dart';
part 'form.dart';
part 'preview.dart';

class CreateTweetPage extends StatelessWidget {
  const CreateTweetPage({Key? key}) : super(key: key);

  static const String route = '/create_tweet';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateTweetBloc>(
      create: (context) {
        return CreateTweetBloc(
          api: context.read<f_api.FakeTwitterApi>(),
          dataBloc: context.read<app.DataBloc>(),
          authBloc: context.read<app.AuthBloc>(),
        );
      },
      child: _Form(),
    );
  }
}
