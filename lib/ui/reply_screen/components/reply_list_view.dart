import 'package:flutter/material.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/data/model/reply/reply.dart';
import 'package:wai/ui/reply_screen/components/reply_item2.dart';
import 'package:wai/ui/reply_screen/components/reply_list.dart';

class ReplyListView extends StatelessWidget {
  const ReplyListView({Key? key, required this.replies}) : super(key: key);
  final List<Reply> replies;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: replies.length,
        itemBuilder: (BuildContext context, int index) {
          return ReplyList(
            reply: replies[index],
            // ReplyController.to.updateReplyWritingInfomation(parentReplyId: replies[index].replyId.toString());
          ); //_buildReply(replys[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const HorizontalBorderLine();
        },
      ),
    );
    return Container();
  }
}
