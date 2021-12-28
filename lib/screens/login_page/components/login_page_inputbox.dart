import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/constants/color_constants.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/theme/custom_textstyle.dart';

class LoginPageInputBox extends StatelessWidget {

  final Function(String)? onChanged;
  final labelText;

  LoginPageInputBox({this.onChanged, this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      cursorColor: Colors.grey,
      style:  Theme.of(context).textTheme.loginPageInputBoxText,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: inputBoxBackgroundColor,
        filled: true,
        prefixIcon: Icon(FontAwesomeIcons.user, color: buttonBorderColor,),
        focusColor: buttonBorderColor,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: buttonBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        floatingLabelStyle: Theme.of(context).textTheme.loginPageInputBoxText,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: buttonBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        labelText: labelText,
      ),
    );
  }

  // (value) {
  // c.setNickname(value);
  // Logger().d('nickname : ${c.simpleLoginInfo.value!.nickname}');
  // }
}
