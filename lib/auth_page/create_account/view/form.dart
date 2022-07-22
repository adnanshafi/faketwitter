part of 'create_account_page.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({Key? key}) : super(key: key);

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  static const _pagePadding = EdgeInsets.symmetric(vertical: 0, horizontal: 32);
  static const _spacerTop = SizedBox(height: 128);
  static const _spacerTitle = SizedBox(height: 32);
  static const _spacerFields = SizedBox(height: 16);
  static const _spacerSubmitButton = SizedBox(height: 32);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBE7C6),
      extendBodyBehindAppBar: true,
      appBar: _AppBar(),
      body: Padding(
        padding: _pagePadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _spacerTop,
              // _DebugBlocWidget(),
              _Title(),
              _spacerTitle,
              _EmailField(),
              _spacerFields,
              _PasswordField(),
              _spacerFields,
              _PasswordConfirmField(),
              _spacerSubmitButton,
              _SubmitButton(),
              _LoginInsteadButton(),
            ],
          ),
        ),
      ),
    );
  }
}
