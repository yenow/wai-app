import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/permernent/enneagram_controller.dart';
import 'package:wai/controller/permernent/enneagram_test_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/client/enneagram_test_client.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test_request_dto.dart';
import 'package:wai/main.dart';
import 'package:wai/route.dart';

class WhoAmIController extends GetxController {
  static WhoAmIController get to => Get.find();

  final currentIndex = 0.obs;
  final buttonText = "유형을 선택해주세요.".obs;

  void changeCurrentIndex(int newIndex) {
    currentIndex(newIndex);
    buttonText(EnneagramController.to.enneagram[currentIndex]!.getFullName() + '으로 시작하기');
  }

  void selectEnneagramType() async {

    if (currentIndex.value == 0) {
      AppController.to.snackBarKey.currentState!.showSnackBar(WaiSnackBar.bottom(text: "9개의 유형중 하나를 선택해주세요"));

    } else {

      EnneagramTestRequestDto enneagramTestRequestDto = EnneagramTestRequestDto(
        userId: UserController.to.user.value.userId!.toString(),
        testType: TestType.select,
        myEnneagramType: currentIndex.value,
      );

      EnneagramTestClient(mainDio).doSelectedEnneagramTestResult(
          enneagramTestRequestDto: enneagramTestRequestDto,
          token: AppController.to.getJwtToken()
      ).then((value) {
        UserController.to.addUserEnneagramTest(value);
        Get.offAllNamed(WaiRoutes.initial, parameters: {"showEnneagramDialog": "Y"});
      });

      // var result = await whoAmIRepository.selectEnneagramType(enneagramTest);
      // MainController.to.setTabIndex(0);
      // Get.offAll(() => MainScreens(myEnneagramTest: myEnneagramTest));

    }
  }
}