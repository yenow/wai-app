import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';

import '../../../../constants/wai_colors.dart';

class PostViewIcon extends StatelessWidget {
  const PostViewIcon({Key? key, required this.clickCount, this.size = 15.0, this.intervalSize = 2.0}) : super(key: key);
  final int clickCount;
  final double size;
  final double intervalSize;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(Icons.visibility_rounded, size: size, color: WaiColors.white70 ),
        Blank(width: intervalSize),
        Text("$clickCount", style: TextStyle(fontSize: size, color: WaiColors.white70)),
      ],
    );
  }
}