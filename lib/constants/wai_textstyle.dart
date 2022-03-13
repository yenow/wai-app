import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/constants/wai_colors.dart';

TextStyle waiTextStyle({
  double fontSize = 15,
  Color color = WaiColors.blueGrey,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return GoogleFonts.jua(
    fontSize: fontSize ,
    color: color,
    fontWeight: fontWeight,
  );
}