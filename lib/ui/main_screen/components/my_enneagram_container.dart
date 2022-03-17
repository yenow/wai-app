import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/block_text.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permenent/enneagram_controller.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test.dart';

import '../../../common/widgets/blank.dart';

class MyEnneagramContainer extends StatelessWidget {
  const MyEnneagramContainer({
    Key? key,
    required this.myEnneagramTest,
    this.textColor = WaiColors.white,
    this.fontSize = 13
  }) : super(key: key);

  final EnneagramTest myEnneagramTest;
  final Color? textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int myEnneagramType = myEnneagramTest.myEnneagramType!;

        /* 가로가 더 길 경우 */
        if (constraints.maxWidth > constraints.maxHeight) {
          double imageSize = constraints.maxHeight / 2.5;
          return Row(
            children: [
              _buildImageAndType(imageSize),
              Expanded(
                child: _buildTypeExplain(myEnneagramType)
              )
            ],
          );

        /* 세로가 더 길 경우 */
        } else {
          double imageSize = constraints.maxWidth / 2.5;
          return Column(
            children: [
              _buildImageAndType(imageSize),
              _buildTypeExplain(myEnneagramType)
            ],
          );
        }

      }
    );
  }

  Padding _buildTypeExplain(int myEnneagramType) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.center,
              child: BlockText(text: EnneagramController.to.enneagram[myEnneagramType]!.simpleExplain,)
          ),
          const Blank(height: 5),
          AutoSizeText(
            EnneagramController.to.enneagram[myEnneagramType]!.simpleExplain2,
            maxLines: 2,
            style: TextStyle(fontSize: fontSize, color: textColor),
          ),
          // AutoSizeText()
        ],
      ),
    );
  }

  Widget _buildImageAndType(double imageSize) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(EnneagramController.to.enneagram[myEnneagramTest.myEnneagramType]!.imagePath), width: imageSize, height: imageSize,  fit: BoxFit.fill,
          ),
          const Blank(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "${myEnneagramTest.myEnneagramType}유형", style: TextStyle(fontSize: fontSize, color: textColor))
            ],
          ),
          _buildWingType(),
        ],
      ),
    );
  }

  Widget _buildWingType() {
    if (myEnneagramTest.myWingType != null && myEnneagramTest.myWingType != 0) {

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( "[날개: ${myEnneagramTest.myWingType}유형]", style: TextStyle(fontSize: fontSize, color: textColor))
        ],
      );
    }

    return Container();
  }
}
