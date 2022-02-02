import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/sample/add_interactivity.dart';
import 'package:wai/utils/app_state.dart';
import 'package:wai/utils/logger.dart';

enum TabItem { homePageScreen, postPageScreen, searchPageScreen ,enneagramPageScreen, profilePageScreen }

extension ParseToString on TabItem {
  String get name {
    return this.toString().split('.').last;
  }
}

enum PageItem { postPage, postWritePage }

class MainController extends GetxController{
  static MainController get to => Get.put(MainController());

  /* observable variable */
  final currentTabIndex = 0.obs;   // 현재 페이지 인덱스
  final isShowEnneagramDialog = false.obs;
  // final isPageOpen = { PageItem.postPage : false, PageItem.postWritePage : false }.obs;
  final pageDeptCount = 0.obs;

  /* non-observable variable */
  final pageKeys = [
    TabItem.homePageScreen.name,
    TabItem.postPageScreen.name,
    TabItem.searchPageScreen.name,
    TabItem.enneagramPageScreen.name,
    TabItem.profilePageScreen.name
  ];
  final Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
      TabItem.homePageScreen.name: GlobalKey<NavigatorState>(),
      TabItem.postPageScreen.name: GlobalKey<NavigatorState>(),
      TabItem.searchPageScreen.name: GlobalKey<NavigatorState>(),
      TabItem.enneagramPageScreen.name: GlobalKey<NavigatorState>(),
      TabItem.profilePageScreen.name: GlobalKey<NavigatorState>(),
  };

  Future<bool> initMainPageState() async {
      await UserController.to.initUserInfo();
      return true;
  }

  Future<bool> onWillPop() async {
    goOutOfPage();

    switch (currentTabIndex.value) {
      case 0 :
        return !await navigatorKeys[TabItem.homePageScreen.name]!.currentState!.maybePop();
      case 1:
        return !await navigatorKeys[TabItem.postPageScreen.name]!.currentState!.maybePop();
      case 2 :
        return !await navigatorKeys[TabItem.enneagramPageScreen.name]!.currentState!.maybePop();
      case 3 :
        return !await navigatorKeys[TabItem.searchPageScreen.name]!.currentState!.maybePop();
      case 4 :
        return !await navigatorKeys[TabItem.profilePageScreen.name]!.currentState!.maybePop();
      default:
        return true;
    }
  }

  void back() {
    onWillPop();
  }

  void setTabIndex(int nextTabIndex) {
    currentTabIndex.value = nextTabIndex;
  }

  void goIntoPage({Widget? page}) {
    loggerNoStack.d("pageDeptCount.value : " + pageDeptCount.value.toString());
    pageDeptCount.value++;
  }

  void goOutOfPage() {
    loggerNoStack.d("pageDeptCount.value : " + pageDeptCount.value.toString());
    pageDeptCount.value--;
  }

  void setIsShowEnneagramDialog(bool bool) {
    isShowEnneagramDialog.value = bool;
  }

  void updateNavigationKeys() {
    navigatorKeys.update(TabItem.homePageScreen.name, (value) => GlobalKey<NavigatorState>());
    navigatorKeys.update(TabItem.postPageScreen.name, (value) => GlobalKey<NavigatorState>());
    navigatorKeys.update(TabItem.searchPageScreen.name, (value) => GlobalKey<NavigatorState>());
    navigatorKeys.update(TabItem.enneagramPageScreen.name, (value) => GlobalKey<NavigatorState>());
    navigatorKeys.update(TabItem.profilePageScreen.name, (value) => GlobalKey<NavigatorState>());
  }
}