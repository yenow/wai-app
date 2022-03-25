import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/common/widgets/never_border_text_form_field.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/reply/reply_update_controller.dart';
import 'package:wai/data/model/reply/reply.dart';

class ReplyUpdateScreen extends GetView<ReplyUpdateController> {
  const ReplyUpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Reply? reply = Get.arguments;
    if (reply != null) {
      controller.replyRequestDto.update((val) {
        val!.replyId = reply.replyId.toString();
        val.replyContent = reply.replyContent!;
      });
    }

    return SafeArea(
      child: Scaffold(
        appBar: WaiAppbar(
          title: const Text('댓글 수정', style: TextStyle(color: WaiColors.white),),
          backgroundColor: WaiColors.lightMainColor,
          leading: InkWell(
            child: const Icon(Icons.arrow_back_ios_outlined, size: 20, color: WaiColors.white),
            onTap: () {
              Get.back();
            },
          ),
          actions: const [
            ReplyActionButton()
          ],
        ),
        body: Form(
          key: controller.formKey,
          child: NerverBorderTextFormField(
            initText: controller.replyRequestDto.value.replyContent,
            labelText: "댓글을 입력해주세요.",
            maxLength: 1000,
            maxLines: null,
            expands: true,
            onChanged: controller.onChangedReplyContent,
            validator: (value) {
              if (value!.trim() == "") {
                WaiDialog.notify('알림', '댓글을 입력해주세요');
              }
            },
          ),
        )
      )
    );
  }
}

class ReplyActionButton extends StatelessWidget {
  const ReplyActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20),
      child: GestureDetector(
        onTap: ReplyUpdateController.to.submitReply,
        child: const Icon(Icons.edit_rounded, color: WaiColors.white, size: 25),
      ),
    );
  }
}
