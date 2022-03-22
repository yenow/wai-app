import 'package:flutter/material.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';

import '../components/wai_drawer.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: const WaiDrawer(),
        appBar: WaiAppbar(
          title: Text('알림', style: TextStyle(color: WaiColors.white)),
          backgroundColor: WaiColors.lightMainColor,
          elevation: 2,
        ),
        body: Container()
      ),
    );
  }
}
