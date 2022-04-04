import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/data/client/enneagram_test_client.dart';
import 'package:wai/data/model/introduction_message.dart';
import 'package:wai/main.dart';
import 'package:wai/route.dart';
import '../common/utils/logger.dart';
import '../data/model/enneagram_test/enneagram_test_request_dto.dart';
import 'user/user_controller.dart';

class SimpleEnneagramTestController extends GetxController {
  static SimpleEnneagramTestController get to => Get.find();

  final currentPageIndex = 0.obs;
  final currentUniqueString = "".obs;
  final selectSimpleTestMap = {
    1 : "",
    2 : ""
  }.obs;

  final pageController = PageController();
  final currentPageNotifier = ValueNotifier<int>(0);
  static const kDuration = Duration(milliseconds: 500);
  static const kCurve = Curves.ease;

  void changeCurrentUniqueString(String uniqueString) {
    currentUniqueString(uniqueString);
  }

  void setSimpleTestSelectMap({required int pageIndex ,required String uniqueString}) {
    selectSimpleTestMap.update(pageIndex,(value) => uniqueString);
  }

  void goNextPage() {
    if (selectSimpleTestMap[1] == "") {
      AppController.to.snackBarKey.currentState!.showSnackBar(WaiSnackBar.top(text: "문항을 선택해주세요."));
      return;
    }

    pageController.nextPage(duration: kDuration, curve: kCurve);
    currentPageIndex(currentPageIndex.value + 1);
  }


  void doSimpleEnneagramTest() async {

    if (!checkSimpleEnneagramTestValue()) {
      AppController.to.snackBarKey.currentState!.showSnackBar(WaiSnackBar.top(text: "문항을 선택해주세요."));
      return;
    }

    EnneagramTestRequestDto enneagramTestRequestDto = EnneagramTestRequestDto(
      userId: UserController.to.user.value.userId!.toString(),
      testType: TestType.simple,
      uniqueString: makeUniqueString(),
    );

    await EnneagramTestClient(mainDio).doSimpleEnneagramTest(
        enneagramTestRequestDto: enneagramTestRequestDto,
        token: AppController.to.getJwtToken()
    ).then((value) {
      UserController.to.addUserEnneagramTest(value);
      if (Get.parameters['isInit'] == "N") {
        Get.offAllNamed(WaiRoutes.main, parameters: {"showEnneagramDialog": "Y"});
      } else {
        Get.offAllNamed(WaiRoutes.initial, parameters: {"showEnneagramDialog": "Y"});
      }
      selectSimpleTestMap[1] = "";
      selectSimpleTestMap[2] = "";
    });
  }

  bool checkSimpleEnneagramTestValue() {
    if (selectSimpleTestMap[2] == "" || selectSimpleTestMap[1] == "") {
      return false;
    }
    return true;
  }

  String makeUniqueString() {
    return selectSimpleTestMap[1]! + selectSimpleTestMap[2]!;
  }
}