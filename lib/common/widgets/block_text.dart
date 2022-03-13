import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/theme/wai_textstyle.dart';

class BlockText extends StatelessWidget {
  const BlockText({Key? key, required this.text, this.fontSize = 14}) : super(key: key);
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 2,),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Color.fromRGBO(150, 150, 150, 0.3)
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: AutoSizeText(
          text,
          style: WaiTextStyle(color: Colors.black45).basic(),

          maxLines: 1,
        )
      ),
    );
  }
}
