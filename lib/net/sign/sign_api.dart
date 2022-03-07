
import 'dart:convert';

import 'package:wai/common/utils/function.dart';
import 'package:wai/data/dto/sign_request_dto.dart';

Future<void> signUpAsNonMemberRequest(SignRequestDto signRequestDto) async {

  var response = await postRequest("/api/saveNickname", json.encode(signRequestDto.toJson()));

  Map<String, dynamic> map = json.decode(response);


}