import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/models/reply/api/reply_request_dto.dart';
import 'package:wai/models/reply/reply.dart';
import 'package:wai/sample/add_interactivity.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';

import 'app_controller.dart';

class ReplyController extends GetxController {
  static ReplyController get to => Get.put(ReplyController());

  final replys = <Reply>[].obs;
  final replyWrintingInfomation = ReplyRequestDto().obs;
  final replyContainerHeight = 80.0.obs;

  void initWriteReplys({required int postId, int? parentReplyId}) {
    ReplyController.to.initReplyWritingInfomation(
        userId: AppController.to.userId.value,
        postId: postId.toString(),
        parentReplyId: parentReplyId != null ? parentReplyId.toString() : ""
    );
  }

  Future<void> readReplysByPostId(int postId) async {

    var response = await getRequest("/api/readReplysByPostId/$postId");

    replys.value = List<Reply>.from(json.decode(response).map((model) {
      return Reply.fromJson(model);
    }));
  }

  void addReply(Reply reply) {
    replys.add(reply);
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

  void removeReplyContent() {
    replyWrintingInfomation.update((val) {
      val!.replyContent = "";
    });
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
}