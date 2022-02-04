import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/screens/home_page/home_page_screen.dart';
import 'package:wai/screens/posts_page/posts_page_screen.dart';
import 'package:wai/screens/profile_page/profile_page_screen.dart';
import 'package:wai/screens/search_page/search_page_screen.dart';
import 'package:wai/utils/logger.dart';
import '../main.dart';
import 'enneagram_page/enneagram_page_screen.dart';
import 'enneagram_page/enneagram_type_page_screen.dart';

class MainScreens extends StatefulWidget {
  MainScreens({Key? key, this.enneagramType}) : super(key: key);
  int? enneagramType;

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  late Future<void> initBool;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    initBool =  MainController.to.initMainScreens();
  }

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    widthRatio = (deviceWidth / standardDeviceWidth);
    heightRatio = (deviceHeight / standardDeviceHeight);
    loggerNoStack.d("build MainScreens");

    return FutureBuilder(
        future: initBool,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
          /*요청을 기다리는중*/
            case ConnectionState.waiting:
              return const Scaffold(
                  body: Center(
                      child: CircularProgressIndicator()
                  )
              );
            default:
              if (snapshot.hasError) {    /*에러시*/
                return Scaffold(body : Text('Error: ${snapshot.error}'));
              } else {
                return _buildBody(context);
              }
          }
        }
    );
    return _buildBody(context);
  }

  Obx _buildBody(BuildContext context) {
    return Obx(() =>
        SafeArea(
          child: Scaffold(
            // backgroundColor: MainController.to.appState.value.backgroundColor,
            resizeToAvoidBottomInset : false,
            backgroundColor:  Colors.transparent,
            bottomNavigationBar: _buildBottomNavigationBar(),
            body: PageView(
              controller: _pageController,
              onPageChanged: (nextTabIndex) {
                MainController.to.setTabIndex(nextTabIndex);
                // MainController.to.currentTabIndex.value;
              },
              children: <Widget>[
                HomePageScreen(enneagramType: widget.enneagramType),
                PostsPageScreen(),
                SearchPageScreen(),
                EnneagramPageScreen(),
                ProfilePageScreen(enneagramType: widget.enneagramType),
              ],
            ),/*IndexedStack(
              index: MainController.to.currentTabIndex.value,
              children: [
                HomePageScreen(enneagramType: widget.enneagramType),
                PostsPageScreen(),
                SearchPageScreen(),
                EnneagramPageScreen(),
                ProfilePageScreen(enneagramType: widget.enneagramType),
              ],
            ),*/
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
