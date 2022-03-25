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

class ReplyUpdateController extends GetxController {
  static ReplyUpdateController get to => Get.put(ReplyUpdateController());

  final replyRequestDto = ReplyRequestDto(
    userId: UserController.to.user.value.userId.toString(),
    author: UserController.to.user.value.nickname.toString(),
    authorEnneagramType: UserController.to.currentEnneagramTest.value.myEnneagramType,
  ).obs;

  final formKey = GlobalKey<FormState>();

  void onChangedReplyContent(String replyContent) {
    replyRequestDto.update((val) {
      val!.replyContent = replyContent;
    });
  }

  Future<void> submitReply() async {
    if (!isValid()) {
      WaiDialog.notify('알림', '댓글 내용을 입력해주세요');
      return;
    }

    await ReplyClient(mainDio).updateReply(
      replyRequestDto: replyRequestDto.value,
      token: AppController.to.getJwtToken()
    ).then((value) {
      Get.back(result: value);
      WaiDialog.notify('알림', '댓글이 수정되었습니다.');
    });
  }

  bool isValid() {
    if (replyRequestDto.value.replyContent.isEmpty) {
      return false;
    }
    return true;
  }
}