import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/theme/custom_textstyle.dart';

class LoginPageButton extends StatelessWidget {
  final boxHeight;
  final Function()? onPressed;
  final TextStyle? textStyle;
  final buttonText;

  LoginPageButton({this.boxHeight, this.onPressed, this.textStyle, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: boxHeight,
      child: TextButton (
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.loginPageButtonText),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.white)
                )
            )
        ),
        onPressed: onPressed,
        child: Text(buttonText,
            style: Theme.of(context).textTheme.loginPageButtonText
        ),
      ),
    );
  }
}
// /* 유효성 검사 통과시 */
// if (checkSimpleLoginInfo(context: context, simpleLoginInfo: c.simpleLoginInfo.value)) {
// // web API 날려서 DB 저장후, 다시와서 페이지 이동해야함.
// // fetchLoginResponseDto(c.simpleLoginInfo.value)
// }