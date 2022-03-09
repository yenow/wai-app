import 'package:get/get.dart';
import 'package:wai/controller/service_agree_controller.dart';

class ServiceAgreeBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<ServiceAgreeController>(ServiceAgreeController());
  }
}