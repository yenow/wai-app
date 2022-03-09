import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/permenent/enneagram_controller.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/data/dto/enneagram_test_request_dto.dart';
import 'package:wai/data/repository/who_am_i_repository.dart';

class WhoAmIController extends GetxController {
  static WhoAmIController get to => Get.find();
  final WhoAmIRepository whoAmIRepository;
  WhoAmIController({required this.whoAmIRepository});

  final currentIndex = 0.obs;
  final buttonText = "유형을 선택해주세요.".obs;

  void changeCurrentIndex(int newIndex) {
    currentIndex(newIndex);
    buttonText(EnneagramController.to.enneagram![currentIndex]!.getFullName() + '으로 시작하기');
  }

  void selectEnneagramType() async {

    if (currentIndex.value == 0) {
      AppController.to.snackBarKey.currentState!.showSnackBar(WaiSnackBar.bottom(text: "9개의 유형중 하나를 선택해주세요"));

    } else {

      EnneagramTestRequestDto enneagramTest = EnneagramTestRequestDto(
        userId: UserController.to.user.value.userId!.toString(),
        testType: TestType.select,
        myEnneagramType: currentIndex.value,
      );

      var result = await whoAmIRepository.selectEnneagramType(enneagramTest);
      // MainController.to.setTabIndex(0);
      // Get.offAll(() => MainScreens(myEnneagramTest: myEnneagramTest));

    }
  }
}