import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/controller/app_controller.dart';
import 'package:wai/common/controller/user_profile_controller.dart';
import 'package:wai/models/enneagram_test/enneagram_test.dart';
import 'package:wai/models/reply/api/reply_request_dto.dart';
import 'package:wai/models/user/api/user_request_dto.dart';
import 'package:wai/models/user/user.dart';
import 'package:wai/common/utils/function.dart';

class UserController extends GetxController {
  static UserController get to => Get.put(UserController());

  final user = User().obs;
  final postVisitHistory = <int, DateTime>{}.obs;

  void updatePostVisitHistory(int postId) {
    if (!postVisitHistory.containsKey(postId)) {
      postVisitHistory[postId] =  DateTime.now();
    } else {
      postVisitHistory.update(postId, (value) => DateTime.now());
    }
  }

  void addEnneagramTestResult(EnneagramTest enneagramTest) {
    user.update((val) {
      val!.enneagramTests.insert(0, enneagramTest);
    });
  }

  bool? canUpdateCount(int postId) {
    if (!postVisitHistory.containsKey(postId)) {
      return true;
    } else if (DateTime.now().difference(postVisitHistory[postId]!).inMinutes > 30) {
      return true;
    } else {
      return false;
    }
  }
  
  
}