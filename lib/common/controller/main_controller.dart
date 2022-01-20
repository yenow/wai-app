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

  // observable variable
  final currentIndex = 0.obs;   // 현재 페이지 인덱스
  final currentPage = "page1".obs;
  final pageKeys = <String>["page1","page2","page3","page4","page5"].obs;
  final isPageOpen = {}.obs;
  final isPostPageOpen = false.obs;
  final appBarState = AppbarState(appbarSize: 260, appbarTitle: 'WAI').obs;   // appbar 상태
  final isTest = false.obs;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
      "page1": GlobalKey<NavigatorState>(),
      "page2": GlobalKey<NavigatorState>(),
      "page3": GlobalKey<NavigatorState>(),
      "page4": GlobalKey<NavigatorState>(),
      "page5": GlobalKey<NavigatorState>(),
  };
  final currentTab = "page1".obs;

  /* false : 앱 종료 x, pop이됨   true : 앱 종료*/
  Future<bool> onWillPop() async {
    setIsPostPageOpen(false);
    // 여러 키를 확인해서 나갈수 있게 해야할듯
    print(!await navigatorKeys["page2"]!.currentState!.maybePop());   // maybePop()  Pop할게 있으면 Pop하고 아니면 종료

    switch (currentIndex.value) {
      case 0 :
        return true;
      case 1:
        return !await navigatorKeys["page2"]!.currentState!.maybePop();
      case 2 :
        return true;
      case 3 :
        return true;
      case 4 :
        return true;
    }

    return !await navigatorKeys["page2"]!.currentState!.maybePop();
    //return !await navigatorKey.currentState!.maybePop();    // 수정필요
  }

  void back() {
    setIsPostPageOpen(false);
    onWillPop();
  }

  void changeMainPageIndex(int nextPageIndex) {
    currentIndex.value = nextPageIndex;
  }

  void setIsPostPageOpen (bool bool) {
    
    // true이면, 뒤로가기 버튼 활성화
    if (bool) {
      Logger().d('changeToListLeading');
      changeToListLeading();
      
    } else {
      Logger().d('changeToPopLeading');
      changeToPopLeading();
      
    }
    
    isPostPageOpen.value = bool;
  }

  bool isLeading() {
    return isPostPageOpen.value == true;
  }

  void changeToPopLeading() {

    appBarState.update((val) {
      val!.isPopPage = false;
    });
  }

  void changeToListLeading() {

    appBarState.update((val) {
      val!.isPopPage = true;
    });
  }

  /* Appbar바 변경 */
  void changeAppbar({required double height, required bool isBackgroundImage}) {

    appBarState.update((val) {
      val!.appbarSize = height;
      val!.isBackgroundImage = isBackgroundImage;
    });
  }

}