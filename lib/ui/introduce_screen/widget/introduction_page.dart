import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/controller/introduction_controller.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key, required this.pageIndex}) : super(key: key);
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 60,
            child: Center(child: Text(IntroductionController.to.items.elementAt(pageIndex).titleText,
              style: WaiTextStyle(fontSize: 30, color: Colors.black54).basic(),))
        ),
        SizedBox(
          height: 100,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: AutoSizeText(
                  IntroductionController.to.items[pageIndex].subText,
                  maxLines: 4,
                  style: WaiTextStyle(fontSize: 20, color: Colors.black54).basic(),
                ),
              )
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(80, 0, 80, 80),
            child: Image(
              image: AssetImage(IntroductionController.to.items[pageIndex].imageUrl),
              height: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }
}
