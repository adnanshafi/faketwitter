part of 'onboard_cubit.dart';

enum PageType {
  intro,
  createAccount,
  login,
}

class OnboardState extends Equatable {
  const OnboardState({
    this.pageType = PageType.intro,
  });

  final PageType pageType;

  OnboardState copyWith({PageType? pageType, int? index}) {
    return OnboardState(
      pageType: pageType ?? this.pageType,
    );
  }

  @override
  List<Object> get props => [pageType];
}
