import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/permenent/enneagram_controller.dart';
import 'package:wai/controller/permenent/enneagram_controller.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/init.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/introduce_screen/introduction_screen.dart';
import 'package:wai/ui/who_am_i_screen/who_am_i_screen.dart';
import 'package:wai/ui/main_screen/main_screens.dart';
import 'package:wai/ui/sign_up_screen/sign_up_screen.dart';
import 'package:wai/ui/wai_splash_screen/wai_splash_screen.dart';
import 'binding/introduction_binding.dart';
import 'binding/sign_up_binding.dart';

import 'common/interceptor/token_interceptor.dart';
import 'controller/permenent/user_controller.dart';
import 'theme.dart';
import 'common/utils/logger.dart';
import 'common/utils/navigation_service.dart';
import 'data/provider/enneagram_api_provider.dart';


double deviceWidth = 411.42857142857144;
double deviceHeight = 683.4285714285714;
double standardDeviceWidth = 411.42857142857144;
double standardDeviceHeight = 683.4285714285714;
double widthRatio = 1.0;
double heightRatio = 1.0;

var dio = Dio(
  BaseOptions(
    baseUrl: 'http://192.168.0.2:8080/api',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {
      "Accept": "application/json",
      "Content-Type" : "application/json; charset=UTF-8",
    },
  )
)..interceptors.add(LogInterceptor(responseBody: true, requestBody: true))
..interceptors.add(TokenInterceptor());

void main() {
  // await Init().initialize();
  Init().initController();
  runApp(const WaiApp());
}


class WaiApp extends StatelessWidget {
  const WaiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return GetMaterialApp(
      title: 'wai',
      theme: theme(),
      initialRoute: WaiRoutes.initial,
      getPages: AppPages.routes,
      // initialBinding: InitBinding(),
      // home: const HomeScreen(),  //  WaiSplashScreen  HomeScreen
      debugShowCheckedModeBanner: false,
      // scaffoldMessengerKey: AppController.to.snackBarKey,
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}



//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   late Future<void> _future;
//
//   @override
//   void initState() {
//     _future = initAppState();
//     super.initState();
//   }
//
//   Future<bool> initAppState() async {
//     await AppController.to.getLoginInfo();
//     await AppController.to.getIsWatchIntroducePage();
//     // await initEnneagramInformation();
//     // await initEnneagramQuestionList();
//     // await initSimpleEnneagramQuestionList();
//     // await initUserInfo();
//     await Future.delayed(const Duration(seconds: 1), () {});
//     return true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return FutureBuilder<void>(
//       future: _future,
//       builder: (context, snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.waiting:
//             return const SplashScreen();
//           default:
//             if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//
//             } else {
//
//               if (AppController.to.isWatchIntroducePage.value != "Y") {
//                  return const IntroductionScreen();
//               } else {
//
//                 if (UserController.to.user.value.nickname == null) {
//                   return const SignUpScreen();
//                 } else if (UserController.to.user.value.enneagramTests.isEmpty) {
//                   return const WhoAmIScreen();
//                 } else {
//                   return const MainScreens();
//                 }
//               }
//             }
//         }
//       }
//     );
//   }
//
// }
