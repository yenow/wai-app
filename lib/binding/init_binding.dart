import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:wai/controller/app_controller.dart';

class InitBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<AppController>(AppController(), permanent: true);
  }
}