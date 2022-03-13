import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/data/model/enneagram_test.dart';
import 'package:wai/data/repository/simple_enneagram_test_repository.dart';
import 'package:wai/models/introduction_message.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/sign_up_screen/sign_up_screen.dart';

import '../common/utils/logger.dart';
import '../data/dto/enneagram_test_request_dto.dart';
import 'permenent/enneagram_test_controller.dart';
import 'permenent/user_controller.dart';

class SimpleEnneagramTestController extends GetxController {
  static SimpleEnneagramTestController get to => Get.find();
  SimpleEnneagramTestRepository simpleEnneagramTestRepository;
  SimpleEnneagramTestController({required this.simpleEnneagramTestRepository});

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
    logger.d(selectSimpleTestMap);
  }

  void goNextPage() {
    if (selectSimpleTestMap[1] == "") {
      AppController.to.snackBarKey.currentState!.showSnackBar(WaiSnackBar.top(text: "문항을 선택해주세요."));
      return;
    }

    pageController.nextPage(duration: kDuration, curve: kCurve);
    currentPageIndex(currentPageIndex.value + 1);
  }


  void saveSimpleEnneagramTest() async {

    if (!checkSimpleEnneagramTestValue()) {
      AppController.to.snackBarKey.currentState!.showSnackBar(WaiSnackBar.top(text: "문항을 선택해주세요."));
      return;
    }

    EnneagramTestRequestDto enneagramTestRequestDto = EnneagramTestRequestDto(
      userId: UserController.to.user.value.userId!.toString(),
      testType: TestType.simple,
      uniqueString: makeUniqueString(),
    );
    var result = await simpleEnneagramTestRepository.saveSimpleEnneagramTest(enneagramTestRequestDto);

    if (result is EnneagramTest) {
      UserController.to.updateUserEnneagram(result); // todo
      Get.offAllNamed(WaiRoutes.main, parameters: {"showEnneagramDialog": "Y"});
    } else {
      loggerNoStack.e("saveSimpleEnneagramTest error");
    }
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