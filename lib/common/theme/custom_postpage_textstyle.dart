import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/constants/custom_colors.dart';

import '../constants/constants.dart';

// CustomTextStyles(Theme.of(context).textTheme).buttonTextStyle1

extension CustomPostPageTextStyles on TextTheme {

  TextStyle get postTitleText {
    return GoogleFonts.jua(
        fontSize: 20,
        color: grayColor1
    );
  }

  TextStyle get postNicknameText {
    return GoogleFonts.jua(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: grayColor1
    );
  }

  TextStyle get postContentText {
    return GoogleFonts.jua(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: grayColor1
    );
  }

  TextStyle get postPlainText {
    return GoogleFonts.jua(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: grayColor1
    );
  }

  TextStyle get postPosonalityTypeText {
    return GoogleFonts.jua(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: grayColor1
    );
  }

  TextStyle get postingTitleText {
    return GoogleFonts.jua(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: grayColor1
    );
  }

  TextStyle get postingContentText {
    return GoogleFonts.jua(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: grayColor1
    );
  }

  TextStyle get postingLabelText {
    return GoogleFonts.jua(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.blueGrey
    );
  }
}