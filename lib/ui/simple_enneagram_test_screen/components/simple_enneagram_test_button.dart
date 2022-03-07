import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/controller/simple_enneagram_test_controller.dart';

import '../../../common/utils/logger.dart';

class SimpleEnneagramTestButton extends StatelessWidget {
  const SimpleEnneagramTestButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    if (SimpleEnneagramTestController.to.currentPageIndex.value == 0) {
      return WaiButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("다음", style: CustomTextStyles.buildTextStyle(color: Colors.white)),
            ],
          ),
          onPressed: SimpleEnneagramTestController.to.goNextPage
      );
      
    } else {
      return WaiButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Visibility(
              //   child: Text(EnneagramTestController.to.selectSimpleTestMap[pageIndex]!),
              //   visible: false,
              // ),
              Text("완료", style: CustomTextStyles.buildTextStyle(color: Colors.white)),
            ],
          ),
          onPressed: SimpleEnneagramTestController.to.saveSimpleEnneagramTest
      );
    }
    
    
  }
}
