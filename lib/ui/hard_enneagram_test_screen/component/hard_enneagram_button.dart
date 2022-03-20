import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/controller/permernent/enneagram_test_controller.dart';
import 'package:wai/controller/hard_enneagram_test_controller.dart';

class HardEnneagramButton extends StatelessWidget {
  const HardEnneagramButton({Key? key, required this.buttonTitle}) : super(key: key);
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: WaiButton(
          title: buttonTitle,
          backgroundColor: WaiColors.blueGrey,
          onPressed: HardEnneagramTestController.to.isLastPage() ?
            HardEnneagramTestController.to.saveEnneagramTest : HardEnneagramTestController.to.clickNextButton,
        )
    );
  }
}
