import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:auth/auth.dart' as auth show User;
import 'package:faketwitter/app/app.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart' show UserData;

import 'package:faketwitter_api/faketwitter_api.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc({
    required AuthBloc authBloc,
    required FakeTwitterApi api,
  })  : _api = api,
        super(const DataState()) {
    // Register listeners
    on<FetchData>(_onFetchData);
    on<ClearData>(_onClearData);

    add(FetchData(authBloc.state.user.uid));

    _authSub = authBloc.stream.listen(
      (state) {
        if (state.isAuthenticated) {
          add(FetchData(state.user.uid));
        }
        if (state.isUnauthenticated) {
          add(ClearData());
        }
        if (state.isUnknown) {
          add(ClearData());
        }
      },
    );
  }

  // Auth Bloc Subscription
  late final StreamSubscription<AuthState> _authSub;

  // Api
  final FakeTwitterApi _api;

  Future<void> _onFetchData(
    FetchData event,
    Emitter<DataState> emit,
  ) async {
    emit(state.copyWith(status: Status.hardLoading));

    final userData = await _api.getUserData(
      event.uid,
      onFailure: (s) {},
    );

    return emit(state.copyWith(
      userData: userData,
      uid: event.uid,
      status: Status.loaded,
    ));
  }

  void _onClearData(
    ClearData event,
    Emitter<DataState> emit,
  ) async {
    return emit(const DataState());
  }

  @override
  Future<void> close() {
    _authSub.cancel();
    return super.close();
  }
}
