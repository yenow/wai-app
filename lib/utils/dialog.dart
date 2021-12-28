import 'package:flutter/material.dart';

void flutterDialog({
      required BuildContext context,
      required String titleText,
      required String contentText,
    }) {
    showDialog(
        context: context,
        barrierDismissible: false,  // barrierDismissible : Dialog를 제외한 다른 화면 터치 x
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(  // RoundedRectangleBorder :  Dialog 화면 모서리 둥글게 조절
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                Text(titleText),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(contentText,),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
}
