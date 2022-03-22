import 'package:get/get.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/common/utils/api.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/permernent/enneagram_controller.dart';
import 'package:wai/controller/permernent/enneagram_test_controller.dart';
import 'package:wai/controller/permernent/user_controller.dart';
import 'package:wai/data/model/user/user_request_dto.dart';

class InitialData {

  // Future<void> initialize() async {
  //   initController();
  //   // await initData();
  // }

  // static void initController() {
  //   Get.put<AppController>(AppController(), permanent: true);
  //   Get.put<EnneagramController>(EnneagramController(), permanent: true);
  //   Get.put<EnneagramTestController>(EnneagramTestController(), permanent: true);
  //   Get.put<UserController>(UserController(), permanent: true);
  // }

  static Future<void> initData() async {
    await AppController.to.initData();
    await signIn();

    String userKey = AppController.to.loginInfo.value.userKey;
    if (userKey.isNotEmpty) {
      await UserController.to.initData(UserRequestDto(
        userId: int.parse(AppController.to.loginInfo.value.userId),
        userKey: userKey)
      );
    }
  }
}