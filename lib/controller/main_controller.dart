import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/controller/my_page_controller.dart';
import 'package:wai/controller/post/post_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/common/utils/app_state.dart';
import 'package:wai/common/utils/logger.dart';

enum MainTap {
  home, search, add, notice , profile
}

class MainController extends GetxController{
  static MainController get to => Get.find();

  /* observable variable */
  final currentTabIndex = 0.obs;   // 현재 페이지 인덱스
  final isShowEnneagramDialog = false.obs;
  final appState = AppState().obs;

  /* non-observable variable */
  final PageController pageController = PageController(keepPage: false);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    Get.put(MyPageController());
    super.onInit();
  }

  void setTabIndex(int nextTabIndex) {
    if (MainTap.values[nextTabIndex] != MainTap.add) {
      currentTabIndex(nextTabIndex);
      pageController.jumpToPage(nextTabIndex);
    }
    // Get.bottomSheet(MainBottomSheet());
  }

  void setIsShowEnneagramDialog(bool bool) {
    isShowEnneagramDialog.value = bool;
  }

  Future<bool> onBackKey() async {
    bool result = await WaiDialog.dialogConfirmation('알림', '정말 종료하시겠습니까?', '아니요', '예');
    if (result) {
      SystemNavigator.pop();
    }
    return result;
  }
}
