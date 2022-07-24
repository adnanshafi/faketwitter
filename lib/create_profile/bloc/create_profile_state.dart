part of 'create_profile_bloc.dart';

class CreateProfileState extends Equatable {
  const CreateProfileState({
    this.status = f.FormzStatus.pure,
    this.avatarInput = const f.AvatarInput.pure(),
    this.nameInput = const f.NameInput.pure(),
    this.usernameInput = const f.UsernameInput.pure(),
    this.descriptionInput = const f.DescriptionInput.pure(),
    this.usernameAvailable = false,
    this.usernameAvailabilityChecked = false,
  });

  final f.FormzStatus status;
  final f.AvatarInput avatarInput;
  final f.NameInput nameInput;
  final f.UsernameInput usernameInput;
  final f.DescriptionInput descriptionInput;
  final bool usernameAvailable;
  final bool usernameAvailabilityChecked;

  CreateProfileState copyWith({
    f.FormzStatus? status,
    f.AvatarInput? avatarInput,
    f.NameInput? nameInput,
    f.UsernameInput? usernameInput,
    f.DescriptionInput? descriptionInput,
    bool? usernameAvailable,
    bool? usernameAvailabilityChecked,
  }) {
    return CreateProfileState(
      status: status ?? this.status,
      avatarInput: avatarInput ?? this.avatarInput,
      nameInput: nameInput ?? this.nameInput,
      usernameInput: usernameInput ?? this.usernameInput,
      descriptionInput: descriptionInput ?? this.descriptionInput,
      usernameAvailable: usernameAvailable ?? this.usernameAvailable,
      usernameAvailabilityChecked:
          usernameAvailabilityChecked ?? this.usernameAvailabilityChecked,
    );
  }

  @override
  List<Object> get props => [
        status,
        nameInput,
        usernameInput,
        descriptionInput,
        avatarInput,
        usernameAvailable,
        usernameAvailabilityChecked,
      ];
}

extension CreateProfileStateX on CreateProfileState {
  bool get showAvailablityWidget =>
      usernameAvailabilityChecked && usernameInput.value.isNotEmpty;

  bool get interactionDisabled => status == f.FormzStatus.submissionInProgress;
  bool get buttonEnabled =>
      status == f.FormzStatus.valid &&
      usernameAvailable &&
      usernameAvailabilityChecked;

  CreateProfileState newStateFromInput(f.FormzInput input) {
    switch (input.runtimeType) {
      case f.AvatarInput:
        return copyWith(
          status: f.Formz.validate([
            input,
            nameInput,
            descriptionInput,
            usernameInput,
          ]),
          avatarInput: input as f.AvatarInput,
        );
      case f.NameInput:
        return copyWith(
          status: f.Formz.validate([
            input,
            avatarInput,
            descriptionInput,
            usernameInput,
          ]),
          nameInput: input as f.NameInput,
        );
      case f.UsernameInput:
        return copyWith(
          status: f.Formz.validate([
            input,
            nameInput,
            descriptionInput,
            avatarInput,
          ]),
          usernameInput: input as f.UsernameInput,
          usernameAvailabilityChecked: false,
        );
      case f.DescriptionInput:
        return copyWith(
          status: f.Formz.validate([
            input,
            nameInput,
            avatarInput,
            usernameInput,
          ]),
          descriptionInput: input as f.DescriptionInput,
        );
    }

    return this;
  }
}
