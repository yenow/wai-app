import 'package:get/get.dart';
import 'package:wai/controller/introduction_controller.dart';
import 'package:wai/ui/introduce_screen/introduction_screen.dart';

class IntroductionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IntroductionController>(IntroductionController());
    // Get.lazyPut<IntroductionController>(() {
    //   return IntroductionController();
    // });
  }
}