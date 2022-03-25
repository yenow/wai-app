import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/utils/wai_dialog.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/main_screen/components/wai_drawer.dart';
import 'package:wai/ui/main_screen/my_page/components/my_page_profile_container.dart';
import 'package:wai/ui/main_screen/my_page/components/my_page_tab_bar.dart';
import 'package:wai/ui/main_screen/my_page/components/my_page_tab_bar_view.dart';

import '../../post_write_screen/post_write_screen.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: const WaiDrawer(),
        appBar: WaiAppbar(
          title: Text('마이페이지', style: GoogleFonts.jua(color: WaiColors.white)),
          actions: const [
            MyPageActionButton()
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/images/background/moon.jpg"),
              opacity: 0.8,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(WaiColors.black70.withOpacity(0.6), BlendMode.color),
            ),
          ),
          child: Column(
            children: const [
              MyPageProfileContainer(),
              Expanded(
                  child: MyPageTabBarView()
              ),
              Blank(height: 50,)
            ],
          ),
        )
      ),
    );
  }
}

