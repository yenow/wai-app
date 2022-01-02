import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/constants/custom_colors.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/theme/custom_textStyles.dart';
import 'package:wai/screens/home_page/home_page_screen.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
import 'package:wai/screens/profile_page/profile_page_screen.dart';
import 'package:wai/screens/search_page/search_page_screen.dart';
import 'package:wai/screens/write_page/write_page_screen.dart';
import 'package:wai/common/theme/custom_textStyles.dart';

class MainScreens extends StatelessWidget {
  final MainController c = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    Logger().d('currentIndex = ${c.mainPageCurrentIndex.value}');
    Logger().d(c.mainPageCurrentIndex.value == 0);

    return Obx(() =>
      Scaffold(
        appBar: _appbar(context),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: c.mainPageCurrentIndex.value,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (nextPageIndex) {
            c.changeMainPageIndex(nextPageIndex);
            build(context);
          },
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
            )],
        ),
        body: IndexedStack(
          index: c.mainPageCurrentIndex.value,
          children: [
            HomePageScreen(),
            PostPageScreen(),
            WritePageScreen(),
            SearchPageScreen(),
            ProfilePageScreen(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appbarNoBackgroundImage(BuildContext context) {

    return PreferredSize(
      preferredSize: Size.fromHeight(50),
      child: AppBar(
        title : const Text(
          'WAI',
        ),
        backgroundColor: Colors.white,
        elevation: 2.0,
        leading: IconButton(
          icon: const Icon(
            FontAwesomeIcons.alignJustify,
            color: appBarTitleTextColor,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          onPressed: () {
            print(1);
          },
        ),
        bottom: const PreferredSize(
            child: Divider(thickness: 0.5, height: 0.5, color: Colors.grey),
            preferredSize: Size.fromHeight(0.5)
        ),
      ),
    );
  }

  PreferredSizeWidget _appbarBackgroundImage(BuildContext context) {

    return PreferredSize(
      preferredSize: Size.fromHeight(260),
      child: AppBar(
        title : const Text(
          'WAI',
        ),
        flexibleSpace: Image(
          image: new AssetImage("assets/images/background/trees-4741364_1920.png"),
          fit: BoxFit.fill,
        ),
        elevation: 3.0,
        leading: IconButton(
          icon: const Icon(
            FontAwesomeIcons.alignJustify,
            color: appBarTitleTextColor,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
          onPressed: () {
            print(1);
          },
        ),
        bottom: PreferredSize(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('texttexttexttexttexttexttexttext',
                  style: CustomTextStyles(Theme.of(context).textTheme).appbarText),
            ),
            preferredSize: Size.fromHeight(100)
        ),
      ),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) {

    if (c.mainPageCurrentIndex.value == 0) {
      return _appbarBackgroundImage(context);
    } else {
      return _appbarNoBackgroundImage(context);
    }
  }
}
