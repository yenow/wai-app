import 'package:get/get.dart';
import 'package:wai/controller/post/post_controller.dart';

class PostBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<PostController>(PostController());
  }
}