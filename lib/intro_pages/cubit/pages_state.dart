part of 'pages_cubit.dart';

class PagesState extends Equatable {
  const PagesState({
    this.numPages = 1,
    this.currentPageIndex = 0,
  });

  final int numPages;
  final int currentPageIndex;

  PagesState copyWith({int? numPages, int? currentPageIndex}) {
    return PagesState(
      numPages: numPages ?? this.numPages,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
  }

  @override
  List<Object> get props => [numPages, currentPageIndex];
}

extension on PagesState {
  bool get hasPages => numPages > 0;
  bool get isLast => numPages == currentPageIndex + 1;
  bool get isFirst => currentPageIndex == 0;

  PagesState getNext() => copyWith(currentPageIndex: currentPageIndex + 1);
  PagesState getPrevious() => copyWith(currentPageIndex: currentPageIndex - 1);
}
