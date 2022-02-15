import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/models/post/api/post_request_dto.dart';
import 'package:wai/screens/introduce_page/introduction_screen.dart';
import 'package:wai/screens/main_screens.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
import 'package:wai/screens/splash_screen.dart';
import 'common/controller/enneagram_controller.dart';
import 'common/controller/enneagram_test_controller.dart';
import 'common/controller/post_controller.dart';
import 'common/controller/user_controller.dart';
import 'common/controller/user_profile_controller.dart';
import 'common/theme/theme.dart';
import 'common/utils/navigation_service.dart';
import 'net/post/post_api.dart';
import 'net/user/user_api.dart';

double deviceWidth = 411.42857142857144;
double deviceHeight = 683.4285714285714;
double standardDeviceWidth = 411.42857142857144;
double standardDeviceHeight = 683.4285714285714;
double widthRatio = 1.0;
double heightRatio = 1.0;

void main() {
  runApp(const WaiApp());
}

class WaiApp extends StatelessWidget {
  const WaiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'wai',
      theme: theme(),
      home: const RootScreen(),
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: AppController.to.snackbarKey,
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late Future<void> _future;

  @override
  void initState() {
    _future = initAppState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<void>(
      future: _future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const SplashScreen();
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return AppController.to.isBuildIntroducePage.value == "N" ? const MainScreens() : IntroductionScreen();
            }
        }
      }
    );
  }

  Future<bool> initAppState() async {
    await AppController.to.initUserKey();
    await AppController.to.initUserId();
    await AppController.to.initIsBuildIntroducePage();

    await EnneagramController.to.initEnneagramInfomation();
    await EnneagramTestController.to.initEnneagramQuestionList();
    await EnneagramTestController.to.initSimpleEnneagramQuestionList();

    await initUserInfo();

    await Future.delayed(const Duration(seconds: 1), () {});

    return true;
  }
}
