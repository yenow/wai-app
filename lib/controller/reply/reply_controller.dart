import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/client/reply_client.dart';
import 'package:wai/data/model/reply/reply.dart';
import 'package:wai/data/model/reply/reply_request_dto.dart';
import 'package:wai/main.dart';
import 'package:wai/route.dart';

class ReplyController extends GetxController {
  static ReplyController get to => Get.put(ReplyController());
  final replies = <Reply>[].obs;
  final replyRequestDto = ReplyRequestDto(
    parentReplyId: "",
    parentReplyUserId: "",
    parentAuthor: "",
    userId: UserController.to.user.value.userId.toString(),
    author: UserController.to.user.value.nickname.toString(),
    authorEnneagramType: UserController.to.currentEnneagramTest.value.myEnneagramType,
  ).obs;
  final replyFormHeight = 80.0.obs;

  final textController = TextEditingController();
  final focusNode = FocusNode();

  Future<List<Reply>> getReplies(String postId) async {

    await ReplyClient(mainDio).getReplies(
        postId: postId,
        token: AppController.to.getJwtToken()
    ).then((value) {
      replies(value);
      replyRequestDto.update((val) {
        val!.postId = postId;
      });
    });

    return replies;
  }

  Future<void> onRefresh() async {
    replies([]);

    await ReplyClient(mainDio).getReplies(
        postId: replyRequestDto.value.postId.toString(),
        token: AppController.to.getJwtToken()
    ).then((value) {
      replies(value);
    });
  }

  Future<void> updateReply(Reply reply) async {
    var result = await Get.toNamed(WaiRoutes.replyUpdate, arguments: reply);
    if (result is Reply) {
      replies[replies.indexWhere((element) => element.replyId == result.replyId)] = result;
    }
  }

  Future<void> deleteReply(int replyId) async {

    bool result = await WaiDialog.dialogConfirmation('경고', '정말 삭제하시겠습니까?', '아니요', '예');

    if (result) {
      await ReplyClient(mainDio).deleteReply(
          replyId: replyId.toString(),
          token: AppController.to.getJwtToken()
      ).then((value) {
        replies[replies.indexWhere((element) => element.replyId == replyId)] = value;
        WaiDialog.notify('알림', '댓글이 삭제되었습니다.');
      });
    }
  }

  Future<void> reportReply(int replyId) async {

    await ReplyClient(mainDio).reportReply(
        replyRequestDto: ReplyRequestDto(
          replyId: replyId.toString()
        ),
        token: AppController.to.getJwtToken()
    ).then((value) {
      replies[replies.indexWhere((element) => element.replyId == replyId)] = value;
      WaiDialog.notify('알림', '댓글이 신고되었습니다.');
    });
  }

  void onChangedReplyContent(String? replyContent) {
    replyRequestDto.update((val) {
      val!.replyContent = replyContent!;
    });
  }

  void createReply() async {
    if (!isValid()) {
      WaiDialog.notify('알림', '댓글 내용을 입력해주세요');
      return;
    }

    await ReplyClient(mainDio).createReply(
        replyRequestDto: replyRequestDto.value,
        token: AppController.to.getJwtToken()
    ).then((value) {
      insertReply(value);

      textController.text = '';
      WaiDialog.notify('알림', '댓글이 저장되었습니다.');
      focusNode.unfocus();
      replyRequestDto.update((val) {
        val!.parentReplyId = '';
        val.parentReplyUserId = '';
        val.parentAuthor = '';
        val.replyContent = '';
      });
    });
  }

  void insertReply(Reply reply) {
    replies.insert(getInsertIndex(reply), reply);
  }

  int getInsertIndex(Reply reply) {
    int maxIndex = 0;
    int index = 0;
    for (Reply r in replies) {
      index++;
      if (r.replyId == reply.parentReplyId || r.parentReplyId == reply.parentReplyId) {
        maxIndex = index;
      }
    }

    if (reply.parentReplyId == null) {
      return replies.length;
    }
    return maxIndex;
  }

  bool isValid() {
    if (replyRequestDto.value.replyContent.isEmpty) {
      return false;
    }

    return true;
  }

  void removeParentReply() {
    replyRequestDto.update((val) {
      val!.parentReplyId = "";
      val.parentReplyUserId = "";
      val.parentAuthor = "";
    });
  }

  void createParentReply(Reply reply) {
    logger.d(reply.userId.toString());

    replyRequestDto.update((val) {
      val!.parentReplyId = reply.replyId.toString();
      val.parentReplyUserId = reply.userId.toString();
      val.parentAuthor = reply.author;
    });
    focusNode.requestFocus();
  }
}