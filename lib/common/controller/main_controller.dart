import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:wai/utils/appbar_state.dart';

enum TabItem { homePageScreen, postPageScreen, page3, page4, profilePageScreen }

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
  final appBarState = AppbarState(appbarSize: 260, appbarTitle: 'WAI').obs;   // appbar 상태

  /* non-observable variable */
  final pageKeys = [TabItem.homePageScreen.name,
    TabItem.postPageScreen.name,
    TabItem.page3.name,
    TabItem.page4.name,
    TabItem.profilePageScreen.name
  ];
  final Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
      TabItem.homePageScreen.name: GlobalKey<NavigatorState>(),
      TabItem.postPageScreen.name: GlobalKey<NavigatorState>(),
      TabItem.page3.name: GlobalKey<NavigatorState>(),
      TabItem.page4.name: GlobalKey<NavigatorState>(),
      TabItem.profilePageScreen.name: GlobalKey<NavigatorState>(),
  };

  Future<bool> onWillPop() async {
    setIsPopPage(false);

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

  void setIsPopPage(bool bool) {
    appBarState.update((val) {
      val!.isPopPage = bool;
    });
  }

  /* Appbar바 변경 */
  void changeAppbar({required double height, required bool isBackgroundImage}) {

    appBarState.update((val) {
      val!.appbarSize = height;
      val!.isBackgroundImage = isBackgroundImage;
    });
  }

  void test() {
    print(navigatorKeys[TabItem.postPageScreen.name]!.currentState!.canPop());
  }
}