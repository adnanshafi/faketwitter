part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class ClearData extends DataEvent {}

class FetchData extends DataEvent {
  const FetchData(this.uid);

  final String uid;

  @override
  // TODO: implement props
  List<Object> get props => [uid];
}
