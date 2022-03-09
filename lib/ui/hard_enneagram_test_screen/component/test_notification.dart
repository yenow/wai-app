import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/hard_enneagram_test_controller.dart';

import '../../../constants/wai_textstyle.dart';

class TestNotification extends StatelessWidget {
  const TestNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: WaiColors.blueGrey,
      ),
      child: Column(
        children: [
          Text(
            HardEnneagramTestController.to.notificationList[HardEnneagramTestController.to.currentPageIndex.value % HardEnneagramTestController.to.notificationList.length],
            style: WaiTextStyle(color: WaiColors.white).basic(),
          ),
          // ElevatedButton(
          //     child: Text('임시버튼'),
          //     onPressed: () {
          //       EnneagramTestController.to.randomInputScore();
          //       _controller.jumpToPage(EnneagramTestController.to.enneagramPageList.length - 1);
          //     }
          // )
        ],
      ),
    );
  }
}
