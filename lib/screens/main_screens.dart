import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/screens/home_page/home_page_screen.dart';
import 'package:wai/screens/posts_page/posts_page_screen.dart';
import 'package:wai/screens/profile_page/profile_page_screen.dart';
import 'package:wai/screens/search_page/search_page_screen.dart';
import 'package:wai/screens/write_page/write_page_screen.dart';
import '../widgets/custom_appbar.dart';

class MainScreens extends GetView<MainController> {
  MainScreens({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    /*Logger().d('currentIndex = ${MainController.to.currentIndex.value}');
    Logger().d(MainController.to.currentIndex.value == 0);
    Logger().d(MainController.to.navigatorKey);
    Logger().d(MainController.to.navigatorKeys);
    Logger().d(MainController.to.appBarState.value.isPopPage);*/

    return Obx(() =>
      WillPopScope(
        onWillPop: MainController.to.onWillPop,   // 뒤로가기시 이벤트
        child: Scaffold(
          appBar: _buildAppbar(),
          bottomNavigationBar: _buildBottomNavigationBar(),
          body: IndexedStack(
            index: MainController.to.currentTabIndex.value,
            children: [
              _buildOffstageNavigator(context,0),
              _buildOffstageNavigator(context,1),
              _buildOffstageNavigator(context,2),
              _buildOffstageNavigator(context,3),
              _buildOffstageNavigator(context,4),
              /*HomePageScreen(),
              PostsPageScreen(),
              WritePageScreen(),
              SearchPageScreen(),
              ProfilePageScreen(),*/
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize? _buildAppbar() {
    if (MainController.to.appBarState.value.isPopPage) {
      return null;
    }

    return PreferredSize(
          preferredSize: Size.fromHeight(MainController.to.appBarState.value.appbarSize),   // MainController.to.appBarState.value.appbarSize
          child: CustomAppbar(
            isBackgroundImage: MainController.to.appBarState.value.isBackgroundImage,
            isPopPage: MainController.to.appBarState.value.isPopPage,
            isLeading: false,
            backgroundImage: Image(
              image: new AssetImage("assets/images/background/trees-4741364_1920.png"),
              fit: BoxFit.fill,
            ),
          ),
        );
  }

  BottomNavigationBar? _buildBottomNavigationBar() {

    if (MainController.to.appBarState.value.isPopPage) {
      return null;
    }

    return BottomNavigationBar(
          currentIndex: MainController.to.currentTabIndex.value,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blueGrey,
          type: BottomNavigationBarType.fixed,
          /* navigationBar item */
          items: const [
            BottomNavigationBarItem(
              label: '홈',
              icon: Icon(CupertinoIcons.home),
            ),
            BottomNavigationBarItem(
              label: '게시글',
              icon: Icon(CupertinoIcons.book),
            ),
            BottomNavigationBarItem(
              label: '글쓰기',
              icon: Icon(CupertinoIcons.add),
            ),
            BottomNavigationBarItem(
              label: '검색',
              icon: Icon(CupertinoIcons.search),
            ),
            BottomNavigationBarItem(
              label: '프로필',
              icon: Icon(CupertinoIcons.profile_circled),
            )
          ],
          onTap: (nextTabIndex) {

            if (nextTabIndex == 0) {
              MainController.to.changeAppbar(
                isBackgroundImage: true, height : 260
              );
            } else {
              MainController.to.changeAppbar(
                isBackgroundImage: false,
                height : 50
              );
            }
            MainController.to.setTabIndex(nextTabIndex);
            // navigator!.push(
            //     MaterialPageRoute(builder: (context) {
            //       return PostsPageScreen();
            //     })
            // );
          },
        );
  }

  // Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
  //   return {
  //     '/': (context) {
  //       return [
  //         HomePage(),
  //         CalendarPage(),
  //         ProfilePage(),
  //       ].elementAt(index);
  //     },
  //   };
  // }

  Widget _routeBuilders(BuildContext context, int index) {
      return [
        HomePageScreen(),
        PostsPageScreen(),
        WritePageScreen(),
        SearchPageScreen(),
        ProfilePageScreen(),
      ].elementAt(index);
  }

  Widget _buildOffstageNavigator(BuildContext context, int index) {
    var routeBuilders = _routeBuilders(context, index);

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

  PreferredSizeWidget _appbar(BuildContext context) {

    if (MainController.to.currentTabIndex.value == 0) {

      return PreferredSize(
        preferredSize: Size.fromHeight(260),
        child: CustomAppbar(
          isBackgroundImage: true,
          backgroundImage: Image(
            image: new AssetImage("assets/images/background/trees-4741364_1920.png"),
            fit: BoxFit.fill,
          ),
          isLeading: true,
        ),
      );

    } else if (MainController.to.currentTabIndex.value == 1) {

      return PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppbar(
          titleText: '게시글',
          isBackgroundImage: false,
          isLeading: true,
        ),
      );

    } else if (MainController.to.currentTabIndex.value == 2) {

      return PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppbar(
          titleText: '글쓰기',
          isBackgroundImage: false,
          isLeading: true,
        ),
      );
    } else {

      return PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppbar(
          titleText: '글쓰기',
          isBackgroundImage: false,
          isLeading: true,
        ),
      );
    }
  }
}
