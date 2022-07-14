import 'package:equatable/equatable.dart';

/// [User] : Model For User
class User extends Equatable {
  const User({required this.uid});

  /// [uid] : Stores the Firebase UID of the user
  final String uid;

  /// An Empty User
  static const User empty = User(uid: '-1');

  bool get isEmpty => this == empty;

  User copyWith({String? uid}) => User(uid: uid ?? this.uid);

  @override
  List<Object?> get props => [uid];
}
