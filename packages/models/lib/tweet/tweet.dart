import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'tweet.g.dart';

@JsonSerializable(explicitToJson: true)
class Tweet extends Equatable {
  Tweet({
    this.storePath = '',
    this.creatorUid = '',
    this.text = '',
    this.likes = 0,
    this.mentions = const <String>[],
    this.hashTags = const <String>[],
    DateTime? timeCreated,
  }) {
    if (timeCreated == null) {
      this.timeCreated = DateTime.fromMillisecondsSinceEpoch(1);
    } else {
      this.timeCreated = timeCreated;
    }
  }

  final String storePath;
  final String creatorUid;
  late final DateTime timeCreated;
  final String text;
  final int likes;

  final List<String> hashTags;
  final List<String> mentions;

  @override
  List<Object?> get props => [
        creatorUid,
        timeCreated,
        text,
        likes,
        hashTags,
        mentions,
      ];

  Tweet copyWithPath(String? storePath) {
    return Tweet(
      storePath: storePath ?? '',
      creatorUid: creatorUid,
      hashTags: hashTags,
      likes: likes,
      mentions: mentions,
      text: text,
      timeCreated: timeCreated,
    );
  }

  Map<String, dynamic> toJson() => _$TweetToJson(this);
  factory Tweet.fromJson(Map<String, dynamic> json, {String? storePath}) =>
      _$TweetFromJson(json).copyWithPath(storePath);
}
