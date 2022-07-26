import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user_tweet_library.g.dart';

@JsonSerializable(explicitToJson: true)
class UserTweetLibrary extends Equatable {
  const UserTweetLibrary({
    this.storePath = '',
    required this.uid,
    required this.items,
  });

  @JsonKey(ignore: true)
  final String storePath;
  final String uid;
  final List<UserTweetLibraryItem> items;

  UserTweetLibrary withPath(String? storePath) {
    return UserTweetLibrary(
      storePath: storePath ?? this.storePath,
      uid: uid,
      items: items,
    );
  }

  @override
  List<Object?> get props => throw [storePath, uid, items];

  Map<String, dynamic> toJson() => _$UserTweetLibraryToJson(this);
  factory UserTweetLibrary.fromJson(Map<String, dynamic> json,
          {String? storePath}) =>
      _$UserTweetLibraryFromJson(json).withPath(storePath);
}

@JsonSerializable()
class UserTweetLibraryItem extends Equatable {
  const UserTweetLibraryItem({
    required this.tweetId,
    required this.timeCreated,
  });

  final String tweetId;
  final DateTime timeCreated;

  @override
  List<Object?> get props => [tweetId, timeCreated];

  Map<String, dynamic> toJson() => _$UserTweetLibraryItemToJson(this);
  factory UserTweetLibraryItem.fromJson(Map<String, dynamic> json) =>
      _$UserTweetLibraryItemFromJson(json);
}
