import 'package:movies_project/enums/NetworkResponseStatus.dart';

class ApiResponse {
  int? statusCode;
  NetworkResponseStatus? status;
  Map<String, dynamic> body;

  ApiResponse(
      {required this.statusCode, required this.status, required this.body});
}
