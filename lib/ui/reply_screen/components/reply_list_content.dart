import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/data/model/reply/reply.dart';

import '../../../common/widgets/blank.dart';

class ReplyListContent extends StatelessWidget {
  const ReplyListContent({Key? key, required this.reply}) : super(key: key);
  final Reply reply;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Blank(width: 20,),
          Text.rich(
            TextSpan(
              text: reply.parentAuthor,
              style: const TextStyle(fontSize: 16, color: WaiColors.lightMainColor),
              children: [
                TextSpan(
                  text: "  ",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                TextSpan(
                  text: reply.replyContent!,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}
