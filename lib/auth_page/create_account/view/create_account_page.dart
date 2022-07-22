import 'package:faketwitter/onboard/cubit/onboard_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auth/auth.dart' as a;
import 'package:formz/formz.dart' as f;
import '../create_account.dart';
part 'form.dart';
part 'fields.dart';
part 'buttons.dart';
part 'other_widgets.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAccountBloc(context.read<a.Auth>()),
      child: const CreateAccountForm(),
    );
  }
}

extension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
