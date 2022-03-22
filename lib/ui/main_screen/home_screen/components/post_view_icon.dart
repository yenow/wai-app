import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';

import '../../../../constants/wai_colors.dart';

class PostViewIcon extends StatelessWidget {
  const PostViewIcon({Key? key, required this.clickCount}) : super(key: key);
  final int clickCount;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Icon(Icons.visibility_rounded, size: 15, color: WaiColors.white70 ),
        const Blank(width: 2,),
        Text("$clickCount", style: const TextStyle(fontSize: 15, color: WaiColors.white70)),
      ],
    );
  }
}