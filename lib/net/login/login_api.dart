import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:wai/controller/user_controller.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/models/api/login_response_dto.dart';
import 'package:http/http.dart' as http;
import 'package:wai/models/api/response_dto.dart';
import 'package:wai/data/dto/user_request_dto.dart';
import 'package:wai/data/model/user.dart';

// Future<LoginResponseDto> fetchLoginResponseDto(SimpleLoginInfo? simpleLoginInfo) async {
//   final response = await http.post(
//       Uri.parse('http://10.0.2.2:8080/api/simpleLogin'),
//       headers: {
//         "Accept": "application/json",
//         "content-type" : "application/json"
//       },
//       body: jsonEncode(simpleLoginInfo!.toJson())
//   );
//
//   Logger().d(response.statusCode);
//   Logger().d(response.body);
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return LoginResponseDto.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load LoginResponseDto');
//   }
// }

Future<bool> saveNickname(UserRequestDto userRequestDto) async {

  var response = await postRequest("/api/saveNickname", json.encode(userRequestDto.toJson()));

  Map<String, dynamic> map = json.decode(response);

  ResponseDto responseDto = ResponseDto.fromJson(json.decode(response));
  User user = User.fromJson(json.decode(response));

  // user.setDto(responseDto);
  //
  // if (user.errorCode == 1) {
  //   return false;
  // } else {
  //   UserController.to.user.value.nickname = user.nickname;
  //   return true;
  // }
  return false;
}