import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/init.dart';
import 'package:wai/main.dart';
import 'package:wai/route.dart';


class WaiSplashScreen extends StatelessWidget {
  const WaiSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    widthRatio = (deviceWidth / standardDeviceWidth);
    heightRatio = (deviceHeight / standardDeviceHeight);

    Future.delayed(const Duration(milliseconds: 1500), () async {

      await Init().initData();
      logger.d(AppController.to.isWatchIntroducePage.value);

      if(AppController.to.isWatchIntroducePage.value != "Y") {
        AppController.to.writeIsWatchIntroducePage("Y");
        Get.offAllNamed(WaiRoutes.introduction);
      } else if (UserController.to.user.value.userKey == null) {
        Get.offAllNamed(WaiRoutes.serviceAgree);
        // Get.offAllNamed(WaiRoutes.signUp);
      } else if (UserController.to.user.value.myEnneagramType == null) {
        Get.offAllNamed(WaiRoutes.whoAmI);
      } else {
        Get.offAllNamed(WaiRoutes.main, parameters: {"showEnneagramDialog": "Y"});
      }

    });

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