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
  })  : _authBloc = authBloc,
        _api = api,
        super(const DataState()) {
    // Register listeners
    on<FetchData>(_onFetchData);
    on<ClearData>(_onClearData);

    add(FetchData());

    _authSub = authBloc.stream.listen(
      (state) {
        if (state.isAuthenticated) {
          add(const FetchData());
        }
        if (state.isUnauthenticated) {
          add(const ClearData());
        }
        if (state.isUnknown) {
          add(const ClearData());
        }
      },
    );
  }

  // Auth Bloc Subscription
  late final StreamSubscription<AuthState> _authSub;

  // Auth Bloc
  final AuthBloc _authBloc;

  // Api
  final FakeTwitterApi _api;

  Future<void> _onFetchData(
    FetchData event,
    Emitter<DataState> emit,
  ) async {
    emit(state.copyWith(status: Status.hardLoading));

    final userData = await _api.getUserData(
      _authBloc.state.user.uid,
      onFailure: (s) {},
    );

    return emit(state.copyWith(
      userData: userData,
      uid: _authBloc.state.user.uid,
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
