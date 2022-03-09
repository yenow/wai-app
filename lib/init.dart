import 'package:get/get.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/common/utils/api.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/permenent/enneagram_controller.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/data/dto/user_request_dto.dart';

class Init {

  Future<void> initialize() async {
    initController();
    // await initData();
  }

  void initController() {
    Get.put<AppController>(AppController(), permanent: true);
    Get.put<EnneagramController>(EnneagramController(), permanent: true);
    Get.put<EnneagramTestController>(EnneagramTestController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
  }

  Future<void> initData() async {
    await AppController.to.getLoginInfo();
    await AppController.to.getIsWatchIntroducePage();
    await signIn();

    await EnneagramController.to.initEnneagram();

    await EnneagramTestController.to.initEnneagramQuestionList();
    await EnneagramTestController.to.initSimpleEnneagramQuestionList();


    String userKey = AppController.to.loginInfo.value.userKey;
    await UserController.to.initUser(UserRequestDto(userKey: userKey));
    UserProfileController.to.initCurrentEnneagram();    // 수정 필요
    // await initAllPosts();
  }
}