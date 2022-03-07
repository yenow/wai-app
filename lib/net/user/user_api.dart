import 'dart:convert';

import 'package:wai/controller/app_controller.dart';
import 'package:wai/controller/user_controller.dart';
import 'package:wai/common/controller/user_profile_controller.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/data/dto/user_request_dto.dart';
import 'package:wai/data/model/user.dart';

Future<void> initUserInfo() async {

    UserRequestDto userRequestDto = UserRequestDto(
        userKey: AppController.to.loginInfo.value.userKey
    );

    var response = await postRequest("/api/user/getUserInformation", json.encode(userRequestDto));
    UserController.to.user.value = User.fromJson(json.decode(response));


    if (UserController.to.user.value.userId == null) {
      UserRequestDto requestDto = UserRequestDto(userKey: AppController.to.loginInfo.value.userKey);
      var responseBody = await postRequest("/api/saveUserKey",json.encode(requestDto.toJson()));
      int userId = json.decode(responseBody);

      /* save userId */
      UserController.to.user.value.userId = userId;
    }
}