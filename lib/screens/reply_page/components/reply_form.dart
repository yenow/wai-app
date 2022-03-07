import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/controller/reply_controller.dart';
import 'package:wai/controller/user_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/reply/api/reply_request_dto.dart';
import 'package:wai/net/reply/reply_api.dart';

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
          _buildReReplyInfo(),
          Container(
            height: ReplyController.to.replyContainerHeight.value,
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
                  style: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.grey),
                  controller: TextEditingController(
                      text: replyRequestDto.replyContent
                  ),
                  onChanged: (String value) {
                    ReplyController.to.writeReplyContent(value);
                  },
                  decoration: InputDecoration(
                    labelText: "댓글을 입력해주세요.",
                    labelStyle: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.grey),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(FontAwesomeIcons.commentDots, size: 25, color: Colors.grey),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: IconButton(
                        icon: const Icon(FontAwesomeIcons.reply, size: 25, color: Colors.grey),
                        onPressed: () async {
                          if (ReplyController.to.checkReplyWrintingValue()) {

                            ReplyRequestDto replyRequestDto = ReplyController.to.replyWritingInfomation.value;
                            replyRequestDto.author = UserController.to.user.value.nickname;
                            replyRequestDto.authorEnneagramType = UserController.to.user.value.myEnneagramType;

                            await saveReply(replyRequestDto);

                            ReplyController.to.removeReplyContent();

                            if (parentRebuild != null) {
                              parentRebuild!();
                            }
                          } else {
                            // 값을 입력 안했을 경우
                          }
                        },
                      ),
                    ),
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
              child: Text("$name에게 답글", style: CustomTextStyles.buildTextStyle(fontSize: 16, color: Colors.grey)),
            ),
            IconButton(
              icon: const Icon(Icons.close_outlined, size: 16, color: Colors.grey),
              onPressed: () {
                ReplyController.to.updateReplyWritingInfomation(parentReplyId: "", parentAuthor: "");
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