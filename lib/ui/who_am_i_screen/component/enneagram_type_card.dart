import 'package:flutter/material.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/controller/enneagram_controller.dart';
import 'package:wai/controller/enneagram_test_controller.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/data/model/enneagram.dart';

import '../../../main.dart';

class EnneagramTypeCard extends StatelessWidget {
  const EnneagramTypeCard({Key? key,
    required this.enneagramTypeIndex,
    required this.currentIndex,
    required this.changeCurrentIndex
  }) : super(key: key);

  final int enneagramTypeIndex;
  final int currentIndex;
  final Function(int newIndex) changeCurrentIndex;

  @override
  Widget build(BuildContext context) {
    Map<int, Enneagram> enneagram = EnneagramController.to.enneagram!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: enneagramTypeIndex == currentIndex ? WaiColors.deepLightGrey : Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ))
        ),
        onPressed: () {
          changeCurrentIndex(enneagramTypeIndex);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(enneagram[enneagramTypeIndex]!.imagePath),
              width: 40 * widthRatio,
              height: 40 * heightRatio,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 5,),
            Text(
              '$enneagramTypeIndex유형',
              style: WaiTextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black54).basic(),
            ),
          ],
        ),
      ),
    );
  }
}
