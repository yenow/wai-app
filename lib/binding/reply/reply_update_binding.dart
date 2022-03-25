import 'package:get/get.dart';
import 'package:wai/controller/post/post_controller.dart';
import 'package:wai/controller/reply/reply_update_controller.dart';

import '../../controller/reply/reply_controller.dart';

class ReplyUpdateBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<ReplyUpdateController>(ReplyUpdateController());
  }
}