// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tweet_library.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTweetLibrary _$UserTweetLibraryFromJson(Map<String, dynamic> json) =>
    UserTweetLibrary(
      uid: json['uid'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => UserTweetLibraryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserTweetLibraryToJson(UserTweetLibrary instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

UserTweetLibraryItem _$UserTweetLibraryItemFromJson(
        Map<String, dynamic> json) =>
    UserTweetLibraryItem(
      tweetId: json['tweetId'] as String,
      timeCreated: DateTime.parse(json['timeCreated'] as String),
    );

Map<String, dynamic> _$UserTweetLibraryItemToJson(
        UserTweetLibraryItem instance) =>
    <String, dynamic>{
      'tweetId': instance.tweetId,
      'timeCreated': instance.timeCreated.toIso8601String(),
    };
