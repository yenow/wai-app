import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/ui/main_screen/search_page/components/search_button.dart';

import '../components/wai_drawer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          drawer: const WaiDrawer(),
          appBar: const WaiAppbar(
            title: Text('검색', style: TextStyle(color: WaiColors.white)),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(
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
                Expanded(
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: SearchButton(),
                      )
                    ],
                  )
                ),
                const Blank(height: 50,)
              ],
            ),
          ),
      ),
    );
  }
}
