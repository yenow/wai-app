import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/ui/main_screen/my_page/components/my_page_tab_bar.dart';

import 'enneagram_image_and_type.dart';

class EnneagramTypeContainer extends StatelessWidget {
  const EnneagramTypeContainer({Key? key, required this.enneagramType}) : super(key: key);
  final int enneagramType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
          color: WaiColors.deepLightMainColor,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                WaiColors.deepLightBlueGrey,
                WaiColors.lightBlueGrey
              ]
          )
      ), /*ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          EnneagramImageAndType(
            enneagramType: enneagramType,
            imageSize: 100,
            fontSize: 20,
            textColor: WaiColors.white,
          ),
        ],
      ),*/
    );
  }
}
