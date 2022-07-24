part of 'create_profile_page.dart';

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateProfileBloc, CreateProfileState>(
      buildWhen: (p, c) {
        return p.buttonEnabled != c.buttonEnabled;
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.buttonEnabled
              ? () {
                  context.read<CreateProfileBloc>().add(const SubmitPressed());
                }
              : null,
          child: Text('submit'),
        );
      },
    );
  }
}
