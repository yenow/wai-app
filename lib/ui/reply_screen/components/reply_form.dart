import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/reply/reply_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/model/reply/reply_request_dto.dart';
import 'package:wai/ui/reply_screen/components/reply_form_info.dart';

class ReplyForm extends StatelessWidget {
  const ReplyForm({Key? key}) : super(key: key);
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Column(
        children: [
          const ReplyFormInfo(),
          Container(
            height: ReplyController.to.replyFormHeight.value,
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(width: 0.5, color: WaiColors.black50)
                )
            ),
            child: TextField(
                cursorColor: WaiColors.black50,
                maxLength: 4000,
                maxLines: 100,
                focusNode: ReplyController.to.focusNode,
                style: const TextStyle(fontSize: 18, color: WaiColors.black50),
                // controller: TextEditingController(text: ReplyController.to.replyRequestDto.value.replyContent),
                controller: ReplyController.to.textController,
                onChanged: ReplyController.to.onChangedReplyContent,
                decoration: InputDecoration(
                  labelText: "댓글을 입력해주세요.",
                  labelStyle: const TextStyle(fontSize: 18, color: WaiColors.black50),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(FontAwesomeIcons.commentDots, size: 25, color: WaiColors.black50),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: IconButton(
                      icon: const Icon(FontAwesomeIcons.reply, size: 25, color: WaiColors.black50),
                      onPressed: ReplyController.to.createReply,
                    ),
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  counterText:'',
                )
            ),
          ),
        ],
      ),
    );
  }
}