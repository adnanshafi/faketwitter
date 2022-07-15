import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit() : super(const OnboardState());

  loadCreateAccountPage() {
    emit(state.copyWith(pageType: PageType.createAccount));
  }

  loadLoginPage() {
    emit(state.copyWith(pageType: PageType.login));
  }

  loadIntroStartPage() {
    emit(state.copyWith(pageType: PageType.intro, index: 0));
  }
}
