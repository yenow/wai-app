import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';

import '../../../../constants/wai_colors.dart';

class PostReplyIcon extends StatelessWidget {
  const PostReplyIcon({Key? key, required this.replyCount}) : super(key: key);
  final int replyCount;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Icon(Icons.question_answer_rounded, size: 15, color: WaiColors.white70 ),
        const Blank(width: 2,),
        Text("$replyCount", style: const TextStyle(fontSize: 15, color: WaiColors.white70)),
      ],
    );
  }
}