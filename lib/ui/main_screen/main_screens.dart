import 'dart:async';
import 'dart:async';
import 'dart:async';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/controller/post/post_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/common/utils/enneagram_dialog.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/ui/main_screen/components/main_body.dart';
import 'package:wai/ui/main_screen/components/main_bottom_navigation.dart';
import 'package:wai/ui/main_screen/components/main_bottom_sheet.dart';
import 'package:wai/ui/main_screen/components/wai_drawer.dart';
import 'package:wai/ui/main_screen/home_screen/home_screen.dart';
import '../../main.dart';

class MainScreens extends StatelessWidget {
  const MainScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (Get.parameters['showEnneagramDialog'] == "Y"/* && MainController.to.isShowEnneagramDialog.value == false*/) {
        EnneagramTest myTest = UserController.to.userEnneagramTests.elementAt(0);

        // EnneagramDialog.showEnneagramType(
        //     context: context,
        //     myEnneagramTest : myTest,
        //     onPressed: () {
        //       Get.to(() => EnneagramTypePageScreen(enneagramType: myTest.myEnneagramType!));
        //     }
        // );
      }
    });

    return Obx(() =>
      SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          resizeToAvoidBottomInset : false,
          key: MainController.to.scaffoldKey,
          backgroundColor: Colors.transparent,
          body: MainBody(currentTabIndex: MainController.to.currentTabIndex.value),
          // backgroundColor: Colors.white,
          bottomNavigationBar: const MainBottomNavigation(),     // _buildBottomAppBar    _buildBottomNavigationBar
          // drawer: const WaiDrawer(),
        ),
      ),
    );
  }
}
