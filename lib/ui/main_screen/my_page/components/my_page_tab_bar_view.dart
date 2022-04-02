import 'package:flutter/material.dart';
import 'package:wai/ui/main_screen/my_page/enneagram_tab_page/enneagram_tab_page.dart';
import 'package:wai/ui/main_screen/my_page/my_post_tab_page/my_post_tab_page.dart';
import 'package:wai/ui/main_screen/my_page/my_reply_tab_page/my_reply_tab_page.dart';

class MyPageTabBarView extends StatelessWidget {
  const MyPageTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: EnneagramTabPage(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: MyPostTabPage(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: MyReplyTabPage(),
        ),
      ],
    );
  }
}
