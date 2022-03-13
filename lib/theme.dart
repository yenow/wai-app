/*  앱 테마 관련 파일  */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/constants/wai_colors.dart';

import 'constants/constants.dart';

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
    appBarTheme: appTheme(),
    scaffoldBackgroundColor: Colors.white,

    textTheme: GoogleFonts.juaTextTheme(),
    primaryTextTheme: GoogleFonts.juaTextTheme(),
    fontFamily: 'jua',

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: WaiColors.lightBlueGrey,
      elevation: 1
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size.infinite),
        textStyle: MaterialStateProperty.all(GoogleFonts.jua()),
        backgroundColor: MaterialStateProperty.all(WaiColors.mainColor),
        overlayColor: MaterialStateProperty.all(WaiColors.mainColor),
        elevation: MaterialStateProperty.all(1),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )
        ),
      )
    ),
  );
}
