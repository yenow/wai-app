import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/focus_out_container.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/ui/search_screen/components/search_action_button.dart';
import 'package:wai/ui/search_screen/components/search_form.dart';
import 'package:wai/ui/search_screen/components/search_tab_bar.dart';
import 'package:wai/ui/search_screen/components/search_tab_bar_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  // String searchText = "";
  // bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FocusOutContainer(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          appBar: const WaiAppbar(
              flexibleSpace: SearchForm(),
              backgroundColor: WaiColors.transparent,
              elevation: 0,
              isBackLeading: true,
              actions: [
                SearchActionButton()
              ]
          ),
          body: DefaultTabController(
            length: 3,
            child: Container(
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
                  Blank(height: 50),
                  SearchTabBar(),
                  Blank(height: 10,),
                  Expanded(
                    child: SearchTabBarView()
                  ),
                ],
              ),
            ),
          ),
          // body: _buildBody(),
        ),
      ),
    );
  }
}
