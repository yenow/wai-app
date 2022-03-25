import 'dart:convert';

import 'package:wai/common/utils/api.dart';
import 'package:wai/common/utils/api_util.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/model/user/user_request_dto.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:http/http.dart' as http;
import 'package:wai/data/model/wai_error.dart';

class UserApiProvider {

  getUserInformation(UserRequestDto userRequestDto) async {
    if (userRequestDto.userKey.isEmpty) return User();

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

  getUserEnneagramTests(User user) async {
    if (user.userKey.isEmpty) {
      return;
    }

    http.Response response = await postApiRequest("/api/user/getUserEnneagramTests", user.toJson());

    var result = utf8Decoding(response);
    if (response.statusCode == 200) {
      List<EnneagramTest> enneagramTests = List<EnneagramTest>.from(
          result.map((model) {
            return EnneagramTest.fromJson(model);
          })
      );
      return enneagramTests;
    } else {
      loggerNoStack.e("error : api request error");
    }
  }
}