import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/focus_out_container.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_text.dart';
import 'package:wai/controller/sign/sign_up_controller.dart';
import 'package:wai/ui/login_screen/login_screen.dart';

import 'component/sign_up_button.dart';
import 'component/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      SafeArea(
        child: FocusOutContainer(
          child: Scaffold(
            appBar: const WaiAppbar(
              elevation: 0,
              isBackLeading: true,
              backgroundColor: WaiColors.deepDarkMainColor,
              title: Text("입력", style: TextStyle(color: WaiColors.white)),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const Blank(height: 20,),
                  const SizedBox(
                      height: 50,
                      child: Center(child: WaiText(text: "사용하실 닉네임을 입력해주세요.", style: TextStyle(fontSize: 20, color: WaiColors.darkMainColor),))
                  ),
                  SignUpForm(errorMessage: SignUpController.to.errorMessage.value),
                  const Blank(height: 20,),
                  const SignUpButton(),
                  const Blank(height: 40,),
                  // InkWell(
                  //   child: Center(child: WaiText(text: "이미 등록된 아이디가 있으신가요?",
                  //     style: WaiTextStyle(fontSize: 16, color: WaiColors.mainColor).basic(),)
                  //   ),
                  //   onTap: () {
                  //     Get.to(() => const LoginScreen());
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
