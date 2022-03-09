import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/controller/permenent/post_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/common/utils/app_state.dart';
import 'package:wai/common/utils/logger.dart';

class MainController extends GetxController{
  static MainController get to => Get.find();

  /* observable variable */
  final currentTabIndex = 0.obs;   // 현재 페이지 인덱스
  final isShowEnneagramDialog = false.obs;
  /* non-observable variable */

  void setTabIndex(int nextTabIndex) {
    currentTabIndex.value = nextTabIndex;
  }

  void setIsShowEnneagramDialog(bool bool) {
    isShowEnneagramDialog.value = bool;
  }
}