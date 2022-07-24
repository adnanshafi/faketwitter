part of 'create_profile_page.dart';

class _NameField extends StatelessWidget {
  const _NameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: _nameDecoration(context),
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        context.read<CreateProfileBloc>().add(NameChanged(value));
      },
    );
  }
}

class _UsernameField extends StatelessWidget {
  const _UsernameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: _usernameDecoration(context),
          inputFormatters: [
            FilteringTextInputFormatter.deny(' '),
            LengthLimitingTextInputFormatter(10),
          ],
          onChanged: (value) {
            context.read<CreateProfileBloc>().add(UsernameChanged(value));
          },
          textInputAction: TextInputAction.next,
        ),
        const _Availability()
      ],
    );
  }
}

class _Availability extends StatelessWidget {
  const _Availability({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateProfileBloc, CreateProfileState>(
      buildWhen: (p, c) {
        return p.usernameInput != c.usernameInput ||
            p.usernameAvailabilityChecked != c.usernameAvailabilityChecked;
      },
      builder: (context, state) {
        final l10n = context.l10n;
        return SizedBox(
          height: 24,
          child: Padding(
            padding: const EdgeInsets.only(top: 2, left: 15),
            child: state.showAvailablityWidget
                ? Text(
                    '@${state.usernameInput.value}${state.usernameAvailable ? l10n.createProfileUsernameAvailable : l10n.createProfileUsernameNotAvailable}',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color:
                          state.usernameAvailable ? Colors.green : Colors.red,
                    ),
                  )
                : null,
          ),
        );
      },
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: _descriptionDecoration(context),
      maxLines: 3,
      textInputAction: TextInputAction.done,
      onChanged: (value) {
        context.read<CreateProfileBloc>().add(DescriptionChanged(value));
      },
      onFieldSubmitted: (s) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}

const InputDecoration _commonDecoration = InputDecoration(
  border:
      OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
);

InputDecoration _nameDecoration(BuildContext context) {
  return _commonDecoration.copyWith(
    labelText: context.l10n.createProfileFieldName,
  );
}

InputDecoration _usernameDecoration(BuildContext context) {
  return _commonDecoration.copyWith(
    labelText: context.l10n.createProfileFieldUsername,
    prefixText: '@',
  );
}

InputDecoration _descriptionDecoration(BuildContext context) {
  return _commonDecoration.copyWith(
    labelText: context.l10n.createProfileFieldDescription,
  );
}
