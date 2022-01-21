// import 'dart:convert';
// import 'dart:io';
//
// import 'package:http/http.dart' as http;
// import 'package:uuid/uuid.dart';
// import 'package:wai/models/api/login_response_dto.dart';
// import 'package:wai/models/simply_login_info.dart';
//
// void main() async {
//   SimpleLoginInfo simpleLoginInfo = SimpleLoginInfo(
//       nickname: 'nickname',
//       year: 2002,
//       month: 1,
//       day: 1,
//       birthDay: 'birthday',
//       gender: 'man'
//   );
//
//   Future<LoginResponseDto> aa = fetchLoginResponseDto(simpleLoginInfo);
//
// }
//
// Future<LoginResponseDto> fetchLoginResponseDto(SimpleLoginInfo simpleLoginInfo) async {
//   final response = await http.post(
//       Uri.parse('http://localhost:8080/api/simpleLogin'),
//       headers: {
//         "Accept": "application/json",
//         HttpHeaders.contentTypeHeader : "application/json"
//       },
//       body: jsonEncode(simpleLoginInfo.toJson())
//   );
//
//   print("statusCode: ${response.statusCode}");
//   print("headers: ${response.headers}");
//   print("body: ${response.body}");
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