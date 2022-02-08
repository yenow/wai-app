import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/constants/wai_colors.dart';

class WaiTextStyle {
  WaiTextStyle({this.fontSize, this.color, this.fontWeight});
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  TextStyle basic() {
    return GoogleFonts.jua(
      fontSize: fontSize ?? 15,
      color: color ?? WaiColors.blueGrey,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  TextStyle enneagramQuestion() {
    return GoogleFonts.jua(
      fontSize: fontSize ?? 16,
      color: color ?? WaiColors.lightBlack,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  TextStyle tabBar() {
    return GoogleFonts.jua(
      fontSize: fontSize ?? 15,
      color: color ?? WaiColors.lightBlueGrey,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  TextStyle bodyText() {
    return GoogleFonts.jua(
      fontSize: fontSize ?? 15,
      color: color ?? Colors.black54,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
}