import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/controller/sign/sign_up_controller.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        child: Text("다음", style: WaiTextStyle(color: Colors.white).basic(),),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(WaiColors.darkMainColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ))
        ),
        onPressed: SignUpController.to.signUpRequest,
      ),
    );
  }
}
