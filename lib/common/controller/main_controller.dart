import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/common/controller/user_profile_controller.dart';
import 'package:wai/sample/add_interactivity.dart';
import 'package:wai/common/utils/app_state.dart';
import 'package:wai/common/utils/logger.dart';

enum TabItem { homePageScreen, postPageScreen, searchPageScreen ,enneagramPageScreen, profilePageScreen }

extension ParseToString on TabItem {
  String get name {
    return this.toString().split('.').last;
  }
}

class MainController extends GetxController{
  static MainController get to => Get.put(MainController());

  /* observable variable */
  final currentTabIndex = 0.obs;   // 현재 페이지 인덱스
  final isShowEnneagramDialog = false.obs;
  final pageDeptCount = 0.obs;

  Future<bool> initMainScreens() async {
    // 삭제 예정
    await UserController.to.initUserInfo();
    await UserProfileController.to.initUserProfile();


    await PostController.to.initPosts();
    // await PostController.to.init
    return true;
  }

  void setTabIndex(int nextTabIndex) {
    currentTabIndex.value = nextTabIndex;
  }

  void setIsShowEnneagramDialog(bool bool) {
    isShowEnneagramDialog.value = bool;
  }
}