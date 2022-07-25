import 'package:formz/formz.dart';

enum TweetInputError {
  empty,
  tooLong,
}

class TweetInput extends FormzInput<String, TweetInputError> {
  const TweetInput.pure() : super.pure('');
  const TweetInput.dirty([String value = '']) : super.dirty(value);

  @override
  TweetInputError? validator(String value) {
    if (value.isEmpty) return TweetInputError.empty;
    if (value.length > 160) return TweetInputError.tooLong;
    return null;
  }

  /// get mentions
  List<String> get mentions {
    final mentions = <String>[];

    final words = value.split(' ');
    final trimmedWords = words.map((e) => e.trim());
    for (var word in trimmedWords) {
      if (word.startsWith('@')) mentions.add(word);
    }
    return mentions;
  }

  /// get hashtags
  List<String> get hashTags {
    final hashTags = <String>[];

    final words = value.split(' ');
    final trimmedWords = words.map((e) => e.trim());
    for (var word in trimmedWords) {
      if (word.startsWith('#')) hashTags.add(word);
    }
    return hashTags;
  }
}
