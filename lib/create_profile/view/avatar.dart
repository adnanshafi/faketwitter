part of 'create_profile_page.dart';

class _Avatar extends StatelessWidget {
  const _Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateProfileBloc, CreateProfileState>(
      builder: (context, state) {
        final bool showAvatar = state.avatarInput.valid;
        final l10n = context.l10n;
        return Column(
          children: [
            CircleAvatar(
              radius: 64,
              backgroundImage:
                  showAvatar ? AssetImage(state.avatarInput.value) : null,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return BlocProvider.value(
                        value: context.read<CreateProfileBloc>(),
                        child: const _AvatarChooser(),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(l10n.createProfileAvatarHelp),
          ],
        );
      },
    );
  }
}

class _AvatarChooser extends StatelessWidget {
  const _AvatarChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                context.l10n.createProfileAvatarDialogTitle,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: avatar.files.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    key: ValueKey(avatar.files[index]),
                    onTap: () {
                      context
                          .read<CreateProfileBloc>()
                          .add(AvatarChanged(avatar.files[index]));
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage(avatar.files[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
