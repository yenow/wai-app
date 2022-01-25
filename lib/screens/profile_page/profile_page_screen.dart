import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/screens/introduction_screen.dart';

import '../../main.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),   // MainController.to.appBarState.value.appbarSize
          child: AppBar(
            title: Text("프로필"),
            elevation: 2.0,
            backgroundColor: Colors.white,
          ),
        ),
        body: _buildbody(context)
    );
  }

  SingleChildScrollView _buildbody(BuildContext context) {

    return SingleChildScrollView(
        child: Stack(
        children: <Widget>[
          _buildTopBackground(),
          Padding(
            padding: EdgeInsets.fromLTRB(0, deviceHeight * 0.3, 0, 0),
            child: ElevatedButton(
                child: Text('userKey delete'),
                onPressed: ()  async {
                  await AppController.to.removeUserKey();

                  var string = await AppController.to.getUserKey();
                  Logger().d(string);

                  Get.off(IntroductionSrceen());
                }
            ),
          )
        ]
      )
    );
  }

  Container _buildTopBackground() {
    return Container(
      height: deviceHeight * .30,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [
              0.1,
              0.5,
              0.9,
            ],
            colors: [
              babyBlueShade100,
              babyBlueShade60,
              babyBlueShade30,
            ]
        ),
      ),
    );
  }
}


/*
ElevatedButton(
  child: Text('userKey delete'),
  onPressed: ()  async {
  await AppController.to.removeUserKey();

  var string = await AppController.to.getUserKey();
  Logger().d(string);

  Get.off(IntroductionSrceen());
  }
)*/
