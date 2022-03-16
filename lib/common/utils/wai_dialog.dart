import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as _toast;
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/constants/wai_textstyle.dart';

import '../../constants/wai_colors.dart';

class WaiDialog {
  static Future<bool> dialogConfirmation(
      String title,
      String content, [
        String textNo = 'No',
        String textYes = 'Yes',
      ]) async {
    return await Get.dialog(
      AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text(textNo),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text(textYes),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  static Future<bool> dialogConfirmationWith(
      BuildContext context,
      String title,
      String content, {
        String textNo = 'No',
        String textYes = 'Yes',
      }) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(textNo),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(textYes),
            ),
          ],
        );
      },
    );
  }

  static void dialogError(String message) {
    Get.dialog(
      SimpleDialog(
        children: [
          Center(
            child: Icon(
              Icons.error_outline_outlined,
              color: Colors.red[700],
              size: 40,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  static void dialogSuccess(String message) {
    Get.dialog(
      SimpleDialog(
        children: [
          Center(
            child: Icon(
              Icons.check_circle_outline_outlined,
              color: Colors.green[700],
              size: 40,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  static void dialogNetral(String message, {IconData? icon}) {
    Get.dialog(
      SimpleDialog(
        children: [
          if (icon != null)
            Center(
              child: Icon(
                icon,
                color: Colors.blue[700],
                size: 40,
              ),
            ),
          if (icon != null) const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  static void closeDialog(
      {Duration? durationBeforeClose, Function? actionAfterClose}) {
    Future.delayed(
      durationBeforeClose ?? const Duration(milliseconds: 2500),
          () {
        Get.back();
        if (actionAfterClose != null) actionAfterClose.call();
      },
    );
  }

  static void toastError(String message, {bool isLong = false}) {
    _toast.Fluttertoast.showToast(
      msg: message,
      toastLength:
      isLong ? _toast.Toast.LENGTH_LONG : _toast.Toast.LENGTH_SHORT,
      gravity: _toast.ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red[100],
      textColor: Colors.red[900],
      fontSize: 16,
    );
  }

  static void toastSuccess(String message, {bool isLong = false}) {
    _toast.Fluttertoast.showToast(
      msg: message,
      toastLength:
      isLong ? _toast.Toast.LENGTH_LONG : _toast.Toast.LENGTH_SHORT,
      gravity: _toast.ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green[100],
      textColor: Colors.green[900],
      fontSize: 16,
    );
  }

  static void toastNetral(String message, {bool isLong = false}) {
    _toast.Fluttertoast.showToast(
      msg: message,
      toastLength:
      isLong ? _toast.Toast.LENGTH_LONG : _toast.Toast.LENGTH_SHORT,
      gravity: _toast.ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue[100],
      textColor: Colors.blue[900],
      fontSize: 16,
    );
  }

  static void closeToast() {
    _toast.Fluttertoast.cancel();
  }

  static void snackBarError(String message) {
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: TextStyle(color: Colors.red[900]),
      ),
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: Colors.red[100]!,
    );
  }

  static void snackBarSuccess(String message) {
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: TextStyle(color: Colors.green[900]),
      ),
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: Colors.green[100]!,
    );
  }

  static void snackBarNetral(String message) {
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: TextStyle(color: Colors.blue[900]),
      ),
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: Colors.blue[100]!,
    );
  }

  static void closeSnackBarOrNotify() {
    Get.closeAllSnackbars();
  }

  static void notify(
      String title,
      String message, {
        double radius = 12,
        bool showBorder = false,
        Color titleColorText = WaiColors.black60,
        Color messageColorText = WaiColors.black60,
        Color backgroundColor = WaiColors.white60,
        Color borderColor = WaiColors.white60,
      }) {
    Get.snackbar(
      title,
      message,
      titleText: Text(title, style: TextStyle(fontSize: 18, color: titleColorText)),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message, style: TextStyle(fontSize: 15, color: messageColorText),),
          InkWell(
              onTap: () {
                closeSnackBarOrNotify();
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('확인', style: TextStyle(fontSize: 15, color: messageColorText),),
              )
          ),
        ],
      ),
      colorText: messageColorText,
      backgroundColor: backgroundColor,
      borderColor: showBorder ? borderColor : Colors.transparent,
      borderRadius: radius,
      borderWidth: showBorder ? 1 : 0,
      isDismissible: false,
      animationDuration: const Duration(milliseconds: 800),
      duration: const Duration(milliseconds: 2000),
    );
  }

  static void notifySuccess(
      String title,
      String message, {
        double radius = 12,
        bool showBorder = false,
        Color colorText = WaiColors.white,
        Color backgroundColor = WaiColors.lightBlueGrey,
        Color borderColor = WaiColors.lightBlueGrey,
      }) {
    Get.snackbar(
      title,
      message,
      titleText: Text(title, style: TextStyle(color: WaiColors.white)),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message, style: TextStyle(fontSize: 13, color: WaiColors.white),),
          InkWell(
              onTap: () {
                closeSnackBarOrNotify();
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('확인', style: TextStyle(fontSize: 13, color: WaiColors.white),),
              )
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      colorText: colorText,
      borderColor: showBorder ? borderColor : Colors.transparent,
      borderRadius: radius,
      borderWidth: showBorder ? 1 : 0,
      isDismissible: false,
      animationDuration: const Duration(milliseconds: 800),
      duration: const Duration(milliseconds: 2000),
    );
  }

  static void notifyNetral(
      String title,
      String message, {
        double radius = 12,
        bool showBorder = false,
      }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blue[100],
      colorText: Colors.blue[900],
      borderColor: showBorder ? Colors.blue[900] : Colors.transparent,
      borderRadius: radius,
      borderWidth: showBorder ? 1 : 0,
      isDismissible: false,
    );
  }
}