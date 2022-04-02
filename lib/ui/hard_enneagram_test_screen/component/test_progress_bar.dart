import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permernent/enneagram_test_controller.dart';

class TestProgressBar extends StatelessWidget {
  const TestProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: double.infinity,
          height: 5,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: EnneagramTestController.to.getProgressPercent(),
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation<Color>(WaiColors.deepDarkGrey),
            ),
          ),
        ),
      ],
    );
  }
}
