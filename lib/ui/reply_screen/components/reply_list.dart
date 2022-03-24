import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/data/model/reply/reply.dart';
import 'package:wai/ui/reply_screen/components/reply_list_content.dart';
import 'package:wai/ui/reply_screen/components/reply_list_date_time.dart';
import 'package:wai/ui/reply_screen/components/reply_list_information.dart';

class ReplyList extends StatelessWidget {
  const ReplyList({Key? key, required this.reply}) : super(key: key);
  final Reply reply;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(reply.parentReplyId != null ? 30 : 0 , 0, 0, 0),
      child: Column(
        children: [
          const Blank(height: 10,),
          ReplyListInformation(reply: reply),
          ReplyListContent(reply: reply),
          ReplyListDateTime(reply: reply),
          const Blank(height: 10,),
        ],
      ),
    );
  }
}
