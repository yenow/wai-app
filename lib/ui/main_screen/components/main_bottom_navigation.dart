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

    return Obx(() =>
      Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: WaiColors.white38, width: 0.5)
          )
        ),
        child: BottomNavigationBar(
          currentIndex: MainController.to.currentTabIndex.value,
          // backgroundColor: Colors.white, //AppController.to.appState.value.bottomNavigationBackgroundColor,
          backgroundColor: MainController.to.currentTabIndex.value == 0 ? Colors.transparent : Colors.white,
          unselectedItemColor: MainController.to.currentTabIndex.value == 0 ? WaiColors.white38 : Colors.grey,
          selectedItemColor: MainController.to.currentTabIndex.value == 0 ? WaiColors.white : WaiColors.mainColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: MainController.to.currentTabIndex.value == 0 ? 0 : 10,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: '홈',
              icon: Icon(Icons.home_rounded,),  // CupertinoIcons.home
            ),
            BottomNavigationBarItem(
              label: '검색',
              icon: Icon(Icons.search_rounded),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.add_circle_outline_outlined, size: 30),
            ),
            BottomNavigationBarItem(
              label: '알림',
              icon: Icon(Icons.notifications_rounded),    //  CupertinoIcons.book
            ),
            BottomNavigationBarItem(
                label: '마이페이지',
                icon: Icon(Icons.account_circle_rounded)
            )
          ],
          onTap: (nextTabIndex) {
            if (MainTap.values[nextTabIndex] == MainTap.add) {
              Get.bottomSheet(const MainBottomSheet());
            } else {
              MainController.to.setTabIndex(nextTabIndex);
            }
            // MainController.to.pageController.animateToPage(nextTabIndex, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
          },
        ),
      ),
    );
  }
}
