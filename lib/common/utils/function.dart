import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:wai/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:wai/controller/permenent/app_controller.dart';

import 'logger.dart';

Future<dynamic> postRequest (String url, String jsonString) async {

  loggerNoStack.i("post request : $apiUrl$url");

  AppController.to.getServerTime();
  final response = await http.post(
      Uri.parse(apiUrl + url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8"
      },
      body: jsonString
  );
  
  if (response.statusCode == 200) {
    return utf8.decode(response.bodyBytes);
  } else {
    throw Exception('Failed to postRequest');
  }
}

Future<dynamic> getRequest (String url) async {
  loggerNoStack.i("get request : $apiUrl$url");

  AppController.to.getServerTime();
  final response = await http.get(
      Uri.parse(apiUrl + url),
  );


  if (response.statusCode == 200) {
    return utf8.decode(response.bodyBytes);
  } else {
    throw Exception('Failed to getRequest');
  }
}

Future<dynamic> getServerTimeRequest () async {

  final response = await http.get(
    Uri.parse(apiUrl + "/api/getServerTime"),
  );

  if (response.statusCode == 200) {
    return utf8.decode(response.bodyBytes);
  } else {
    throw Exception('Failed to postRequest');
  }
}