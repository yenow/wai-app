import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';

class WaiCircularProgressIndicator extends StatelessWidget {
  const WaiCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: WaiColors.black70,
      body: Center(
          child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(color: WaiColors.mainColor,)
          )
      )
    );
  }
}
