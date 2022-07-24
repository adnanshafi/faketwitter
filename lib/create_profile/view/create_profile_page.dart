import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:faketwitter/l10n/l10n.dart';
import 'package:faketwitter/create_profile/create_profile.dart';
import 'package:faketwitter_api/faketwitter_api.dart' as f_api;
import 'package:faketwitter/app/app.dart' as app;
import 'package:faketwitter/avatar/avatar.dart' as avatar;
import 'package:form_inputs/form_inputs.dart';

part 'form.dart';
part 'fields.dart';
part 'buttons.dart';
part 'avatar.dart';
part 'debug.dart';

class CreateProfilePage extends StatelessWidget {
  const CreateProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateProfileBloc>(
      create: (context) {
        return CreateProfileBloc(
          dataBloc: context.read<app.DataBloc>(),
          api: context.read<f_api.FakeTwitterApi>(),
          user: context.read<app.AuthBloc>().state.user,
        );
      },
      child: const _Form(),
    );
  }
}
