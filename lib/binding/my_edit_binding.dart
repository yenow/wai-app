import 'package:get/get.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/introduction_controller.dart';
import 'package:wai/controller/sign_up_controller.dart';
import 'package:wai/controller/who_am_i_controller.dart';
import 'package:wai/data/provider/sign_up_api_provider.dart';
import 'package:wai/data/provider/who_am_i_api_provider.dart';

import '../controller/my_edit_controller.dart';

class MyEditBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MyEditController>(MyEditController());
  }
}