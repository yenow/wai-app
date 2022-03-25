import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/data/client/user_client.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test.dart';
import 'package:wai/data/model/sign/sign.dart';
import 'package:wai/data/provider/user_api_provider.dart';
import 'package:wai/data/model/reply/reply_request_dto.dart';
import 'package:wai/data/model/user/user_request_dto.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/main.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  final UserApiProvider userApiProvider = UserApiProvider();

  final user = User().obs;
  final likeys = <int>[].obs;
  final userEnneagramTests = <EnneagramTest>[].obs;
  final currentEnneagramTest = EnneagramTest().obs;

  Future<void> initData(UserRequestDto userRequestDto) async {
    await initUser(userRequestDto);
    await initUserEnneagramTests(userRequestDto);
    initCurrentEnneagramTest();
  }

  Future<void> initUser(UserRequestDto userRequestDto) async {
    if (userRequestDto.userId == null) return;
    if (userRequestDto.userKey.isEmpty) return;

    await UserClient(mainDio).getUserInformation(
        userRequestDto: userRequestDto,
        token: AppController.to.getJwtToken()
    ).then((value) {
      logger.d(value);
      user(value);
    });
  }


  Future<void> initUserEnneagramTests(UserRequestDto userRequestDto) async {
    if (userRequestDto.userKey.isEmpty) return;

    await UserClient(mainDio).getUserEnneagramTests(
        userRequestDto: userRequestDto,
        token: AppController.to.getJwtToken()
    ).then((value) {
      userEnneagramTests(value);
    });
  }

  void initCurrentEnneagramTest() {
    if (userEnneagramTests.isNotEmpty) {
      currentEnneagramTest.value = userEnneagramTests.elementAt(0);
    }
  }

  void updateUserBySign(Sign sign) {
    user.value.setUserBySign(sign);
  }

  void updateUser(User tempUser) {
    user(tempUser);
  }

  void addUserEnneagramTest(EnneagramTest response) {
    userEnneagramTests.insert(0, response);
    currentEnneagramTest(response);
  }


  // void updatePostVisitHistory(int postId) {
  //   if (!postVisitHistory.containsKey(postId)) {
  //     postVisitHistory[postId] =  DateTime.now();
  //   } else {
  //     postVisitHistory.update(postId, (value) => DateTime.now());
  //   }
  // }

  // void addEnneagramTestResult(EnneagramTest enneagramTest) {
  //   user.update((val) {
  //     val!.enneagramTests.insert(0, enneagramTest);
  //   });
  // }

  // bool? canUpdateCount(int postId) {
  //   if (!postVisitHistory.containsKey(postId)) {
  //     return true;
  //   } else if (DateTime.now().difference(postVisitHistory[postId]!).inMinutes > 30) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}