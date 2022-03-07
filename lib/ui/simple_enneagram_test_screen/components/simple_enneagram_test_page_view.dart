import 'package:flutter/material.dart';
import 'package:wai/controller/simple_enneagram_test_controller.dart';
import 'package:wai/ui/simple_enneagram_test_screen/components/simple_enneagram_test_page.dart';

class SimpleEnneagramTestPageView extends StatelessWidget {
  const SimpleEnneagramTestPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: 2,
        controller: SimpleEnneagramTestController.to.pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          int pageIndex = index + 1;
          return SimpleEnneagramTestPage(pageIndex: pageIndex);
        },
        // onPageChanged: SimpleEnneagramTestController.to.onPageChanged
    );
  }
}
