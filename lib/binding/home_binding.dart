import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:wai/controller/home_controller.dart';
import 'package:wai/controller/permenent/app_controller.dart';

class HomeBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}