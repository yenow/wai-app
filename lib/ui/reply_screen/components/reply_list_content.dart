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
              style: const TextStyle(fontSize: 16, color: WaiColors.darkBlueGrey),
              children: [
                const TextSpan(
                  text: "  ",
                  style: TextStyle(fontSize: 15, color: WaiColors.black60),
                ),
                TextSpan(
                  text: reply.isDeleted! ? '삭제된 댓글입니다.' : reply.isReported! ? '신고되어 블라인드된 댓글입니다.' : reply.replyContent!,
                  style: const TextStyle(fontSize: 15, color: WaiColors.black60),
                ),
              ]
            ),
          )
        ],
      ),
    );
  }
}
