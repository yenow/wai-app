import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/models/enneagram_test/enneagram_test.dart';
import 'package:wai/models/reply/api/reply_request_dto.dart';
import 'package:wai/models/user/api/user_request_dto.dart';
import 'package:wai/models/user/user.dart';
import 'package:wai/utils/function.dart';

class UserProfileController extends GetxController {
  static UserProfileController get to => Get.put(UserProfileController());

  final currentEnneagram = EnneagramTest().obs;

  Future<void> initUserProfile() async {
    List<EnneagramTest> list =  UserController.to.user.value.enneagramTests!;

    if (list.length == 0) {
      currentEnneagram.value.myEnneagramType = 0;
    } else {
      currentEnneagram.value = list.elementAt(0);
    }
  }

  void updateCurrentEnneagram ({required String insertDate}) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');

    List<EnneagramTest> list =  UserController.to.user.value.enneagramTests!;
    for (EnneagramTest temp in list) {

      if (formatter.format(temp.insertDate!) == insertDate) {
        currentEnneagram.value = temp;
        /*currentEnneagram.update((val) {
          val =
        });*/
      }
    }

  }
}