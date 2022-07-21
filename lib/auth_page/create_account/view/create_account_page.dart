import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auth/auth.dart' as a;
import '../create_account.dart';
part 'form.dart';
part 'fields.dart';
part 'buttons.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAccountBloc(context.read<a.Auth>()),
      child: const Scaffold(
        body: CreateAccountForm(),
      ),
    );
  }
}
