import 'package:flutter/material.dart';
import 'package:wai/constants/wai_colors.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({Key? key, required this.enneagramType}) : super(key: key);
  final int enneagramType;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: WaiColors.white70,
      tabs: <Widget>[
        SizedBox(
            height: 40,
            child: Center(child: Text('전체글', style: TextStyle(fontSize: 15, color: WaiColors.white70)))
        ),
        SizedBox(
            height: 40,
            child: Center(child: Text('인기글', style: TextStyle(fontSize: 15, color: WaiColors.white70)))
        ),
        SizedBox(
            height: 40,
            child: Center(child: Text('$enneagramType유형', style: TextStyle(fontSize: 15, color: WaiColors.white70)))
        ),
      ],
    );
  }
}
