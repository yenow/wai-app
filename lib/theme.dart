/*  앱 테마 관련 파일  */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

TextTheme textTheme() {
  return TextTheme(
    headline1: GoogleFonts.jua(fontSize: headline1Value, color: Colors.black),
    headline2: GoogleFonts.jua(
        fontSize: headline2Value, color: Colors.black, fontWeight: FontWeight.bold),
    bodyText1: GoogleFonts.jua(fontSize: bodyText1Value, color: Colors.black),
    bodyText2: GoogleFonts.jua(fontSize: bodyText2Value, color: Colors.grey),
    subtitle1: GoogleFonts.jua(fontSize: 15.0, color: Colors.black),
  );
}

AppBarTheme appTheme() {
  return AppBarTheme(
    centerTitle: true,
    color: Colors.white,
    elevation: 0.0,
    titleTextStyle: GoogleFonts.jua(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: appBarTitleTextColor,
    ),
  );
}

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appTheme(),
  );
}
