import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/ui/main_screen/components/main_bottom_sheet.dart';

class MainBottomNavigation extends StatelessWidget {
  const MainBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      elevation: 8,
      notchMargin: 8,
      // color: WaiColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.home_rounded, size: 30, color: Colors.grey,),
              onPressed: () {
                MainController.to.setTabIndex(MainTap.home.index);
              },  // CupertinoIcons.home
            ),
            IconButton(
              icon: const Icon(Icons.search_rounded, size: 30, color: Colors.grey),
              onPressed: () {
                MainController.to.setTabIndex(MainTap.search.index);
              },  // CupertinoIcons.home
            ),
            const Blank(),
            IconButton(
              icon: const Icon(Icons.notifications_none_rounded, size: 30, color: Colors.grey),
              onPressed: () {
                MainController.to.setTabIndex(MainTap.notice.index);
              },  // CupertinoIcons.home
            ),
            IconButton(
              icon: const Icon(Icons.account_circle_rounded, size: 30, color: Colors.grey),
              onPressed: () {
                MainController.to.setTabIndex(MainTap.profile.index);
              },  // CupertinoIcons.home
            ),
          ],
        ),
      ),
    );

    // return BottomNavigationBar(
    //   currentIndex: MainController.to.currentTabIndex.value,
    //   // backgroundColor: Colors.white, //AppController.to.appState.value.bottomNavigationBackgroundColor,
    //   backgroundColor: Colors.white,
    //   unselectedItemColor: Colors.grey,
    //   selectedItemColor: Colors.blueGrey,
    //   showSelectedLabels: false,
    //   showUnselectedLabels: false,
    //   elevation: 10,
    //   type: BottomNavigationBarType.fixed,
    //   items: const [
    //     BottomNavigationBarItem(
    //       label: '홈',
    //       icon: Icon(Icons.home_rounded,),  // CupertinoIcons.home
    //     ),
    //     BottomNavigationBarItem(
    //       label: '게시글',
    //       icon: Icon(Icons.article_outlined),
    //     ),
    //     BottomNavigationBarItem(
    //       label: '',
    //       icon: Icon(Icons.add_circle_outline_outlined, size: 30, color: Colors.grey),
    //     ),
    //     BottomNavigationBarItem(
    //       label: '에니어그램',
    //       icon: Icon(CupertinoIcons.book),    //  CupertinoIcons.book
    //     ),
    //     BottomNavigationBarItem(
    //         label: '프로필',
    //         icon: Icon(Icons.account_circle_outlined)
    //     )
    //   ],
    //   onTap: (nextTabIndex) {
    //     if (MainTap.values[nextTabIndex] == MainTap.add) {
    //       Get.bottomSheet(const MainBottomSheet());
    //     } else {
    //       MainController.to.setTabIndex(nextTabIndex);
    //     }
    //     // MainController.to.pageController.animateToPage(nextTabIndex, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    //   },
    // );
  }
}
