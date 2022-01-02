import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/constants/custom_colors.dart';

import '../constants/constants.dart';

// CustomTextStyles(Theme.of(context).textTheme).buttonTextStyle1

extension CustomTextStyles on TextTheme {

  TextStyle get appbarText {
    return GoogleFonts.jua(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.blueGrey
    );
  }

  TextStyle get appbarTitleText {
    return GoogleFonts.jua(
        fontSize: 30,
        fontWeight: FontWeight.w400,
        color: Colors.blueGrey
    );
  }
}