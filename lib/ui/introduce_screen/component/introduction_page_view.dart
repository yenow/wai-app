import 'package:flutter/material.dart';
import 'package:wai/controller/introduction_controller.dart';

import 'introduction_page.dart';

class IntroductionPageView extends StatelessWidget {
  const IntroductionPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return PageView.builder(
        itemCount: IntroductionController.to.items.length,
        controller: IntroductionController.to.pageController,
        itemBuilder: (BuildContext context, int pageIndex) {
          return IntroductionPage(pageIndex: pageIndex);
        },
        onPageChanged: (int index) {
          IntroductionController.to.setIntroducePageIndex(index);
        }
    );
  }
}
