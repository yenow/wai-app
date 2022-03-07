import 'package:flutter/cupertino.dart';
import 'package:wai/common/constants/wai_colors.dart';

import '../../../common/theme/wai_textstyle.dart';

class SimpleTestNotification extends StatelessWidget {
  const SimpleTestNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: WaiColors.puppy,
      ),
      child: Center(
          child: Text(
              "세가지 질문중 나에게 최대한 가까운 질문 하나를 선택해주세요. 완벽하게 맞지 않아도 괜찮습니다.",
              style: WaiTextStyle(color: WaiColors.white).basic()
          )
      ),
    );
  }
}
