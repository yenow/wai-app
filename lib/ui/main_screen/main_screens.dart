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
import 'package:logger/logger.dart';
import 'package:wai/controller/app_controller.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/common/controller/post_controller.dart';
import 'package:wai/controller/user_controller.dart';
import 'package:wai/common/controller/user_profile_controller.dart';
import 'package:wai/common/utils/enneagram_dialog.dart';
import 'package:wai/data/model/enneagram_test.dart';
import 'package:wai/models/post/api/post_request_dto.dart';
import 'package:wai/net/post/post_api.dart';
import 'package:wai/net/user/user_api.dart';
import 'package:wai/screens/home_page/home_page_screen.dart';
import 'package:wai/screens/posts_page/posts_page_screen.dart';
import 'package:wai/screens/profile_page/profile_page_screen.dart';
import 'package:wai/screens/search_page/search_page_screen.dart';
import 'package:wai/screens/splash_screen.dart';
import 'package:wai/common/utils/logger.dart';
import '../../main.dart';
import '../../screens/enneagram_page/enneagram_page_screen.dart';
import '../../screens/enneagram_page/enneagram_type_page_screen.dart';

class MainScreens extends StatelessWidget {
  MainScreens({Key? key}) : super(key: key);
  final PageController _pageController = PageController(keepPage: false);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   if (myEnneagramTest != null && MainController.to.isShowEnneagramDialog.value == false) {
    //     MainController.to.setIsShowEnneagramDialog(true);
    //
    //     EnneagramDialog.showEnneagramType(
    //         context: context,
    //         myEnneagramTest : myEnneagramTest!,
    //         onPressed: () {
    //           Get.to(() => EnneagramTypePageScreen(enneagramType: myEnneagramTest!.myEnneagramType!));
    //         }
    //     );
    //     // initAllPosts();
    //   }
    // });

    return _buildBody(context);

    // return FutureBuilder<void>(
    //     future: _isInit,
    //     builder: (context, snapshot) {
    //       switch (snapshot.connectionState) {
    //       /* 요청을 기다리는중 */
    //         case ConnectionState.waiting:
    //           return const SplashScreen();
    //         default:
    //         /* 에러시 */
    //           if (snapshot.hasError) {
    //             return Text('Error: ${snapshot.error}');
    //           } else {
    //             return _buildBody(context);
    //           }
    //       }
    //     }
    // );
  }


  Obx _buildBody(BuildContext context) {
    return Obx(() =>
        SafeArea(
          child: Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomInset : false,
            backgroundColor:  Colors.transparent,
            bottomNavigationBar: _buildBottomNavigationBar(),
            body: PageView(
              controller: _pageController,
              onPageChanged: (nextTabIndex) {
                MainController.to.setTabIndex(nextTabIndex);
              },
              children: const <Widget>[
                HomePageScreen(),
                PostsPageScreen(),
                SearchPageScreen(),
                EnneagramPageScreen(),
                ProfilePageScreen(),
              ],
            ),
          ),
        ),
    );
  }

  BottomNavigationBar? _buildBottomNavigationBar() {

    return BottomNavigationBar(
      currentIndex: MainController.to.currentTabIndex.value,
      backgroundColor: AppController.to.appState.value.bottomNavigationBackgroundColor,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blueGrey,
      type: BottomNavigationBarType.fixed,
      /* navigationBar item */
      items: const [
        BottomNavigationBarItem(
          label: '홈',
          icon: Icon(Icons.home_outlined,),  // CupertinoIcons.home
        ),
        BottomNavigationBarItem(
          label: '게시글',
          icon: Icon(Icons.article_outlined),
        ),
        BottomNavigationBarItem(
          label: '검색',
          icon: Icon(Icons.search_outlined),
        ),
        BottomNavigationBarItem(
          label: '에니어그램',
          icon: Icon(CupertinoIcons.book),    //  CupertinoIcons.book
        ),
        BottomNavigationBarItem(
            label: '프로필',
            icon: Icon(Icons.account_circle_outlined)
        )
      ],
      onTap: (nextTabIndex) {
        MainController.to.setTabIndex(nextTabIndex);
        _pageController.animateToPage(nextTabIndex, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
      },
    );
  }
}
