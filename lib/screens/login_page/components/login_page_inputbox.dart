import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/theme/custom_loginpage_textstyle.dart';

class LoginPageInputBox extends StatelessWidget {

  final Function(String)? onChanged;
  final String? labelText;
  final keyboardType;
  final int? maxLength;
  final Widget prefixIcon;

  LoginPageInputBox({this.onChanged, this.labelText, this.keyboardType, this.maxLength, required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.grey,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLength: maxLength ?? 20,
      style:  Theme.of(context).textTheme.loginPageInputBoxText,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.loginPageInputBoxLabelText,
        fillColor: inputBoxBackgroundColor,
        filled: true,
        counterText:'',
        prefixIcon: prefixIcon,
        focusColor: buttonBorderColor,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: buttonBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        floatingLabelStyle: Theme.of(context).textTheme.loginPageInputBoxFloatingText,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: buttonBorderColor),
            borderRadius: BorderRadius.all(Radius.circular(8))
        ),
      ),
    );
  }

  // (value) {
  // c.setNickname(value);
  // Logger().d('nickname : ${c.simpleLoginInfo.value!.nickname}');
  // }
}
