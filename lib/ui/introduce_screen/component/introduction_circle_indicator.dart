import 'package:flutter/cupertino.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:wai/controller/introduction_controller.dart';

class IntroductionCircleIndicator extends StatelessWidget {
  const IntroductionCircleIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: CirclePageIndicator(
          itemCount: IntroductionController.to.items.length,
          currentPageNotifier: IntroductionController.to.currentPageNotifier,
        ),
      ),
    );
  }
}
