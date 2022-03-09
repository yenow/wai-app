import 'package:flutter/material.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';

class TestQuestion extends StatelessWidget {
  const TestQuestion({Key? key, required this.questionIndex}) : super(key: key);
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          EnneagramTestController.to.enneagramQuestionList.elementAt(questionIndex).getFullQuestion(),
          style: WaiTextStyle().enneagramQuestion(),
        ),
      ),
    );
  }
}
