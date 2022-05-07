import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies_project/enums/NetworkResponseStatus.dart';
import 'package:movies_project/models/api_response.dart';
import 'package:http/http.dart' as http;

abstract class Http {
  Future<ApiResponse> getHandler(
      String url, Map<String, String> queryParameters) async {
    late http.Response data;

    try {
      data = await http.get(Uri.http(url, "", queryParameters));
      if (data.statusCode == 200) {
        return ApiResponse(
            statusCode: data.statusCode,
            status: NetworkResponseStatus.OK,
            body: jsonDecode(data.body));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return ApiResponse(
        statusCode: data.statusCode,
        status: NetworkResponseStatus.FAILED,
        body: {});
  }
}
