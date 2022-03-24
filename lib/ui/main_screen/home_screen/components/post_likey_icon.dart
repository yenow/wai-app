import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';

import '../../../../constants/wai_colors.dart';

class PostLikeyIcon extends StatelessWidget {
  const PostLikeyIcon({Key? key, required this.likeyCount, this.size = 15.0, this.intervalSize = 2.0}) : super(key: key);
  final int likeyCount;
  final double size;
  final double intervalSize;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(Icons.favorite_rounded, size: size, color: WaiColors.white70 ),
        Blank(width: intervalSize,),
        Text("$likeyCount", style: TextStyle(fontSize: size, color: WaiColors.white70)),
      ],
    );
  }
}
