import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wai/models/post_item.dart';
import 'package:wai/models/simply_login_info.dart';
import 'package:wai/screens/enneagram_test_page/simple_enneagram_test_page_screen.dart';

class Controller extends GetxController{
  static Controller get to => Get.put(Controller());

  final pageController = PageController();
  final currentPageNotifier = ValueNotifier<int>(0);























  RxInt count = 0.obs;
  final isGenderList = <bool>[true,false].obs;
  final postItems = <PostItem>[].obs;
  final simpleLoginInfo = Rxn<SimpleLoginInfo>(SimpleLoginInfo(year: 2021, month: 1, day: 1)); // DateTime.now().year
  // final simpleLoginInfo = SimpleLoginInfo(year: 2021, month: 1, day: 1).obs; // DateTime.now().year

  setSimpleLoginInfoYear(int newYear) => simpleLoginInfo.value!.year = newYear;

  setNickname(String value) => simpleLoginInfo.value!.nickname = value;

  setBirthDay(String value) => simpleLoginInfo.value!.birthDay = value;

  setGender(int index) => {

    if (index == 0) {
      simpleLoginInfo.value!.gender = 'man',
      isGenderList.value = <bool>[true,false].obs
    } else if (index == 1) {
      simpleLoginInfo.value!.gender = 'woman',
      isGenderList.value = <bool>[false,true].obs
    }
  };

  increment() => count++;
}