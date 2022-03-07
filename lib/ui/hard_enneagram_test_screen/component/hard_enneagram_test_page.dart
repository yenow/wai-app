import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/controller/hard_enneagram_test_controller.dart';
import 'package:wai/ui/hard_enneagram_test_screen/component/hard_enneagram_button.dart';
import 'package:wai/ui/hard_enneagram_test_screen/component/test_notification.dart';
import 'package:wai/ui/hard_enneagram_test_screen/component/test_progress_bar.dart';
import 'package:wai/ui/hard_enneagram_test_screen/component/test_question_list.dart';
import 'package:wai/ui/hard_enneagram_test_screen/component/test_question_list_view.dart';

class HardEnneagramTestPage extends StatelessWidget {
  const HardEnneagramTestPage({Key? key, required this.questionIndexList}) : super(key: key);
  final List questionIndexList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 15,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TestNotification(),
                const TestProgressBar(),
                const Blank(height: 5),
                TestQuestionListView(questionIndexList: questionIndexList)
              ],
            ),
          ),
        ),
        Flexible(
            flex: 1,
            child: Obx(() =>
              HardEnneagramButton(
                buttonTitle: HardEnneagramTestController.to.buttonTitle.value,
              ),
            )
        ),
      ],
    );
  }
}
