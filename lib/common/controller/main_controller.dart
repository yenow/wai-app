import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/utils/app_state.dart';

enum TabItem { homePageScreen, postPageScreen, enneagramPageScreen, page4, profilePageScreen }

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
  // final isPageOpen = { PageItem.postPage : false, PageItem.postWritePage : false }.obs;
  final pageDeptCount = 0.obs;

  /* non-observable variable */
  final pageKeys = [TabItem.homePageScreen.name,
    TabItem.postPageScreen.name,
    TabItem.enneagramPageScreen.name,
    TabItem.page4.name,
    TabItem.profilePageScreen.name
  ];
  final Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
      TabItem.homePageScreen.name: GlobalKey<NavigatorState>(),
      TabItem.postPageScreen.name: GlobalKey<NavigatorState>(),
      TabItem.enneagramPageScreen.name: GlobalKey<NavigatorState>(),
      TabItem.page4.name: GlobalKey<NavigatorState>(),
      TabItem.profilePageScreen.name: GlobalKey<NavigatorState>(),
  };

  Future<bool> onWillPop() async {
    goOutOfPage();

    switch (currentTabIndex.value) {
      case 0 :
        return true;
      case 1:
        return !await navigatorKeys[TabItem.postPageScreen.name]!.currentState!.maybePop();   // page를 빠져나가면 true를 반환, 아니면 false
      case 2 :
        return true;
      case 3 :
        return true;
      case 4 :
        return true;
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

  void goIntoPage() {
    pageDeptCount.value++;
  }

  void goOutOfPage() {
    pageDeptCount.value--;
  }
}