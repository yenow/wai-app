import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:wai/screens/login_page/simple_login_page_screen.dart';
import 'package:wai/screens/posts_page/components/post_page_screen.dart';
import 'common/theme/theme.dart';

double deviceWidth = 411.42857142857144;
double deviceHeight = 683.4285714285714;
double standardDeviceWidth = 411.42857142857144;
double standardDeviceHeight = 683.4285714285714;
double widthRatio = 1.0;
double heightRatio = 1.0;

void main() {
  runApp(const WaiUI());
}

class WaiUI extends StatelessWidget {
  const WaiUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(    // CupertinoApp, GetMaterialApp
      title: 'wai_ui',
      debugShowCheckedModeBanner: false,
      home: SimpleLoginPageScreen(), /*HomePage(),*/ /*IntroductionSrceen(),*/
      getPages: [
        GetPage(name : '/PostPageScreen', page: () => PostPageScreen())
      ],
      theme: theme(),
    );
  }
}
