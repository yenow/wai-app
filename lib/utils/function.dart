import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:http/http.dart' as http;

Future<dynamic> postRequest (String url, String jsonString) async {

  Logger().d(apiUrl + url);

  final response = await http.post(
      Uri.parse(apiUrl + url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonString
  );
  
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to postRequest');
  }
}