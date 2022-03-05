import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/focus_out_container.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_text.dart';
import 'package:wai/controller/sign_up_controller.dart';
import 'package:wai/ui/login_screen/login_screen.dart';
import 'package:wai/ui/sign_up_screen/sign_up_button.dart';
import 'package:wai/ui/sign_up_screen/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FocusOutContainer(
        child: Scaffold(
          appBar: const WaiAppbar(
            title: Text("입력"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const Blank(height: 20,),
                SizedBox(
                    height: 50,
                    child: Center(child: WaiText(text: "사용하실 닉네임을 입력해주세요.", style: WaiTextStyle(fontSize: 20).basic(),))
                ),
                SignUpForm(errorMessage: SignUpController.to.errorMessage.value),
                const Blank(height: 20,),
                const SignUpButton(),
                const Blank(height: 40,),
                InkWell(
                  child: Center(child: WaiText(text: "이미 등록된 아이디가 있으신가요?",
                    style: WaiTextStyle(fontSize: 16, color: WaiColors.grey).basic(),)
                  ),
                  onTap: () {
                    Get.to(() => const LoginScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
