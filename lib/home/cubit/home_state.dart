part of 'home_cubit.dart';

enum HomeTabs {
  home,
  feed,
}

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}
