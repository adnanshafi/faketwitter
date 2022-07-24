part of 'data_bloc.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class ClearData extends DataEvent {
  const ClearData();
}

class FetchData extends DataEvent {
  const FetchData();
}
