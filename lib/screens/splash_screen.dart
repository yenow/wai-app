import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/screens/main_screens.dart';
import 'package:wai/common/widgets/blank.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage("assets/images/enneagram/pawprint.png"),
            width: 100 ,
            height: 100,
            color: Colors.blueGrey,
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
          const Blank(height: 10,),
          Center(child: Text("WAI ", style: CustomTextStyles.buildTextStyle(fontSize: 50, color: Colors.blueGrey))),
        ],
      ),
    );
  }
}

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            title: Text("wai"),
            elevation: 2.0,
          ),
        ),
        backgroundColor: Colors.white,
        body: const Center(
          child: CircularProgressIndicator()
        )
    );
  }
}
