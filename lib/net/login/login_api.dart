import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:wai/models/api_response/login_response_dto.dart';
import 'package:http/http.dart' as http;
import 'package:wai/models/simply_login_info.dart';

Future<LoginResponseDto> fetchLoginResponseDto(SimpleLoginInfo? simpleLoginInfo) async {
  final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/simpleLogin'),
      headers: {
        "Accept": "application/json",
        "content-type" : "application/json"
      },
      body: jsonEncode(simpleLoginInfo!.toJson())
  );

  Logger().d(response.statusCode);
  Logger().d(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return LoginResponseDto.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load LoginResponseDto');
  }
}