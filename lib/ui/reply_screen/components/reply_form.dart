import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/controller/permernent/reply_controller.dart';
import 'package:wai/controller/reply/reply_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/data/model/reply/reply_request_dto.dart';

class ReplyForm extends StatelessWidget {
  ReplyForm({Key? key, this.parentRebuild, this.rebuild, this.parentReplyId, required this.replyRequestDto}) : super(key: key);
  final VoidCallback? parentRebuild;
  final VoidCallback? rebuild;
  final String? parentReplyId;
  final ReplyRequestDto replyRequestDto;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Column(
        children: [
          // _buildReReplyInfo(),
          Container(
            height: ReplyController.to.replyFormHeight.value,
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(width: 0.5, color: Colors.grey)
                )
            ),
            child: Form(
              key: _formKey,  // PostController.to.formKey
              child: TextField(
                  cursorColor: Colors.grey,
                  maxLength: 4000,
                  maxLines: 100,
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                  // controller: TextEditingController(text: ReplyController.to.replyRequestDto.value.replyContent),
                  onChanged: ReplyController.to.onChangedReplyContent,
                  decoration: InputDecoration(
                    labelText: "댓글을 입력해주세요.",
                    labelStyle: const TextStyle(fontSize: 18, color: Colors.grey),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(FontAwesomeIcons.commentDots, size: 25, color: Colors.grey),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: IconButton(
                        icon: const Icon(FontAwesomeIcons.reply, size: 25, color: Colors.grey),
                        onPressed: ReplyController.to.onPressReplySubmitButton,
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
          ),
        ],
      ),
    );
  }

  Container _buildReReplyInfo() {
    if (parentReplyId=="") {
      return Container();
    } else {
      String name = replyRequestDto.parentAuthor!;

      return Container(
        height: 40,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: Colors.grey)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("$name에게 답글", style: TextStyle(fontSize: 16, color: Colors.grey)),
            ),
            IconButton(
              icon: const Icon(Icons.close_outlined, size: 16, color: Colors.grey),
              onPressed: () {
                ReplyController2.to.updateReplyWritingInfomation(parentReplyId: "", parentAuthor: "");
                if (rebuild != null) {
                  rebuild!();
                }
              }
            )
          ],
        ),
      );
    }

  }
}