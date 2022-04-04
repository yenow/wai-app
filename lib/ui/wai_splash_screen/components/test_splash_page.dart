import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/constants/wai_colors.dart';

class TestSplashPage extends StatelessWidget {
  const TestSplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WaiColors.deepDarkMainColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image:
              AssetImage("assets/images/enneagram/pawprint.png"),
              width: 100,
              height: 100,
              color: Colors.blueGrey,
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
            Blank(
              height: 10,
            ),
            Center(
              child: Text("WAI ", style: TextStyle(fontSize: 50, color: Colors.white))
            ),
          ],
        ),
      ),
    );
  }
}
