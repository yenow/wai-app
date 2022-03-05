import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/app_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/controller/wai_splash_controller.dart';
import 'package:wai/route/route.dart';


class WaiSplashScreen extends StatelessWidget {
  const WaiSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("WaiSplashScreen");

    // Future.delayed(const Duration(milliseconds: 1000), () async {
    //   await AppController.to.getLoginInfo();
    //   await AppController.to.getIsWatchIntroducePage();
    //   logger.d(AppController.to.isWatchIntroducePage.value);
    //
    //   if(AppController.to.isWatchIntroducePage.value != "Y") {
    //     Get.offAllNamed(Routes.introduction);
    //   }
    // });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image:
              AssetImage("assets/images/enneagram/pawprint.png"),
              width: 100,
              height: 100,
              color: Colors.blueGrey,
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
            const Blank(
              height: 10,
            ),
            Center(
                child: Text("WAI ", style: CustomTextStyles.buildTextStyle(fontSize: 50, color: Colors.blueGrey))),
          ],
        ),
      ),
    );
  }
}