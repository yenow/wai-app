import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/constants/custom_colors.dart';

import '../constants/constants.dart';

// CustomTextStyles(Theme.of(context).textTheme).buttonTextStyle1

class CustomTextStyles  {

  static TextStyle buildTextStyle({double fontSize = 15, color = Colors.blueGrey}) {
    return GoogleFonts.jua(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color
    );
  }

}