import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/models/reply/api/reply_request_dto.dart';
import 'package:wai/models/user/api/user_request_dto.dart';
import 'package:wai/models/user/user.dart';
import 'package:wai/utils/function.dart';

class UserController extends GetxController {
  static UserController get to => Get.put(UserController());

  final user = User().obs;
  
  Future<bool> initUserInfo() async {
    UserRequestDto userRequestDto = UserRequestDto(
        userId: int.parse(AppController.to.userId.value!),
        userKey:  AppController.to.userKey.value!
    );

    var response = await postRequest("/api/getUserInfomation", json.encode(userRequestDto));
    user.value = User.fromJson(json.decode(response));

    return true;
  }
}