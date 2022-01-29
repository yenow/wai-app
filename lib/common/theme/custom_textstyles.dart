import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles  {

  static TextStyle buildTextStyle({double fontSize = 15, color = Colors.blueGrey}) {
    return GoogleFonts.jua(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color
    );
  }

  static TextStyle postTitleStyle({double fontSize = 28, color = Colors.black87}) {
    return GoogleFonts.jua(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
    );
  }

  static TextStyle blockTextStyle({double fontSize = 15}) {
    return GoogleFonts.jua(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: Colors.grey
    );
  }

  static TextStyle headline1({double fontSize = 24, Color color = Colors.black54}) {
    return GoogleFonts.jua(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color
    );
  }

  static TextStyle headline2({double fontSize = 20, Color color = Colors.black54}) {
    return GoogleFonts.jua(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color
    );
  }

  static TextStyle headline3({double fontSize = 18, Color color = Colors.black54}) {
    return GoogleFonts.jua(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color
    );
  }

  static TextStyle bodytext1({double fontSize = 18, Color color = Colors.black54}) {
    return GoogleFonts.jua(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color
    );
  }

}