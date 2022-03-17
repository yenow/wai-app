import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:wai/common/utils/api_util.dart';
import 'package:wai/constants/constants.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/data/model/wai_error.dart';

import '../../data/model/sign/sign.dart';

enum HttpMethod {
  post, get, read, put, delete
}

// Future<http.Response> apiRequest(String url, String jsonString, HttpMethod httpMethod) {
//
//   if (httpMethod == HttpMethod.post) {
//     return postApiRequest(url,jsonString);
//   }
//
//   return postApiRequest(url,jsonString);
// }

Future<http.Response> getApiRequest (String url) async {
  loggerNoStack.d(apiUrl + url);

  final http.Response response = await http.get(
      Uri.parse(apiUrl + url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
      }
  );

  return response;
}


Future<http.Response> postApiRequest(String url, Map jsonMap) async {
  loggerNoStack.d(apiUrl + url);
  loggerNoStack.d("request json string : " + json.encode(jsonMap));

  final http.Response response = await http.post(
      Uri.parse(apiUrl + url),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "authorization": "Bearer " + AppController.to.loginInfo.value.token
      },
      body: json.encode(jsonMap)
  );

  String bodyUtf8 = utf8.decode(response.bodyBytes);
  // var result = utf8Decoding(response);
  loggerNoStack.d("response json string : " + bodyUtf8);

  if (response.statusCode == 200) {

  } else if (response.statusCode == 401 || response.statusCode == 403) {
    WaiError error = WaiError.fromJson(json.decode(bodyUtf8));

    // TOKEN EXPIRED ERROR
    if (error.errorCode == "err-001") {
      await signIn();
      return await postApiRequest(url, jsonMap);
    }
  }

  return response;
}

//
// Future<http.Response> putApiRequest(String url, String jsonString) async {
//   loggerNoStack.d(apiUrl + url);
//   loggerNoStack.d("request json string : " + jsonString);
//
//   final http.Response response = await http.put(
//       Uri.parse(apiUrl + url),
//       headers: {
//         "Accept": "application/json",
//         "Content-Type": "application/json; charset=UTF-8",
//         "authorization": "Bearer " + AppController.to.loginInfo.value.token
//       },
//       body: jsonString
//   );
//
//   String bodyUtf8 = utf8.decode(response.bodyBytes);
//   // var result = utf8Decoding(response);
//   loggerNoStack.d("response json string : " + bodyUtf8);
//
//   if (response.statusCode == 200) {
//
//   } else if (response.statusCode == 401 || response.statusCode == 403) {
//     WaiError error = WaiError.fromJson(json.decode(bodyUtf8));
//
//     // TOKEN EXPIRED ERROR
//     if (error.errorCode == "err-001") {
//       await signIn();
//       return await postApiRequest(url, jsonString);
//     }
//   }
//
//   return response;
// }
//
// Future<http.Response> deleteApiRequest(String url, String jsonString) async {
//   loggerNoStack.d(apiUrl + url);
//   loggerNoStack.d("request json string : " + jsonString);
//
//   final http.Response response = await http.delete(
//       Uri.parse(apiUrl + url),
//       headers: {
//         "Accept": "application/json",
//         "Content-Type": "application/json; charset=UTF-8",
//         "authorization": "Bearer " + AppController.to.loginInfo.value.token
//       },
//       body: jsonString
//   );
//
//   String bodyUtf8 = utf8.decode(response.bodyBytes);
//   // var result = utf8Decoding(response);
//   loggerNoStack.d("response json string : " + bodyUtf8);
//
//   if (response.statusCode == 200) {
//
//   } else if (response.statusCode == 401 || response.statusCode == 403) {
//     WaiError error = WaiError.fromJson(json.decode(bodyUtf8));
//
//     // TOKEN EXPIRED ERROR
//     if (error.errorCode == "err-001") {
//       await signIn();
//       return await postApiRequest(url, jsonString);
//     }
//   }
//
//   return response;
// }


Future<void> signIn() async {
  loggerNoStack.d("signIn(get token)");

  final http.Response response = await http.post(
      Uri.parse(apiUrl + "/api/sign/signIn"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: json.encode(AppController.to.loginInfo.value.toJson())
  );

  String bodyUtf8 = utf8.decode(response.bodyBytes);
  Sign sign = Sign.fromJson(json.decode(bodyUtf8));
  AppController.to.loginInfo.value.token = sign.token;
}

