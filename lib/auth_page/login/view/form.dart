part of 'login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  State<_LoginForm> createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  static const _pagePadding = EdgeInsets.symmetric(vertical: 0, horizontal: 32);
  static const _spacerTop = SizedBox(height: 128);
  static const _spacerTitle = SizedBox(height: 64);
  static const _spacerFields = SizedBox(height: 16);
  static const _spacerSubmitButton = SizedBox(height: 32);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFBE7C6),
      extendBodyBehindAppBar: true,
      // appBar: _AppBar(),
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
              _spacerSubmitButton,
              _SubmitButton(),
              _CreateAccountInstead(),
            ],
          ),
        ),
      ),
    );
  }
}
