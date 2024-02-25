import 'package:equatable/equatable.dart';

class ForgetPassModel extends Equatable {
  final String? statusMsg;
  final String? message;

  const ForgetPassModel({this.statusMsg, this.message});

  factory ForgetPassModel.fromJson(Map<String, dynamic> json) =>
      ForgetPassModel(
        statusMsg: json['statusMsg'] as String?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'statusMsg': statusMsg,
        'message': message,
      };

  @override
  List<Object?> get props => [statusMsg, message];
}
