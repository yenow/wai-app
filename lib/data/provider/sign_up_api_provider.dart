import 'dart:convert';

import 'package:wai/common/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:wai/common/utils/logger.dart';
import 'package:wai/data/model/sign.dart';
import 'package:wai/data/model/sign_request_dto.dart';
import 'package:wai/data/model/error.dart';
import 'package:wai/models/enneagram/enneagram.dart';

class SignUpApiProvider {

  signUpAsNonMember(SignRequestDto signRequestDto) async {
     http.Response response = await postApiRequest("/api/sign/signUpAsNonMember", signRequestDto.toJson());

     final map = json.decode(utf8.decode(response.bodyBytes));
     if (response.statusCode == 200) {
       Sign sign = Sign.fromJson(map);
       return sign;
     } else if (response.statusCode == 400) {
        WaiError error = WaiError.fromJson(map);
        return error;
     } else {
       loggerNoStack.e("error : api request error");
     }
  }
}