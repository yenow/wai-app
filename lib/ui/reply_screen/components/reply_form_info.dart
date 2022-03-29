import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/reply/reply_controller.dart';

class ReplyFormInfo extends StatelessWidget {
  const ReplyFormInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      ReplyController.to.replyRequestDto.value.parentReplyId!.isEmpty ?
      Container() :
      Container(
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Text("${ReplyController.to.replyRequestDto.value.parentAuthor}", style: const TextStyle(fontSize: 17, color: WaiColors.darkBlueGrey, fontWeight: FontWeight.w500)),
                  const Text(" 에게 답글", style: TextStyle(fontSize: 18, color: WaiColors.black50)),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close_rounded, size: 20, color: WaiColors.black50),
              onPressed: ReplyController.to.removeParentReply
            )
          ],
      ),
    ),
    );
  }
}
