import 'package:flutter/material.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';

import '../components/wai_drawer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          drawer: const WaiDrawer(),
          appBar: WaiAppbar(
            title: Text('검색', style: TextStyle(color: WaiColors.white)),
            backgroundColor: WaiColors.lightMainColor,
            elevation: 2,
          ),
          body: Container()
      ),
    );
  }
}
