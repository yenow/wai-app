import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wai/models/reply/api/reply_request_dto.dart';

class ReplyController extends GetxController {
  static ReplyController get to => Get.put(ReplyController());

  final WritingReply = ReplyRequestDto().obs;

}