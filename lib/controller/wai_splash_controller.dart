import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wai/controller/app_controller.dart';
import 'package:wai/models/introduction_message.dart';
import 'package:wai/route/route.dart';
import 'package:wai/ui/sign_up_screen/sign_up_screen.dart';

class WaiSplashController extends GetxController {
  static WaiSplashController get to => Get.find<WaiSplashController>();

  final bool isInit = true;
}