part of 'create_tweet_bloc.dart';

abstract class CreateTweetEvent extends Equatable {
  const CreateTweetEvent();

  @override
  List<Object> get props => [];
}

class TweetInputChanged extends CreateTweetEvent {
  const TweetInputChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class SubmitPressed extends CreateTweetEvent {
  const SubmitPressed();
}

class CreateTweetError extends CreateTweetEvent {
  const CreateTweetError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class SubmitSuccess extends CreateTweetEvent {
  const SubmitSuccess();
}
