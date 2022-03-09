import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/common/theme/wai_textstyle.dart';

class EnneagramWingText extends StatelessWidget {
  const EnneagramWingText({Key? key, required this.wingType, this.fontSize}) : super(key: key);
  final int wingType;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          // Icon(Icons.add, size: fontSize ?? 14, color: WaiColors.blueGrey,),
          // const Image(image: AssetImage('assets/images/enneagram/wings.png'), width: 20, height: 20,  fit: BoxFit.fill,),
          ImageIcon(const AssetImage("assets/images/enneagram/wings.png"), color: Colors.blueGrey, size: fontSize ?? 14,),
          Text("$wingType", style: WaiTextStyle(fontSize: fontSize ?? 14).basic(),)
        ],
      ),
    );
  }
}
