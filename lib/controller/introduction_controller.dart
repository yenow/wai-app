import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/models/introduction_message.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/sign_up_screen/sign_up_screen.dart';

class IntroductionController extends GetxController {
  static IntroductionController get to => Get.find();
  final introductionPageIndex = 0.obs;

  final items = [
    IntroductionMessage(
        titleText: "환영합니다!",
        subText : "에니어그램은 사람을 9가지 성격으로 분류하는 성격유형 이론입니다.",
        imageUrl: "assets/images/icon/welcome-back.png"),
    IntroductionMessage(
        titleText: "나는 어떤 사람?",
        subText : "에니어그램 테스트를 통해 내가 어떤 유형의 사람인지 알아보아요.",
        imageUrl: "assets/images/icon/test.png"),
    IntroductionMessage(
        titleText: "나와 비슷한 사람이 있을까?",
        subText : "게시글에서 나와 비슷한 사람끼리 이야기를 나눠보아요",
        imageUrl: "assets/images/icon/social-network.png"),
  ];
  final pageController = PageController();
  final currentPageNotifier = ValueNotifier<int>(0);

  void setIntroducePageIndex(int index) {
    introductionPageIndex(index);
    IntroductionController.to.currentPageNotifier.value = index;
  }

  bool isLastPage(int pageIndex) {
    if (pageIndex == items.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void clickNextButton() {
    introductionPageIndex(introductionPageIndex.value + 1);
    currentPageNotifier.value = introductionPageIndex.value;
    pageController.animateToPage(
        introductionPageIndex.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut
    );
  }

  void clickStartButton() {
    // todo 임시로 주석 AppController.to.writeIsWatchIntroducePage("Y");
    Get.offAllNamed(WaiRoutes.signUp);
  }
}