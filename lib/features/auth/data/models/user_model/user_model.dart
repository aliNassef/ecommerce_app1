import 'package:equatable/equatable.dart';

import 'metadata.dart';
import 'user.dart';

class UserModel extends Equatable {
  final int? totalUsers;
  final Metadata? metadata;
  final List<User>? users;

  const UserModel({this.totalUsers, this.metadata, this.users});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        totalUsers: json['totalUsers'] as int?,
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
        users: (json['users'] as List<dynamic>?)
            ?.map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'totalUsers': totalUsers,
        'metadata': metadata?.toJson(),
        'users': users?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [totalUsers, metadata, users];
}
