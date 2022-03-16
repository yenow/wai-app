import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/ui/main_screen/components/wai_drawer.dart';
import 'package:wai/ui/main_screen/my_page/components/my_page_profile_container.dart';
import 'package:wai/ui/main_screen/my_page/components/my_page_tab_bar.dart';
import 'package:wai/ui/main_screen/my_page/components/my_page_tab_bar_view.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: WaiAppbar(
          title: Text('마이페이지', style: GoogleFonts.jua(color: WaiColors.white)),
          actions: const [
            MyPageActionButton()
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        drawer: const WaiDrawer(),

        body: Column(
          children: [
            MyPageProfileContainer(),
            const Expanded(
                child: MyPageTabBarView()
            ),
          ],
        )
      ),
    );
  }
}

class MyPageActionButton extends StatelessWidget {
  const MyPageActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: IconButton(
        icon: const Icon(
          Icons.edit_rounded,
        ),
        onPressed: () {
          logger.d('edit profile');
        },
      ),
    );
  }
}
