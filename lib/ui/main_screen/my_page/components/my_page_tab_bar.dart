import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';

class MyPageTabBar extends StatelessWidget {
  const MyPageTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      labelColor: Colors.white,
      indicatorColor: Colors.white,
      tabs: [
        Tab(
          text: '나의 에니어그램',
          icon:  Icon(
            Icons.apps_rounded,
            size: 30,
            color: WaiColors.white,
          ),
        ),
        Tab(
          text: '나의 글',
          icon:  Icon(
            Icons.article_rounded,
            size: 30,
            color: WaiColors.white,
          ),
        ),
        // Tab(
        //   text: '나의 댓글',
        //   icon:  Icon(
        //     Icons.question_answer_rounded,
        //     size: 30,
        //     color: WaiColors.white,
        //   ),
        // )
      ],
    );
  }
}
