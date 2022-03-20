import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/route.dart';

class ServiceAgreeController extends GetxController {
  static ServiceAgreeController get to => Get.find();

  final serviceAgreeList = <bool>[false,false].obs;
  final isServiceAgree = false.obs;
  final isPrivateInformationAgree = false.obs;

  final ScrollController firstController = ScrollController();
  final ScrollController secondController = ScrollController();

  void changeIsServiceAgree(bool? bool) {
    isServiceAgree(bool!);
  }

  void changeIsPrivateInformationAgree(bool? bool) {
    isPrivateInformationAgree(bool!);
  }

  bool checkValue() {
    if (isServiceAgree.value == false || isPrivateInformationAgree.value == false) {
      return false;
    }
    return true;
  }

  void goToNextPage() {
    if(!checkValue()) {
      WaiDialog.notify('알림', "약관에 동의해야합니다.");
      // AppController.to.snackBarKey.currentState!.showSnackBar(WaiSnackBar.top(text: "약관에 동의해야합니다."));
      return;
    }
    Get.offAllNamed(WaiRoutes.signUp);
  }
}