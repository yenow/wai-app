import 'package:flutter/material.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/theme/wai_textstyle.dart';

import 'blank.dart';
import 'block_text.dart';

class WaiDialog {

  static void showMessage({
    required BuildContext context, String? title,
    required String content,
  }) {

    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title : Text("알림", style: WaiTextStyle().headlineBlueGrey(),  textAlign: TextAlign.center,),
            content: Text(content, style: WaiTextStyle().bodyText(),  textAlign: TextAlign.center,),
            actions: <Widget>[
              _buildConfirmButton(
                onPressed: () {
                  Navigator.pop(context);
                }
              )
            ],
          );
        }
    );
  }

  static void showConfirmMessage({
    required BuildContext context, String? title,
    required String content,
    required VoidCallback confirmOnPress,
    /*required VoidCallback calcelOnPress,*/
  }) {

    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title : Text("알림", style: WaiTextStyle().headlineBlueGrey(), textAlign: TextAlign.center,),
            content: Text(content, style: WaiTextStyle().bodyText()),
            actions: <Widget>[
              _buildConfirmButton(
                onPressed: () {
                  Navigator.pop(context);
                  confirmOnPress();
                }
              ),
              _buildCancelButton(
                onPressed: () {
                  Navigator.pop(context);
                }
              )
            ],
          );
        }
    );
  }

  static Widget _buildConfirmButton({required VoidCallback onPressed}) {
    return ElevatedButton(
      child: Text("확인", style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.white),),
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(WaiColors.blueGrey)
      ),
    );
  }

  static Widget _buildCancelButton({required VoidCallback onPressed}) {
    return ElevatedButton(
      child: Text("취소", style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.white),),
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(WaiColors.blueGrey)
      ),
    );
  }
}