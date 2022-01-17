import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/constants/custom_colors.dart';
import '../constants/constants.dart';


// CustomTextStyles(Theme.of(context).textTheme).buttonTextStyle1

extension CustomLoginPageTextStyles on TextTheme {

  /* login */
  TextStyle get loginPageButtonText {
    return GoogleFonts.jua(
        fontSize: 16,
        color: grayColor1
    );
  }
  TextStyle get reverseLoginPageButtonText {
    return GoogleFonts.jua(
        fontSize: 16,
        color: Colors.white
    );
  }


  TextStyle get loginPageInputBoxLabelText {
    return GoogleFonts.jua(
        fontSize: 16,
        color: buttonLabelColor
    );
  }

  TextStyle get loginPageInputBoxFloatingText {
    return GoogleFonts.jua(
        fontSize: 17,
        color: buttonFloatingColor
    );
  }

  TextStyle get loginPageInputBoxText {
    return GoogleFonts.jua(
        fontSize: 18,
        color: buttonTextColor
    );
  }
}