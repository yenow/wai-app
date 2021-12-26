import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

// CustomTextStyles(Theme.of(context).textTheme).buttonTextStyle1

extension CustomTextStyles on TextTheme {

  TextStyle get buttonTextStyle_size20 {
    return GoogleFonts.jua(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: grayColor1
    );
  }

  TextStyle get buttonTextStyle_size18 {
    return GoogleFonts.jua(
        fontSize: 18,
        color: grayColor1
    );
  }

  TextStyle get buttonTextStyle_size16 {
    return GoogleFonts.jua(
        fontSize: 16,
        color: grayColor1
    );
  }

  TextStyle get floatingLabelTextStyle {
    return GoogleFonts.jua(
        fontSize: 18,
        color: grayColor1
    );
  }
}