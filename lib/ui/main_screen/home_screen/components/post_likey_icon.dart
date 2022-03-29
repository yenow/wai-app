import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';

import '../../../../constants/wai_colors.dart';

class PostLikeyIcon extends StatelessWidget {
  const PostLikeyIcon({Key? key, required this.likeyCount, this.size = 15.0, this.intervalSize = 2.0, this.isLikey = false}) : super(key: key);
  final int likeyCount;
  final double size;
  final double intervalSize;
  final bool isLikey;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        likeyIcon(),
        Blank(width: intervalSize,),
        AutoSizeText("$likeyCount", style: TextStyle(fontSize: size, color: WaiColors.white70), maxLines: 1),
      ],
    );
  }

  Icon likeyIcon() {
    if (isLikey) {
      return Icon(Icons.favorite_rounded, size: size, color: WaiColors.white70 );
    } else {
      return Icon(Icons.favorite_border_outlined, size: size, color: WaiColors.white70 );
    }
  }
}