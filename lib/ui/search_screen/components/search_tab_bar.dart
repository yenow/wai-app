import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';

class SearchTabBar extends StatelessWidget {
  const SearchTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorColor: WaiColors.white,
      tabs: <Widget>[
        SizedBox(
            height: 40,
            child: Center(child: Text('태그', style: TextStyle(color: WaiColors.white)))
        ),
        SizedBox(
            height: 40,
            child: Center(child: Text('제목', style: TextStyle(color: WaiColors.white)))
        ),
        SizedBox(
            height: 40,
            child: Center(child: Text('작성자', style: TextStyle(color: WaiColors.white)))
        ),
      ],
    );
  }
}
