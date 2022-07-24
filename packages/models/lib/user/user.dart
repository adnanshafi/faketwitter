import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
part 'keys.dart';

/// Model For User Data Stored For Fake Twitter

@JsonSerializable()
class UserData extends Equatable {
  const UserData({
    this.storePath = '',
    this.uid = '',
    this.userName = '',
    this.name = '',
    this.avatarUrl = '',
    this.description = '',
  });

  /// [storePath] : path of the user data object in firebaseFirestore
  @JsonKey(ignore: true)
  final String storePath;

  /// [uid] : uid of the user
  final String uid;

  /// [userName] : user name of the user
  final String userName;

  /// [name] : displayName
  final String name;

  /// [avatarUrl] : url of the user avatar stored in cloud_storage
  final String avatarUrl;

  /// [description] : single line description given by user
  final String description;

  /// [empty] : empty User with no data
  static const UserData empty = UserData();

  /// if empty
  bool get isEmpty => this == UserData.empty;

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  @override
  List<Object?> get props =>
      [uid, storePath, name, userName, avatarUrl, description];
}
