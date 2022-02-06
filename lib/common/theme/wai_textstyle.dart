import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WaiTextStyle {
  WaiTextStyle({this.fontSize, this.color, this.fontWeight});
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  TextStyle basic() {
    return GoogleFonts.jua(
      fontSize: fontSize ?? 15,
      color: color ?? Colors.blueGrey,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
}