import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/my_edit_controller.dart';

class MyEditActionButton extends StatelessWidget {
  const MyEditActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: IconButton(
        icon: const Icon(
          Icons.check_circle_rounded,
          color: WaiColors.white,
          size: 25,
        ),
        onPressed: MyEditController.to.clickCompleteButton,
      ),
    );
  }
}
