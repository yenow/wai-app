

import 'dart:convert';

import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/common/controller/user_profile_controller.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/models/user/api/user_request_dto.dart';
import 'package:wai/models/user/user.dart';

Future<bool> initUserInfo() async {

  if (AppController.to.userId.value.isNotEmpty) {
    UserRequestDto userRequestDto = UserRequestDto(
        userId: int.parse(AppController.to.userId.value),
        userKey: AppController.to.userKey.value
    );

    var response = await postRequest("/api/getUserInfomation", json.encode(userRequestDto));
    UserController.to.user.value = User.fromJson(json.decode(response));

    UserProfileController.to.initCurrentEnneagram();
  }
  return true;
}