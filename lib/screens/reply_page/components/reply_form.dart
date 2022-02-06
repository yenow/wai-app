import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/common/controller/reply_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/reply/reply.dart';
import 'package:wai/sample/add_interactivity.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/utils/logger.dart';

class ReplyForm extends StatelessWidget {
  ReplyForm({Key? key, this.parentRebuild}) : super(key: key);
  final VoidCallback? parentRebuild;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Column(
        children: [
          _buildReReplyInfo(),
          Container(
            height: ReplyController.to.replyContainerHeight.value,
            decoration: BoxDecoration(
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
                      text: ReplyController.to.replyWrintingInfomation.value.replyContent
                  ),
                  onChanged: (String value) {
                    ReplyController.to.writeReplyContent(value);
                  },
                  decoration: InputDecoration(
                    labelText: "댓글을 입력해주세요.",
                    labelStyle: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.grey),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(FontAwesomeIcons.commentDots, size: 25, color: Colors.grey),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.reply, size: 25, color: Colors.grey),
                        onPressed: () async {
                          // todo 1. 값체크, 2. DB 요청  3. replys에 넣기  4. 텍스트값 지우기
                          if (ReplyController.to.checkReplyWrintingValue()) {

                            var response = await postRequest("/api/saveReply", json.encode(ReplyController.to.replyWrintingInfomation.value.toJson()));
                            Reply reply = Reply.fromJson(json.decode(response));
                            loggerNoStack.d("/api/saveReply result : $reply");

                            // todo  함수로 변경해야할듯?
                            // ReplyController.to.addReply(reply);
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
    String parentReplyId = ReplyController.to.replyWrintingInfomation.value.parentReplyId!;

    if (parentReplyId=="") {
      return Container();
    } else {
      String name = ReplyController.to.replyWrintingInfomation.value.parentReplyNickname!;

      return Container(
        height: 40,
        decoration: BoxDecoration(
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
              icon: Icon(Icons.close_outlined, size: 16, color: Colors.grey),
              onPressed: () {
                ReplyController.to.updateReplyWritingInfomation(parentReplyId: "");
              }
            )
          ],
        ),
      );
    }

  }
}