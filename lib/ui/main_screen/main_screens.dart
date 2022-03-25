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
import 'package:wai/ui/search_screen/search_page_screen.dart';
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
          key: MainController.to.scaffoldKey,

          body: MainBody(currentTabIndex: MainController.to.currentTabIndex.value),

          // backgroundColor: Colors.white,
          resizeToAvoidBottomInset : false,
          bottomNavigationBar: const MainBottomNavigation(),     // _buildBottomAppBar    _buildBottomNavigationBar
          extendBody: true,

          drawer: WaiDrawer(),

          // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          // floatingActionButton: FloatingActionButton(
          //   child: Icon(Icons.add, color: WaiColors.white),
          //   onPressed: () {
          //     Get.bottomSheet(MainBottomSheet());
          //   },
          // ),
        ),
      ),
    );
  }

  // Widget buildBody() {
  //   switch(MainController.to.currentTabIndex.value) {
  //     case 0 :
  //       return HomeScreen();
  //     case 2 :
  //       return Screen3();
  //     default :
  //       return Container();
  //   }
  //
  //   return PageView(
  //           controller: _pageController,
  //           onPageChanged: (nextTabIndex) {
  //             MainController.to.setTabIndex(nextTabIndex);
  //           },
  //           children: <Widget>[
  //             HomeScreen(),
  //             Screen2(),
  //             Screen3(),
  //             Screen4(),
  //             Screen5(),
  //             // HomePageScreen(),
  //             // PostsPageScreen(),
  //             // SearchPageScreen(),
  //             // EnneagramPageScreen(),
  //             // ProfilePageScreen(),
  //           ],
  //         );
  // }
}
