import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/main.dart';

class WaiSnackBar  {

  static SnackBar bottom({required String text}) {
    return SnackBar(
      content: Text(text, style: WaiTextStyle().snackBar(),),
      backgroundColor: WaiColors.lightBlueGrey,
      duration: const Duration(milliseconds: 3000),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  static SnackBar top({required String text}) {
    return SnackBar(
      content: Text(text, style: WaiTextStyle().snackBar(),),
      backgroundColor: WaiColors.lightBlueGrey,
      duration: const Duration(milliseconds: 2000),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(
          bottom: deviceHeight - 150,
          right: 20,
          left: 20
      ),
    );
  }

  static SnackBar build({required String text}) {
    return SnackBar(
      content: Text(text, style: WaiTextStyle().snackBar(),),
      backgroundColor: WaiColors.blueGrey,
      duration: const Duration(milliseconds: 3000),
      width: 280.0, // Width of the SnackBar.
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      action: SnackBarAction(
        label: '확인',
        textColor: WaiColors.white,
        onPressed: () {
          // Code to execute.
        },
      ),
    );
  }
}
