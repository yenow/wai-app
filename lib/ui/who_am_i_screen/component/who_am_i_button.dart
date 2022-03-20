import 'package:flutter/cupertino.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/controller/permernent/enneagram_test_controller.dart';

import '../../../constants/wai_colors.dart';

class WhoAmIButton extends StatelessWidget {
  const WhoAmIButton({Key? key,
    required this.onPressed,
    required this.title,
    this.backgroundColor = WaiColors.deepDarkGrey,
    this.textColor = WaiColors.white
  }) : super(key: key);

  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: WaiButton(
            title: title,
            backgroundColor: backgroundColor,
            textColor: textColor,
            onPressed: onPressed
        )
    );
  }
}
