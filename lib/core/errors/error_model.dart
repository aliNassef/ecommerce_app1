import '../api/end_ponits.dart';

class ErrorModel {
  final String statusMsg;
  final String message;

  ErrorModel({required this.statusMsg, required this.message});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      statusMsg: jsonData[ApiKey.statusMsg],
      message: jsonData[ApiKey.message],
    );
  }
}
