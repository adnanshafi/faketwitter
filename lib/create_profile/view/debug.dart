part of 'create_profile_page.dart';

class _DebugWidget extends StatelessWidget {
  const _DebugWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateProfileBloc, CreateProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(state.status.toString()),
            Text(state.avatarInput.valid.toString() +
                ' ' +
                state.avatarInput.value),
            Text(state.usernameInput.valid.toString() +
                ' ' +
                state.usernameInput.value),
            Text(
                state.nameInput.valid.toString() + ' ' + state.nameInput.value),
            Text(state.descriptionInput.valid.toString() +
                ' ' +
                state.descriptionInput.value),
            Text(state.usernameAvailable.toString()),
          ],
        );
      },
    );
  }
}
