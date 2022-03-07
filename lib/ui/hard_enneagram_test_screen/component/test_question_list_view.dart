import 'package:flutter/material.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/controller/enneagram_test_controller.dart';
import 'package:wai/ui/hard_enneagram_test_screen/component/test_question_list.dart';

class TestQuestionListView extends StatelessWidget {
  const TestQuestionListView({Key? key, required this.questionIndexList}) : super(key: key);
  final List<dynamic> questionIndexList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: EnneagramTestController.to.questionCount,
          separatorBuilder: (BuildContext context, int index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: HorizontalBorderLine(),
            );
          },
          itemBuilder: (BuildContext context, int index) {
            /* questionIndexList[index] => question 번호 */
            int questionIndex = questionIndexList[index];
            return TestQuestionList(questionIndex: questionIndex);
          }),
    );
  }
}
