import 'package:equatable/equatable.dart';

import 'user.dart';

class SignInModel extends Equatable {
  final String? message;
  final User? user;
  final String? token;

  const SignInModel({this.message, this.user, this.token});

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
        'token': token,
      };

  @override
  List<Object?> get props => [message, user, token];
}
