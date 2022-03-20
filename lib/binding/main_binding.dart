import 'package:get/get.dart';
import 'package:wai/controller/introduction_controller.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/controller/sign_up_controller.dart';
import 'package:wai/data/provider/sign_up_api_provider.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
  }
}