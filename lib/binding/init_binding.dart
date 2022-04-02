import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:wai/controller/ban_user_controller.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/permernent/enneagram_controller.dart';
import 'package:wai/controller/permernent/enneagram_test_controller.dart';
import 'package:wai/controller/post/my_enneagram_post_controller.dart';
import 'package:wai/controller/post/my_post_controller.dart';
import 'package:wai/controller/post/popular_post_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/controller/post/all_post_controller.dart';

import '../controller/notice_controller.dart';
import '../controller/post/post_background_image_controller.dart';

class InitBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<AppController>(AppController(), permanent: true);
    Get.put<EnneagramController>(EnneagramController(), permanent: true);
    Get.put<EnneagramTestController>(EnneagramTestController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<AllPostController>(AllPostController(), permanent: true);
    Get.put<MyPostController>(MyPostController(), permanent: true);
    Get.put<MyEnneagramPostController>(MyEnneagramPostController(), permanent: true);
    Get.put<PopularController>(PopularController(), permanent: true);
    Get.put<NoticeController>(NoticeController(), permanent: true);
    Get.put<PostBackgroundImageController>(PostBackgroundImageController(), permanent: true);
    Get.put<BanUserController>(BanUserController(), permanent: true);
  }
}