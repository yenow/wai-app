import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/app_controller.dart';
import 'package:wai/data/model/error.dart';
import 'package:wai/models/sign/sign_dto.dart';

enum HttpMethod {
  post, get, read, put, delete
}

Future<http.Response> apiRequest(String url, String jsonString, HttpMethod httpMethod) {

  if (httpMethod == HttpMethod.post) {
    return postApiRequest(url,jsonString);
  }

  return postApiRequest(url,jsonString);
}

Future<http.Response> postApiRequest(String url, String jsonString) async {
  loggerNoStack.d(apiUrl + url);
  loggerNoStack.d(jsonString);

  final http.Response response = await http.post(
      Uri.parse(apiUrl + url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "authorization": "Bearer " + AppController.to.loginInfo.value.token
      },
      body: jsonString
  );

  String bodyUtf8 = utf8.decode(response.bodyBytes);
  WaiError error = WaiError.fromJson(json.decode(bodyUtf8));

  // TOKEN EXPIRED ERROR
  if (error.errorCode == "err-001") {
    await getToken();
    return await postApiRequest(url, jsonString);
  }

  return response;
}

Future<http.Response> getApiRequest (String url) async {
  loggerNoStack.d(apiUrl + url);

  final http.Response response = await http.get(
      Uri.parse(apiUrl + url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "authorization": "Bearer " + AppController.to.loginInfo.value.token
      }
  );

  return response;
}


Future<void> getToken() async {

  final http.Response response = await http.post(
      Uri.parse(apiUrl + "/api/sign/signIn"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "authorization": "Bearer " + AppController.to.loginInfo.value.token
      },
      body: AppController.to.loginInfo.value.toJson()
  );

  String bodyUtf8 = utf8.decode(response.bodyBytes);
  SignDto signDto = SignDto.fromJson(json.decode(bodyUtf8));
  AppController.to.loginInfo.value.token = signDto.token;
}