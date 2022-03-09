import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/constants/constants.dart';

class InputBox extends StatelessWidget {
  const InputBox({Key? key}) : super(key: key);


  static Widget InputBoxContainer({required BuildContext context,required Widget child}) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double width =  queryData.size.width;
    double boxHeight =  queryData.size.height/15;   // TextField, button의 높이
    double topPadding = boxHeight/10;
    double verticalPadding = 4;
    double horizontalPadding = 40;

    return Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        height: boxHeight,
        child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double width =  queryData.size.width;
    double boxHeight =  queryData.size.height/15;   // TextField, button의 높이
    double topPadding = boxHeight/10;
    double verticalPadding = 4;
    double horizontalPadding = 15;

    return Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        height: boxHeight,
        child: TextField(
          // maxLength: 100,
          maxLines: 1,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            labelText: '별명',
          ),
        )
    );
  }
}
