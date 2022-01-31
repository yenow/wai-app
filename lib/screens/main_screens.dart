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
import 'package:wai/utils/enneagram_dialog.dart';
import 'package:wai/widgets/wai_dialog.dart';
import '../main.dart';
import 'enneagram_page/enneagram_page_screen.dart';
import 'enneagram_page/enneagram_type_page_screen.dart';

class MainScreens extends StatelessWidget {
  MainScreens({Key? key, this.enneagramType}) : super(key: key);
  int? enneagramType;

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    widthRatio = (deviceWidth / standardDeviceWidth);
    heightRatio = (deviceHeight / standardDeviceHeight);
    Logger().d("==== build MainScreens ====");

    return _buildBody(context);
  }

  Obx _buildBody(BuildContext context) {
    return Obx(() =>
    WillPopScope(
      onWillPop: MainController.to.onWillPop,   // 뒤로가기시 이벤트
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: MainController.to.appState.value.backgroundColor,
          resizeToAvoidBottomInset : false,
          backgroundColor:  Colors.transparent,
          bottomNavigationBar: _buildBottomNavigationBar(),
          body: IndexedStack(
            index: MainController.to.currentTabIndex.value,
            children: [
              _buildOffstageNavigator(context,0),
              _buildOffstageNavigator(context,1),
              _buildOffstageNavigator(context,2),
              _buildOffstageNavigator(context,3),
              /*HomePageScreen(),
              PostsPageScreen(),
              WritePageScreen(),
              SearchPageScreen(),
              ProfilePageScreen(),*/
            ],
          ),
        ),
      ),
    ),
  );
  }

  BottomNavigationBar? _buildBottomNavigationBar() {

    // Logger().d(MainController.to.pageDeptCount.value);
    if (MainController.to.pageDeptCount.value > 0) {
      return null;
    }

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
          },
        );
  }

  Widget _routeBuilders(BuildContext context, int index) {
      return [
        HomePageScreen(enneagramType: enneagramType),
        PostsPageScreen(),
        EnneagramPageScreen(),
        ProfilePageScreen(enneagramType: enneagramType),
      ].elementAt(index);
  }

  Widget _buildOffstageNavigator(BuildContext context, int index) {

    /* Offstage로 위젯을 안보이는 상태로 */
    return Offstage(
      offstage: MainController.to.currentTabIndex != index,
      child: Navigator(
          key: MainController.to.navigatorKeys[MainController.to.pageKeys.elementAt(index)],
          onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) {
                return _routeBuilders(context, index);
              }
              // builder: (context) => routeBuilders[routeSettings.name](context),
          );
        },
      ),
    );
  }
}
