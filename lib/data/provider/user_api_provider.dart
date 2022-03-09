import 'dart:convert';

import 'package:wai/common/utils/api.dart';
import 'package:wai/common/utils/api_util.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/data/dto/user_request_dto.dart';
import 'package:wai/data/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:wai/data/model/wai_error.dart';

class UserApiProvider {

  getUserInformation(UserRequestDto userRequestDto) async {
    if (userRequestDto.userKey.isEmpty) return User(enneagramTests: [], posts: [], replys: []);

    http.Response response = await postApiRequest("/api/user/getUserInformation", userRequestDto.toJson());

    final jsonMap = utf8Decoding(response);
    if (response.statusCode == 200) {
      User user = User.fromJson(jsonMap);
      return user;

    } else if (response.statusCode == 400) {

      WaiError waiError = WaiError.fromJson(jsonMap);
      loggerNoStack.e("error : bad request : ${waiError.message}");

    } else {
      loggerNoStack.e("error : api request error");
    }
  }
}