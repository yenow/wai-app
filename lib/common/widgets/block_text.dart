import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/constants/wai_colors.dart';

class BlockText extends StatelessWidget {
  const BlockText({Key? key, required this.text, this.fontSize = 14, this.isLight = false}) : super(key: key);
  final String text;
  final double fontSize;
  final bool isLight;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 2,),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: isLight ? WaiColors.white38 : WaiColors.grey50
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: AutoSizeText(
          text,
          style: WaiTextStyle(color: isLight ? WaiColors.white90 : WaiColors.black50).basic(),
          maxLines: 1,
        )
      ),
    );
  }
}
