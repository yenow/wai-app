import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/constants/wai_colors.dart';

class WaiCircularProgressIndicator extends StatelessWidget {
  const WaiCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(color: WaiColors.blueGrey,)
          )
      )
    );
  }
}
