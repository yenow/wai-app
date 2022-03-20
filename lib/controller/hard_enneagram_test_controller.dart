import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/permernent/enneagram_test_controller.dart';
import 'package:wai/data/client/enneagram_test_client.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test_request_dto.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test.dart';
import 'package:wai/data/model/introduction_message.dart';
import 'package:wai/main.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/sign_up_screen/sign_up_screen.dart';

import 'permernent/user_controller.dart';

class HardEnneagramTestController extends GetxController {
  static HardEnneagramTestController get to => Get.find();
  // HardEnneagramTestRepository hardEnneagramTestRepository;
  // HardEnneagramTestController({required this.hardEnneagramTestRepository});

  final currentPageIndex = 0.obs;
  final buttonTitle = "다음".obs;

  final pageController = PageController();
  static const kDuration = Duration(milliseconds: 500);
  static const kCurve = Curves.ease;

  List<String> notificationList = [
    "가능한 보통이다는 피해주는게 좋아요!",
    "너무 깊게 생각하지말고 체크해주세요!",
    "솔직하게 체크해주세요!",
    "세상에 사람을 완벽하게 이해할 수 있는 도구는 없어요! 개인마다 모두 차이가 있어요!",
    "에니어그램은 내 단점을 통해 찾는게 더 쉬울수 있어요!",
    "에니어그램을 통해 내 단점을 마주할수 있어요. 하지만 자신의 단점을 마주하면서 너무 자책하지 않아도 되요. 고쳐나가면 되니까요!",
    "너무 질문이 많으신가요? 그래도 조금만 참아주세요! 더 정확한 결과를 위해서니까요.",
    "에니어그램을 통해 남을 평가할 필요는 없어요.",
    "에니어그램은 표지판이에요. 가는 길은 본인이 정해요!",
  ];

  void clickNextButton() {
    if (EnneagramTestController.to.checkCurrentPageEnneagramQuestionList(currentPageIndex.value)) {
      pageController.nextPage(duration: kDuration, curve: kCurve);
      currentPageIndex(currentPageIndex.value + 1);
      changeButtonText();
    } else {
      AppController.to.snackBarKey.currentState!.showSnackBar(
          WaiSnackBar.top(text: '선택하지 않은 문항이 있습니다.'));
    }
  }

  void changeButtonText() {
    if (isLastPage()) {
      buttonTitle.value = '완료';
    } else {
      buttonTitle.value = '다음';
    }
  }

  void saveEnneagramTest() async {

    if (!EnneagramTestController.to.checkEnneagramQuestionList()) {
      AppController.to.snackBarKey.currentState!.showSnackBar(WaiSnackBar.bottom(text: "선택하지 않은 문항이 있습니다."));

    } else {

      EnneagramTestRequestDto enneagramTestRequestDto = EnneagramTestRequestDto(
        userId: UserController.to.user.value.userId!.toString(),
        testType: TestType.hard,
        type1Score: EnneagramTestController.to.getScoreByEneagramType(1),
        type2Score: EnneagramTestController.to.getScoreByEneagramType(2),
        type3Score: EnneagramTestController.to.getScoreByEneagramType(3),
        type4Score: EnneagramTestController.to.getScoreByEneagramType(4),
        type5Score: EnneagramTestController.to.getScoreByEneagramType(5),
        type6Score: EnneagramTestController.to.getScoreByEneagramType(6),
        type7Score: EnneagramTestController.to.getScoreByEneagramType(7),
        type8Score: EnneagramTestController.to.getScoreByEneagramType(8),
        type9Score: EnneagramTestController.to.getScoreByEneagramType(9),
      );

      EnneagramTestClient(mainDio).doHardEnneagramTest(
          enneagramTestRequestDto: enneagramTestRequestDto,
          token: AppController.to.getJwtToken()
      ).then((value) {
        UserController.to.addUserEnneagramTest(value);
        Get.offAllNamed(WaiRoutes.main, parameters: {"showEnneagramDialog": "Y"});
      });
    }
  }

  bool isLastPage() {
    int lastPageIndex = EnneagramTestController.to.enneagramPageList.length - 1;

    if (currentPageIndex.value == lastPageIndex) {
      return true;
    } else {
      return false;
    }
  }
}