import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';

import '../components/wai_drawer.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const WaiDrawer(),
      appBar: const WaiAppbar(
        title: Text('알림', style: TextStyle(color: WaiColors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background/moon.jpg"),
            opacity: 0.8,
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(WaiColors.black70.withOpacity(0.6), BlendMode.color),
          ),
        ),
        child: Column(
          children: [
            const Blank(height: 50,),
            Expanded(
                child: SizedBox(
                    width: double.infinity,
                    child: Text('알림', style: TextStyle(color: WaiColors.white70),)
                )
            ),
            Blank(height: 50,)
          ],
        ),
      ),
    );
  }
}
