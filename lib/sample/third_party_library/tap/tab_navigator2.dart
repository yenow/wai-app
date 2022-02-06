// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/src/extension_instance.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:logger/logger.dart';
// import 'package:wai/common/constants/wai_colors.dart';
// import 'package:wai/common/constants/constants.dart';
// import 'package:wai/common/controller/main_controller.dart';
// import 'package:wai/common/theme/custom_textstyles.dart';
// import 'package:wai/screens/custom_appbar.dart';
// import 'package:wai/screens/home_page/home_page_screen.dart';
// import 'package:wai/screens/posts_page/posts_page_screen.dart';
// import 'package:wai/screens/profile_page/profile_page_screen.dart';
// import 'package:wai/screens/search_page/search_page_screen.dart';
// import 'package:wai/screens/enneagram_page/enneagram_page_screen.dart';
// import 'package:wai/common/theme/custom_textstyles.dart';
//
//
// class MainScreens2 extends StatelessWidget {
//   final MainController c = Get.put(MainController());
//
//   @override
//   Widget build(BuildContext context) {
//     Logger().d('currentIndex = ${c.currentIndex.value}');
//     Logger().d(c.currentIndex.value == 0);
//
//     return Obx(() =>
//         Scaffold(
//           appBar:PreferredSize(
//             preferredSize: Size.fromHeight(50),
//             child: CustomAppbar(
//               titleText: '게시글',
//               isBackgroundImage: false,
//               isLeading: true,
//             ),
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: c.currentIndex.value,
//             backgroundColor: Colors.white,
//             type: BottomNavigationBarType.fixed,
//             onTap: (nextPageIndex) {
//               c.changeMainPageIndex(nextPageIndex);
//               // navigator!.push(
//               //     MaterialPageRoute(builder: (context) {
//               //       return PostsPageScreen();
//               //     })
//               // );
//               build(context);
//             },
//             /* navigationBar item */
//             items: const [
//               BottomNavigationBarItem(
//                 label: '홈',
//                 icon: Icon(CupertinoIcons.home),
//               ),
//               BottomNavigationBarItem(
//                 label: '게시글',
//                 icon: Icon(CupertinoIcons.book),
//               ),
//               BottomNavigationBarItem(
//                 label: '글쓰기',
//                 icon: Icon(CupertinoIcons.add),
//               ),
//               BottomNavigationBarItem(
//                 label: '검색',
//                 icon: Icon(CupertinoIcons.search),
//               ),
//               BottomNavigationBarItem(
//                 label: '프로필',
//                 icon: Icon(CupertinoIcons.profile_circled),
//               )],
//           ),
//           body: IndexedStack(
//             index: c.currentIndex.value,
//             children: [
//               HomePageScreen(),
//               PostsPageScreen(),
//               WritePageScreen(),
//               SearchPageScreen(),
//               ProfilePageScreen(),
//             ],
//           ),
//         ),
//     );
//   }
// }
//
//
// class TabNavigatorRoutes {
//   static const String root = '/';
//   static const String detail = '/detail';
// }
//
// class TabNavigator extends StatelessWidget {
//   final GlobalKey<NavigatorState> navigatorKey;
//   final TabItem tabItem;
//
//
//   TabNavigator(this.navigatorKey, this.tabItem);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Navigator(
//       key: navigatorKey,
//       initialRoute: TabNavigatorRoutes.root,
//       onGenerateRoute: (RouteSettings) {
//         return MaterialPageRoute(builder: (BuildContext context) {
//
//         });
//       },
//
//     );
//   }
// }
