import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/data/model/enneagram_test.dart';
import 'package:wai/data/model/sign.dart';
import 'package:wai/data/provider/user_api_provider.dart';
import 'package:wai/models/reply/api/reply_request_dto.dart';
import 'package:wai/data/dto/user_request_dto.dart';
import 'package:wai/data/model/user.dart';
import 'package:wai/common/utils/function.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  final UserApiProvider userApiProvider = UserApiProvider();

  final user = User().obs;
  final userEnneagramTests = <EnneagramTest>[].obs;
  final currentEnneagramTest = EnneagramTest().obs;
  final postVisitHistory = <int, DateTime>{}.obs;

  Future<void> initData(UserRequestDto userRequestDto) async {
    await initUser(UserRequestDto(userKey: userRequestDto.userKey));
    await initUserEnneagramTests();
    initCurrentEnneagramTest();
  }

  Future<void> initUser(UserRequestDto userRequestDto) async {
    var result = await userApiProvider.getUserInformation(userRequestDto);
    if (result is User) {
      user(result);
    }
  }

  Future<void> initUserEnneagramTests() async {
    var result = await userApiProvider.getUserEnneagramTests(user.value);

    if (result is List<EnneagramTest>) {
      userEnneagramTests(result);
    }
  }

  void initCurrentEnneagramTest() {
    if (userEnneagramTests.isNotEmpty) {
      currentEnneagramTest.value = userEnneagramTests.elementAt(0);
    }
  }


  void updateUser(Sign sign) {
    user.value.setUserBySign(sign);
  }

  void updateUserEnneagram(EnneagramTest response) {
    userEnneagramTests.insert(0, response);
    currentEnneagramTest(response);
  }

  void updatePostVisitHistory(int postId) {
    if (!postVisitHistory.containsKey(postId)) {
      postVisitHistory[postId] =  DateTime.now();
    } else {
      postVisitHistory.update(postId, (value) => DateTime.now());
    }
  }

  // void addEnneagramTestResult(EnneagramTest enneagramTest) {
  //   user.update((val) {
  //     val!.enneagramTests.insert(0, enneagramTest);
  //   });
  // }

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