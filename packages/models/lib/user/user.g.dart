// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserFromJson(Map<String, dynamic> json) => UserData(
      uid: json['uid'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$UserToJson(UserData instance) => <String, dynamic>{
      'uid': instance.uid,
      'userName': instance.userName,
      'avatarUrl': instance.avatarUrl,
      'description': instance.description,
    };
