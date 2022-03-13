import 'package:flutter/material.dart';
import 'package:wai/ui/main_screen/my_page/enneagram_tab_page/enneagram_tab_page.dart';

class MyPageTabBarView extends StatelessWidget {
  const MyPageTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Text('게시글'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Text('댓글'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: EnneagramTabPage(),
        ),
      ],
    );
  }
}
