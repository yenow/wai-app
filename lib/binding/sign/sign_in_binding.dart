import 'package:get/get.dart';
import 'package:wai/controller/introduction_controller.dart';
import 'package:wai/controller/sign/sign_in_controller.dart';
import 'package:wai/controller/sign/sign_up_controller.dart';
import 'package:wai/data/provider/sign_up_api_provider.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() {
      return SignInController();
    });
  }
}