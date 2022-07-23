import 'package:faketwitter/onboard/onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:faketwitter/l10n/l10n.dart';
import 'package:auth/auth.dart' as a;
import 'package:form_inputs/form_inputs.dart' as f;
import '../login.dart';

part 'form.dart';
part 'fields.dart';
part 'buttons.dart';
part 'other_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) {
        return LoginBloc(context.read<a.Auth>());
      },
      child: const _LoginForm(),
    );
  }
}
