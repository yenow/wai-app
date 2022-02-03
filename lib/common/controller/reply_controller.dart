import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wai/models/reply/api/reply_request_dto.dart';
import 'package:wai/models/reply/reply.dart';
import 'package:wai/sample/add_interactivity.dart';

class ReplyController extends GetxController {
  static ReplyController get to => Get.put(ReplyController());

  final replys = Rx<List<Reply>>([]);
  final replyWrintingInfomation = ReplyRequestDto().obs;
  final replyContainerHeight = 80.0.obs;

  void addReply(Reply reply) {
    replys.update((val) {
      val!.add(reply);
    });
  }

  void initReplyWritingInfomation({required String userId, required String postId,  String? parentReplyId}) {
    replyWrintingInfomation.update((val) {
      val!.userId = userId;
      val.postId = postId;
      val.parentReplyId = parentReplyId;
      val.parentReplyNickname = getReReplyNickname(parentReplyId);
    });
  }

  void removeReplyWritingInfomation() {
    replyWrintingInfomation.update((val) {
      val!.userId = "";
      val.postId = "";
      val.parentReplyId = "";
      val.replyContent = "";
      val.parentReplyNickname = "";
    });
  }

  void updateReplyWritingInfomation({String? parentReplyId}) {
    replyWrintingInfomation.value.parentReplyId = parentReplyId;
    replyWrintingInfomation.update((val) {
      val!.parentReplyId = parentReplyId;
      val.parentReplyNickname = getReReplyNickname(parentReplyId);
      logger.d(getReReplyNickname(parentReplyId));
    });
  }

  String getReReplyNickname(String? parentReplyId) {
    List<Reply> replyList =  ReplyController.to.replys.value;
    String returnValue = "";

    for (Reply reply in replyList) {

      if (reply.parentReplyId == parentReplyId) {
        returnValue = reply.user!.nickname!;
        break;
      }
    }
    return returnValue;
  }

  void writeReplyContent(String replyContent) {
    replyWrintingInfomation.value.replyContent = replyContent;
    // updateReplyContainerHeight();
  }

  bool checkReplyWrintingValue() {

    if (replyWrintingInfomation.value.replyContent == "") {
      return false;
    }

    return true;
  }

  // void updateReplyContainerHeight() {
  //   if (replyWrintingInfomation.value.replyContent!.length < 50) {
  //     replyContainerHeight.value = 70;
  //   } else if (replyWrintingInfomation.value.replyContent!.length >= 50) {
  //     replyContainerHeight.value = 90;
  //   } else if (replyWrintingInfomation.value.replyContent!.length >= 100) {
  //     replyContainerHeight.value = 110;
  //   }
  //   logger.d(replyContainerHeight.value);
  // }
}