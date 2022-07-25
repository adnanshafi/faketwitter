// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tweet _$TweetFromJson(Map<String, dynamic> json) => Tweet(
      storePath: json['storePath'] as String? ?? '',
      creatorUid: json['creatorUid'] as String? ?? '',
      text: json['text'] as String? ?? '',
      likes: json['likes'] as int? ?? 0,
      mentions: (json['mentions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      hashTags: (json['hashTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      timeCreated: json['timeCreated'] == null
          ? null
          : DateTime.parse(json['timeCreated'] as String),
    );

Map<String, dynamic> _$TweetToJson(Tweet instance) => <String, dynamic>{
      'storePath': instance.storePath,
      'creatorUid': instance.creatorUid,
      'timeCreated': instance.timeCreated.toIso8601String(),
      'text': instance.text,
      'likes': instance.likes,
      'hashTags': instance.hashTags,
      'mentions': instance.mentions,
    };
