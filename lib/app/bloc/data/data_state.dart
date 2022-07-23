part of 'data_bloc.dart';

enum Status {
  initial,
  hardLoading,
  softLoading,
  loaded,
  error,
}

class DataState extends Equatable {
  const DataState({
    this.status = Status.initial,
    this.userData = UserData.empty,
    this.uid = '',
  });

  final Status status;
  final UserData userData;
  final String uid;

  DataState copyWith({
    Status? status,
    UserData? userData,
    String? uid,
  }) {
    return DataState(
      status: status ?? this.status,
      userData: userData ?? this.userData,
      uid: uid ?? this.uid,
    );
  }

  @override
  List<Object> get props => [status, userData, uid];
}

extension DataStateX on DataState {
  bool get hasData => !userData.isEmpty;

  bool get isLoading => [
        Status.softLoading,
        Status.hardLoading,
      ].contains(status);

  bool get hasNoProfile => uid.isNotEmpty && userData.isEmpty;
  bool get hasProfile => uid.isNotEmpty && !userData.isEmpty;
}
