import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:faketwitter/auth_page/create_account/create_account.dart';
import 'package:form_inputs/form_inputs.dart' as f;
import 'package:faketwitter_api/faketwitter_api.dart' as f_api;
import 'package:faketwitter/app/app.dart' as app;
import 'package:models/models.dart';

part 'create_tweet_event.dart';
part 'create_tweet_state.dart';

class CreateTweetBloc extends Bloc<CreateTweetEvent, CreateTweetState> {
  CreateTweetBloc({
    required f_api.FakeTwitterApi api,
    required app.AuthBloc authBloc,
    required app.DataBloc dataBloc,
  })  : _api = api,
        _authBloc = authBloc,
        _dataBloc = dataBloc,
        super(const CreateTweetState()) {
    on<TweetInputChanged>(_onTweetInputChanged);
    on<SubmitSuccess>(_onSubmitSuccess);
    on<SubmitPressed>(_onSubmitPressed);
    on<CreateTweetError>(_onCreateTweetError);
  }

  final f_api.FakeTwitterApi _api;
  final app.AuthBloc _authBloc;
  final app.DataBloc _dataBloc;

  void _onTweetInputChanged(
    TweetInputChanged event,
    Emitter<CreateTweetState> emit,
  ) async {
    final newTweetInput = f.TweetInput.dirty(event.value);
    return emit(state.copyWith(
      status: f.Formz.validate([newTweetInput]),
      tweetInput: newTweetInput,
    ));
  }

  Future<void> _onSubmitPressed(
    SubmitPressed event,
    Emitter<CreateTweetState> emit,
  ) async {
    if (state.status != f.FormzStatus.valid) return;

    emit(state.copyWith(status: f.FormzStatus.submissionInProgress));

    final tweet = Tweet(
      text: state.tweetInput.value,
      timeCreated: DateTime.now(),
      creatorUid: _authBloc.state.user.uid,
      hashTags: state.tweetInput.hashTags,
      mentions: state.tweetInput.mentions,
    );

    await _api.setTweet(tweet, onSuccess: () {
      add(const SubmitSuccess());
      _dataBloc.add(const app.FetchData());
    }, onFailure: (message) {
      add(CreateTweetError(message));
    });
  }

  void _onSubmitSuccess(
    SubmitSuccess event,
    Emitter<CreateTweetState> emit,
  ) async {
    return emit(state.copyWith(status: f.FormzStatus.submissionSuccess));
  }

  void _onCreateTweetError(
    CreateTweetError event,
    Emitter<CreateTweetState> emit,
  ) async {
    emit(state.copyWith(status: f.FormzStatus.submissionFailure));
    await Future.delayed(const Duration(milliseconds: 500));
    return emit(state.copyWith(status: f.Formz.validate([state.tweetInput])));
  }
}
