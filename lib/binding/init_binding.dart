import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/permernent/enneagram_controller.dart';
import 'package:wai/controller/permernent/enneagram_test_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/controller/post/all_post_controller.dart';

class InitBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<AppController>(AppController(), permanent: true);
    Get.put<EnneagramController>(EnneagramController(), permanent: true);
    Get.put<EnneagramTestController>(EnneagramTestController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<AllPostController>(AllPostController(), permanent: true);
  }
}