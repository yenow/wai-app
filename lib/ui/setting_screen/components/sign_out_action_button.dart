import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/setting_controller.dart';

class SignOutActionButton extends StatelessWidget {
  const SignOutActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: IconButton(
        icon: const Icon(
          Icons.logout_rounded,
          color: WaiColors.white,
        ),
        onPressed: SettingController.to.logout,
      ),
    );
  }
}
