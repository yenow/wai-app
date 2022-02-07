/*  앱 테마 관련 파일  */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/theme/custom_loginpage_textstyle.dart';

import '../constants/constants.dart';

TextTheme textTheme() {
  return TextTheme(
    headline1: GoogleFonts.jua(fontSize: headline1Size, color: Colors.black, fontWeight: FontWeight.w500),
    headline2: GoogleFonts.jua(fontSize: headline2Size, color: Colors.black, fontWeight: FontWeight.w500),
    headline3: GoogleFonts.jua(fontSize: headline1Size, color: Colors.black),
    headline4: GoogleFonts.jua(fontSize: headline1Size, color: Colors.black),
    headline5: GoogleFonts.jua(fontSize: headline1Size, color: Colors.black),
    headline6: GoogleFonts.jua(fontSize: headline1Size, color: Colors.black),
    bodyText1: GoogleFonts.jua(fontSize: bodyText1Size, color: Colors.black),
    bodyText2: GoogleFonts.jua(fontSize: bodyText2Size, color: Colors.grey),
    subtitle1: GoogleFonts.jua(fontSize: 15.0, color: Colors.black),
  );
}

AppBarTheme appTheme() {
  return AppBarTheme(
    centerTitle: true,
    color: Colors.white,
    elevation: 0.0,
    titleTextStyle: GoogleFonts.jua(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      color: Colors.black54,
    ),
  );
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(),
    appBarTheme: appTheme(),
  );
}
