import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';

import '../../../../constants/wai_colors.dart';

class PostLikeyIcon extends StatelessWidget {
  const PostLikeyIcon({Key? key, required this.likeyCount}) : super(key: key);
  final int likeyCount;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Icon(Icons.favorite_rounded, size: 15, color: WaiColors.white70 ),
        const Blank(width: 2,),
        Text("$likeyCount", style: const TextStyle(fontSize: 15, color: WaiColors.white70)),
      ],
    );
  }
}
