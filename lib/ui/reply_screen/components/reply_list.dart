import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/reply/reply_controller.dart';
import 'package:wai/data/model/reply/reply.dart';
import 'package:wai/ui/reply_screen/components/reply_list_content.dart';
import 'package:wai/ui/reply_screen/components/reply_list_date_time.dart';
import 'package:wai/ui/reply_screen/components/reply_list_information.dart';

class ReplyList extends StatelessWidget {
  const ReplyList({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    if (ReplyController.to.replies[index].isReported! || ReplyController.to.replies[index].isDeleted!) {
      return Container();
    }

    return Obx(() =>
      Container(
        padding: EdgeInsets.fromLTRB(ReplyController.to.replies[index].parentReplyId != null ? 30 : 0 , 0, 0, 0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 0.5, color: WaiColors.grey)
          )
        ),
        child: Column(
          children: [
            const Blank(height: 10,),
            ReplyListInformation(reply: ReplyController.to.replies[index]),
            ReplyListContent(reply: ReplyController.to.replies[index]),
            ReplyListDateTime(reply: ReplyController.to.replies[index]),
            const Blank(height: 10,),
          ],
        ),
      ),
    );
  }
}
