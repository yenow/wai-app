import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/screens/introduction_screen.dart';
import 'package:wai/screens/main_screens.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
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
      home: AutoLoginState(),
      getPages: [
        // GetPage(name : '/PostPageScreen', page: () => PostPage())
      ],
      theme: theme(),
    );
  }
}

class AutoLoginState extends StatelessWidget {
  AutoLoginState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<bool>(
      future: AppController.to.initAppState(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
        /*요청을 기다리는중*/
          case ConnectionState.waiting:
            return Scaffold(
              body: Center(
                child: const CircularProgressIndicator()
              )
            );
          default:
            if (snapshot.hasError) {    /*에러시*/
              return Text('Error: ${snapshot.error}');
            } else {
              return AppController.to.isBuildIntroducePage.value == "N" ? MainScreens() : IntroductionSrceen();
            }
        }
    });
  }
}

//
// class AutoLoginState extends StatefulWidget {
//   const AutoLoginState({Key? key}) : super(key: key);
//
//   @override
//   _AutoLoginStateState createState() => _AutoLoginStateState();
// }
//
// class _AutoLoginStateState extends State<AutoLoginState> {
//   Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   late Future<String?> userKey;
//
//   @override
//   void initState() {
//     userKey = _prefs.then((SharedPreferences prefs) {
//       return prefs.getString('userKey');
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<String?>(
//       future: userKey,
//       builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
//         switch (snapshot.connectionState) {
//           /*요청을 기다리는중*/
//           case ConnectionState.waiting:
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           default:
//             if (snapshot.hasError) {    /*에러시*/
//               return Text('Error: ${snapshot.error}');
//             } else {
//               Logger().d("userKey : $snapshot.data");
//               return snapshot.data == null ? IntroductionSrceen() : MainScreens();
//             }
//         }
//     });
//   }
// }
//
// Future<String?> getUserKey () async {
//   final prefs = await SharedPreferences.getInstance();
//   final String? counter = prefs.getString("userKey");
//   Logger().d(counter);
//   return counter;
// }
//
//
//
//
// class AutoLoginState2 extends StatelessWidget {
//   AutoLoginState2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (AppController.to.initialized) {
//
//         if (AppController.to.userKey.value == null) {
//           return IntroductionSrceen();
//         } else {
//           return MainScreens();
//         }
//       } else {
//         return Scaffold(
//             body: const CircularProgressIndicator()
//         );
//       }
//     });
//   }
// }