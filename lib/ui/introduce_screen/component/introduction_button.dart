import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/controller/introduction_controller.dart';

class IntroductionButton extends StatelessWidget {
  const IntroductionButton({Key? key, required this.pageIndex,}) : super(key: key);
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    if (IntroductionController.to.isLastPage(pageIndex)) {
      return SizedBox(
        height: 50,
        child: _buildElevatedButton(text: '시작하기', onPressed: IntroductionController.to.clickStartButton),
      );
    } else {
      return SizedBox(
        height: 50,
        child: _buildElevatedButton(text: '다음', onPressed: IntroductionController.to.clickNextButton),
      );
    }
  }

  Widget _buildElevatedButton({required String text, required VoidCallback onPressed}) {
    return ElevatedButton(
        child: Text(text, style: WaiTextStyle(fontSize: 18, color: Colors.white).basic()),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size.infinite),
          backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
        ),
        onPressed: onPressed,
      );
  }
}
