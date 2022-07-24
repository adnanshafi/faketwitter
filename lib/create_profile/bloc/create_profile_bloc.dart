import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:faketwitter/app/app.dart' as app;
import 'package:form_inputs/form_inputs.dart' as f;
import 'package:models/models.dart' as m show UserData;
import 'package:faketwitter_api/faketwitter_api.dart' as f_api;
import 'package:auth/auth.dart' as auth show User;

part 'create_profile_event.dart';
part 'create_profile_state.dart';

class CreateProfileBloc extends Bloc<CreateProfileEvent, CreateProfileState> {
  CreateProfileBloc({
    required auth.User user,
    required f_api.FakeTwitterApi api,
    required app.DataBloc dataBloc,
  })  : _dataBloc = dataBloc,
        _user = user,
        _api = api,
        super(const CreateProfileState()) {
    on<AvatarChanged>(_onAvatarChanged);
    on<NameChanged>(_onNameChanged);
    on<UsernameChanged>(_onUsernameChanged);
    on<CheckAvailability>(_onCheckAvailability);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<SubmitPressed>(_onSubmitPressed);
  }

  final auth.User _user;
  final f_api.FakeTwitterApi _api;
  final app.DataBloc _dataBloc;

  void _onAvatarChanged(
    AvatarChanged event,
    Emitter<CreateProfileState> emit,
  ) async {
    return emit(state.newStateFromInput(f.AvatarInput.dirty(event.value)));
  }

  void _onNameChanged(
    NameChanged event,
    Emitter<CreateProfileState> emit,
  ) async {
    return emit(state.newStateFromInput(f.NameInput.dirty(event.value)));
  }

  void _onUsernameChanged(
    UsernameChanged event,
    Emitter<CreateProfileState> emit,
  ) async {
    emit(state.newStateFromInput(f.UsernameInput.dirty(event.value)));
    add(const CheckAvailability());
  }

  Future<void> _onCheckAvailability(
    CheckAvailability event,
    Emitter<CreateProfileState> emit,
  ) async {
    final bool available =
        await _api.checkUsernameAvailability(state.usernameInput.value);

    return emit(state.copyWith(
      usernameAvailable: available,
      usernameAvailabilityChecked: true,
    ));
  }

  void _onDescriptionChanged(
    DescriptionChanged event,
    Emitter<CreateProfileState> emit,
  ) async {
    return emit(state.newStateFromInput(f.DescriptionInput.dirty(event.value)));
  }

  Future<void> _onSubmitPressed(
    SubmitPressed event,
    Emitter<CreateProfileState> emit,
  ) async {
    emit(state.copyWith(status: f.FormzStatus.submissionInProgress));

    final userData = m.UserData(
      uid: _user.uid,
      avatarUrl: state.avatarInput.value,
      userName: state.usernameInput.value,
      name: state.nameInput.value,
      description: state.nameInput.value,
    );

    await _api.setUserData(userData);
    _dataBloc.add(const app.ClearData());
    _dataBloc.add(const app.FetchData());
    return;
  }
}
