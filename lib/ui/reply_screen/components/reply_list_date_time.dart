import 'package:flutter/material.dart';
import 'package:wai/common/utils/date_util.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/reply/reply_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/model/reply/reply.dart';

class ReplyListDateTime extends StatelessWidget {
  const ReplyListDateTime({Key? key, required this.reply}) : super(key: key);
  final Reply reply;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          const Blank(width: 20,),
          Text(dateTimeToString(AppController.to.nowServerTime.value ,reply.updateDate!), style: const TextStyle(fontSize: 12, color: WaiColors.grey)),
          const Blank(width: 10,),
          reReply()
        ],
      ),
    );
  }

  Widget reReply() {
    if (UserController.to.user.value.userId == reply.userId) {
      return Container();

    } else {
      return TextButton(
        child: const Text("답글쓰기", style: TextStyle(fontSize: 12, color: WaiColors.grey)),
        onPressed: () {
          ReplyController.to.createParentReply(reply);
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(0, 3, 0, 0)
        ),
      );
    }
  }
}
