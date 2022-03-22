import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/common/widgets/image_container.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/constants/wai_textstyle.dart';
import 'package:wai/controller/permernent/user_controller.dart';
import 'package:wai/ui/main_screen/components/wai_drawer.dart';
import 'package:wai/ui/main_screen/home_screen/components/home_tab_bar.dart';
import 'package:wai/ui/main_screen/home_screen/components/home_tab_bar_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: WaiAppbar(
          title: Text('WAI', style: GoogleFonts.jua(color: WaiColors.white)),
          backgroundColor: Colors.transparent,
          // backgroundColor: WaiColors.lightMainColor,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        drawer: const WaiDrawer(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          // color: WaiColors.white,
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
              const HorizontalBorderLine(color: WaiColors.white70),
              HomeTabBar(enneagramType: UserController.to.currentEnneagramTest.value.myEnneagramType!),
              const Blank(height: 10,),
              const Expanded(
                  child: HomeTabBarView()
              ),
              const Blank(height: 60,),
              // buildPadding("assets/images/background/snow_trees.png"),
              // buildPadding("assets/images/background/mesh.png"),
              // buildPadding("assets/images/background/rain.jpg"),
            ],
          ),
        ),
      ),
    );
  }
}
