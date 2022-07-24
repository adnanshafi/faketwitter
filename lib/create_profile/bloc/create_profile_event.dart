part of 'create_profile_bloc.dart';

abstract class CreateProfileEvent extends Equatable {
  const CreateProfileEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends CreateProfileEvent {
  const NameChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class UsernameChanged extends CreateProfileEvent {
  const UsernameChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class CheckAvailability extends CreateProfileEvent {
  const CheckAvailability();
}

class DescriptionChanged extends CreateProfileEvent {
  const DescriptionChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class AvatarChanged extends CreateProfileEvent {
  const AvatarChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class SubmitPressed extends CreateProfileEvent {
  const SubmitPressed();
}

class CreateProfileError extends CreateProfileEvent {
  const CreateProfileError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
