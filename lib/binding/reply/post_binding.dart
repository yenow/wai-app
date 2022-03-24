import 'package:get/get.dart';
import 'package:wai/controller/post/post_controller.dart';

import '../../controller/reply/reply_controller.dart';

class ReplyBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<ReplyController>(ReplyController());
  }
}