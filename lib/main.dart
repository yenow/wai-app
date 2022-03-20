import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:wai/common/interceptor/custom_log_interceptor.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/permernent/enneagram_controller.dart';
import 'package:wai/controller/permernent/enneagram_controller.dart';
import 'package:wai/controller/permernent/enneagram_test_controller.dart';
import 'package:wai/initial_data.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/introduce_screen/introduction_screen.dart';
import 'package:wai/ui/who_am_i_screen/who_am_i_screen.dart';
import 'package:wai/ui/main_screen/main_screens.dart';
import 'package:wai/ui/sign_up_screen/sign_up_screen.dart';
import 'package:wai/ui/wai_splash_screen/wai_splash_screen.dart';
import 'binding/introduction_binding.dart';
import 'binding/sign_up_binding.dart';

import 'common/interceptor/token_interceptor.dart';
import 'common/widgets/blank.dart';
import 'controller/permernent/user_controller.dart';
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

var mainDio = Dio(
  BaseOptions(
    baseUrl: 'http://192.168.0.2:8080/api',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {
      "Accept": "application/json",
      "Content-Type" : "application/json; charset=UTF-8",
    },
  )
)..interceptors.add(CustomLogInterceptor())
 ..interceptors.add(LogInterceptor(requestHeader: true, requestBody: true, responseBody: true));
// ..interceptors.add(TokenInterceptor());

void main() {
  InitialData.initController();
  runApp(const WaiApp());
}


class WaiApp extends StatelessWidget {
  const WaiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    loggerNoStack.d("start WaiApp");

    return GetMaterialApp(
      title: 'wai',
      theme: theme(),
      getPages: AppPages.routes,
      initialRoute: WaiRoutes.initial,
      // initialBinding: InitBinding(),
      // home: const InitialScreen(),  //  WaiSplashScreen  HomeScreen
      debugShowCheckedModeBanner: false,
      // scaffoldMessengerKey: AppController.to.snackBarKey,
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}