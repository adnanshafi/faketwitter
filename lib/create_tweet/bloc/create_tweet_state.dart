part of 'create_tweet_bloc.dart';

class CreateTweetState extends Equatable {
  const CreateTweetState({
    this.status = f.FormzStatus.pure,
    this.tweetInput = const f.TweetInput.pure(),
  });

  final f.FormzStatus status;
  final f.TweetInput tweetInput;

  CreateTweetState copyWith({
    f.FormzStatus? status,
    f.TweetInput? tweetInput,
  }) {
    return CreateTweetState(
      status: status ?? this.status,
      tweetInput: tweetInput ?? this.tweetInput,
    );
  }

  @override
  List<Object> get props => [
        status,
        tweetInput,
      ];
}

extension CreateTweetStateX on CreateTweetState {
  bool get interactionEnabled => ![
        f.FormzStatus.submissionInProgress,
        f.FormzStatus.submissionSuccess
      ].contains(status);
  bool get buttonEnabled => status == f.FormzStatus.valid;

  bool get isSuccess => status == f.FormzStatus.submissionSuccess;
  bool get hasError => status == f.FormzStatus.submissionFailure;
}
