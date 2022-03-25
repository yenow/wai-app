import 'package:flutter/cupertino.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/ui/main_screen/home_screen/home_screen.dart';
import 'package:wai/ui/main_screen/notice_page/notice_page.dart';
import 'package:wai/ui/main_screen/search_page/search_page.dart';

import '../../../common/utils/logger.dart';
import '../my_page/my_page.dart';

class MainBody extends StatelessWidget {
  const MainBody({Key? key, required this.currentTabIndex}) : super(key: key);
  final int currentTabIndex;

  @override
  Widget build(BuildContext context) {

    switch(MainTap.values[currentTabIndex]) {
      case MainTap.home:
        return const HomePage();
      case MainTap.search:
        return const SearchPage();
      case MainTap.add:
        break;
      case MainTap.notice:
        return const NoticePage();
      case MainTap.profile:
        return const MyPage();
    }
    return Container();
  }
}
