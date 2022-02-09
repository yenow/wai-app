import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/models/enneagram_test/enneagram_test.dart';
import 'package:wai/screens/home_page/home_page_screen.dart';
import 'package:wai/screens/posts_page/posts_page_screen.dart';
import 'package:wai/screens/profile_page/profile_page_screen.dart';
import 'package:wai/screens/search_page/search_page_screen.dart';
import 'package:wai/screens/splash_screen.dart';
import 'package:wai/common/utils/logger.dart';
import '../main.dart';
import 'enneagram_page/enneagram_page_screen.dart';
import 'enneagram_page/enneagram_type_page_screen.dart';

class MainScreens extends StatelessWidget {
  MainScreens({Key? key, this.myEnneagramTest}) : super(key: key);
  final EnneagramTest? myEnneagramTest;
  final PageController _pageController = PageController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    widthRatio = (deviceWidth / standardDeviceWidth);
    heightRatio = (deviceHeight / standardDeviceHeight);

    return _buildBody(context);
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
              children: <Widget>[
                HomePageScreen(myEnneagramTest: myEnneagramTest),
                const PostsPageScreen(),
                const SearchPageScreen(),
                const EnneagramPageScreen(),
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
        _pageController.animateToPage(nextTabIndex, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
      },
    );
  }
}
