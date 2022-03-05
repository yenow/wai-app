import 'package:flutter/material.dart';
import 'package:wai/common/widgets/wai_text_field.dart';
import 'package:wai/controller/sign_up_controller.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key, required this.errorMessage}) : super(key: key);
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: SignUpController.to.formKey,
      child: WaiTextField(
        // prefixIcon: Icon(Icons.badge_outlined,),
        labelText: "닉네임",
        maxLength: 20,
        onSaved: (nickname) {
          SignUpController.to.setNickname(nickname);
        },
        validator: (nickname) {
          if (nickname!.isEmpty) {
            return "닉네임을 입력해주세요";
          } else if (nickname.length > 10) {
            return "닉네임은 10자리까지 가능합니다.";
          }

          if (errorMessage.isNotEmpty) {
            return errorMessage;
          }
          return null;
        },
      ),
    );
  }
}
