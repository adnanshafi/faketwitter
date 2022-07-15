import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:faketwitter/intro_pages/intro_pages.dart';

part 'pages_state.dart';

class PagesCubit extends Cubit<PagesState> {
  PagesCubit(int numPages)
      : this.numPages = numPages,
        super(PagesState(numPages: numPages));

  final int numPages;

  loadPrevious() {
    if (!state.hasPages) return;
    if (state.isFirst) return;

    return emit(state.getPrevious());
  }

  loadNext() {
    if (!state.hasPages) return;
    if (state.isLast) return;

    return emit(state.getNext());
  }
}
