import 'package:flutter/material.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/controller/hard_enneagram_test_controller.dart';
import 'package:wai/ui/hard_enneagram_test_screen/component/hard_enneagram_test_page.dart';

class HardEnneagramTestPageView extends StatelessWidget {
  const HardEnneagramTestPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: EnneagramTestController.to.enneagramPageList.length,
        controller: HardEnneagramTestController.to.pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int pageIndex) {
          List questionIndexList = EnneagramTestController.to.enneagramPageList[pageIndex];
          return HardEnneagramTestPage(questionIndexList: questionIndexList);
        }
    );
  }
}
