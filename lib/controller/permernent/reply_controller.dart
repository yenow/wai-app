import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wai/controller/post/post_controller.dart';
import 'package:wai/controller/permernent/user_controller.dart';
import 'package:wai/data/model/reply/reply_request_dto.dart';
import 'package:wai/data/model/reply/reply.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';

import 'app_controller.dart';

class ReplyController2 extends GetxController {
  static ReplyController2 get to => Get.put(ReplyController2());

  final replys = <Reply>[].obs;
  final replyWritingInfomation = ReplyRequestDto().obs;
  final replyContainerHeight = 80.0.obs;

  Future<List<Reply>> getReplys(String postId) async {
    List<Reply> tReplys = [];
    return tReplys;
  }


  void initWriteReplys({required int postId, int? parentReplyId}) {
    ReplyController2.to.initReplyWritingInfomation(
        userId: UserController.to.user.value.userId!.toString(),
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

  void initReplyWritingInfomation({required String userId, required String postId,  String? parentReplyId, String? parentAuthor}) {
    replyWritingInfomation.update((val) {
      val!.userId = userId;
      val.postId = postId;
      val.parentReplyId = parentReplyId;
      val.parentAuthor = parentAuthor;
    });
  }

  void removeReplyWritingInfomation() {
    replyWritingInfomation.update((val) {
      val!.userId = "";
      val.postId = "";
      val.parentReplyId = "";
      val.parentAuthor = "";
    });
  }

  void updateReplyWritingInfomation({String? parentReplyId, String? parentAuthor}) {
    replyWritingInfomation.value.parentReplyId = parentReplyId;
    replyWritingInfomation.update((val) {
      val!.parentReplyId = parentReplyId;
      val.parentAuthor = parentAuthor;
    });
  }

  void removeReplyContent() {
    replyWritingInfomation.update((val) {
      val!.replyContent = "";
    });
  }

  void writeReplyContent(String replyContent) {
    replyWritingInfomation.value.replyContent = replyContent;
    // updateReplyContainerHeight();
  }

  bool checkReplyWrintingValue() {

    if (replyWritingInfomation.value.replyContent!.trim() == "") {
      return false;
    }

    return true;
  }
}