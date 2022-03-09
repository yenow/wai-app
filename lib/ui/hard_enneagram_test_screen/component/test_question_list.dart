import 'package:flutter/material.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/screens/enneagram_test_page/component/custom_radio_group_buton.dart';
import 'package:wai/ui/hard_enneagram_test_screen/component/test_question.dart';

class TestQuestionList extends StatelessWidget {
  const TestQuestionList({Key? key, required this.questionIndex}) : super(key: key);
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TestQuestion(questionIndex: questionIndex),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: CustomRadioGroupButton(
            groupValue: EnneagramTestController.to.enneagramQuestionList[questionIndex].score,
            changeState: (int score) {
              EnneagramTestController.to.setScore(questionIndex: questionIndex, score: score);
            },
          ),
        ),
      ],
    );
  }
}
