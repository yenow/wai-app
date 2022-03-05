import 'package:get/get.dart';
import 'package:wai/controller/app_controller.dart';
import 'package:wai/controller/introduction_controller.dart';
import 'package:wai/controller/sign_up_controller.dart';
import 'package:wai/controller/wai_splash_controller.dart';
import 'package:wai/data/provider/sign_up_api_provider.dart';
import 'package:wai/data/repository/sign_up_repository.dart';

class WaiSplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<WaiSplashController>(WaiSplashController());
  }
}