import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:faketwitter/app/app.dart';
import 'package:models/models.dart' show UserData;

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc({required AuthBloc authBloc}) : super(DataInitial()) {
    _sub = authBloc.stream.listen(
      (state) {
        if (state.isAuthenticated) {
          print('Authenticated');

          // Fetch All User Data

        }
        if (state.isUnauthenticated) {
          print('UNAuth');

          // Discard all User Data
        }
        if (state.isUnknown) {
          print('Unknown');

          // Discard all User Data
        }
      },
    );
  }

  late final StreamSubscription<AuthState> _sub;
  UserData _userData = UserData.empty;
  UserData get userData => _userData;

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
