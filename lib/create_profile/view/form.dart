part of 'create_profile_page.dart';

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  static const EdgeInsets _pagePadding =
      EdgeInsets.symmetric(vertical: 32, horizontal: 16);
  static const _spacer = SizedBox(height: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: _pagePadding,
          child: Column(
            children: const [
              _Avatar(),
              _spacer,
              _NameField(),
              _spacer,
              _UsernameField(),
              _spacer,
              _DescriptionField(),
              _spacer,
              _spacer,
              _SubmitButton(),
              _spacer,
              _DebugWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
