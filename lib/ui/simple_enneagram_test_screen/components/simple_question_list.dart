import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/controller/simple_enneagram_test_controller.dart';
import 'package:wai/data/model/enneagram/enneagram_question.dart';
import 'package:wai/ui/simple_enneagram_test_screen/components/simple_question.dart';

class SimpleQuestionList extends StatelessWidget {
  const SimpleQuestionList({Key? key, required this.pageIndex}) : super(key: key);
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: EnneagramTestController.to.getSimpleQuestionsByPageIndex(pageIndex).length,
      // separatorBuilder: (BuildContext context, int questionIndex) => Blank(height: 10),
      itemBuilder: (BuildContext context, int index) {
        List<EnneagramQuestion> simpleQuestionList = EnneagramTestController.to.getSimpleQuestionsByPageIndex(pageIndex);
        String uniqueString = simpleQuestionList[index].uniqueString!;

        return Obx(() =>
          SimpleQuestion(
            pageIndex: pageIndex,
            index: index,
            currentUniqueString: SimpleEnneagramTestController.to.currentUniqueString.value,
            simpleQuestionList: simpleQuestionList,
            uniqueString: uniqueString,
          ),
        );
      }
    );
  }
}
