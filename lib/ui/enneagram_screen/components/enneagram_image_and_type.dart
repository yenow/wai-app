import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permernent/enneagram_controller.dart';

import '../../../common/widgets/blank.dart';

class EnneagramImageAndType extends StatelessWidget {
  const EnneagramImageAndType({
    Key? key,
    required this.enneagramType,
    required this.imageSize,
    this.fontSize = 15,
    this.textColor = WaiColors.mainColor
  }) : super(key: key);
  final int enneagramType;
  final double imageSize;
  final double fontSize;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(EnneagramController.to.enneagram[enneagramType]!.imagePath), width: imageSize, height: imageSize,  fit: BoxFit.fill,
          ),
          const Blank(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "$enneagramType유형", style: TextStyle(fontSize: fontSize, color: textColor))
            ],
          ),
        ],
      ),
    );
  }
}
