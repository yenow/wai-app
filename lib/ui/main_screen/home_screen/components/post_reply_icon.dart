import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';

import '../../../../constants/wai_colors.dart';

class PostReplyIcon extends StatelessWidget {
  const PostReplyIcon({Key? key, required this.replyCount, this.size = 15.0, this.intervalSize = 2.0}) : super(key: key);
  final int replyCount;
  final double size;
  final double intervalSize;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(Icons.question_answer_rounded, size: size, color: WaiColors.white70 ),
        Blank(width: intervalSize,),
        Text("$replyCount", style: TextStyle(fontSize: size, color: WaiColors.white70)),
      ],
    );
  }
}