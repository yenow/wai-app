import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:wai/controller/ban_user_controller.dart';
import 'package:wai/controller/notice_controller.dart';
import 'package:wai/controller/post/all_post_controller.dart';
import 'package:wai/controller/post/my_enneagram_post_controller.dart';
import 'package:wai/controller/post/my_post_controller.dart';
import 'package:wai/controller/post/popular_post_controller.dart';
import 'package:wai/controller/post/post_background_image_controller.dart';
import 'package:wai/controller/post/post_controller.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/common/utils/api.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/permernent/enneagram_controller.dart';
import 'package:wai/controller/permernent/enneagram_test_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/client/sign_client.dart';
import 'package:wai/data/model/sign/sign.dart';
import 'package:wai/data/model/sign/sign_request_dto.dart';
import 'package:wai/data/model/user/user_request_dto.dart';
import 'package:wai/data/model/wai_error.dart';
import 'package:wai/main.dart';

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
    await PostBackgroundImageController.to.initImage();
    await AppController.to.initData();

    await SignClient(mainDio).signIn(signRequestDto: SignRequestDto(
      userKey: AppController.to.loginInfo.value.userKey,
      password: AppController.to.loginInfo.value.password,
    )).then((value) async {

      AppController.to.setLoginInfo(value);
      await initUserData();

    }).catchError((Object error) {

      if (error.runtimeType == DioError) {
        DioError dioError = error as DioError;
        WaiError waiError = WaiError.fromJson(dioError.response?.data);
        if (waiError.errorCode == 'err-203') {
          return ;
        }
      }
    });
  }

  static Future<void> initUserData() async {
    String userKey = AppController.to.loginInfo.value.userKey;
    if (userKey.isNotEmpty) {
      await UserController.to.initData(
          UserRequestDto(
              userId: int.parse(AppController.to.loginInfo.value.userId),
              userKey: userKey
          )
      );
    }

    if (UserController.to.user.value.userKey.isNotEmpty) {
      await NoticeController.to.getNotices();

      await AllPostController.to.getPost();
      await MyPostController.to.getPosts();
      await PopularController.to.getPosts();
      if (UserController.to.userEnneagramTests.isNotEmpty) {
        await MyEnneagramPostController.to.getPosts();
      }
      await BanUserController.to.getBanUsers();
    }
  }
}