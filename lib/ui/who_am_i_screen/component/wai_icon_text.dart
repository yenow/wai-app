import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/constants/wai_colors.dart';

class IconText extends StatelessWidget {
  const IconText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Icon(Icons.check_circle_rounded, color: WaiColors.black60, size: 17,),
        ),
        const Blank(width: 5,),
        Text(
          text,
          style: const TextStyle(fontSize: 17, color: WaiColors.black60),
        )
      ],
    );
  }
}
