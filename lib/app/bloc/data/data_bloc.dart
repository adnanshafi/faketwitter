import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:faketwitter/app/app.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc({required AuthBloc authBloc}) : super(DataInitial()) {
    _sub = authBloc.stream.listen((event) {});
  }

  late final StreamSubscription<AuthState> _sub;

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
