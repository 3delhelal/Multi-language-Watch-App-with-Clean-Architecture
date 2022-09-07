import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> jsonMap) {
    return ErrorMessageModel(
        statusCode: jsonMap['status_code'],
        statusMessage: jsonMap['status_message'],
        success: jsonMap['success']);
  }

  @override
  List<Object?> get props => [statusCode, statusMessage, success];
}
