import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/search_controller.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/common/widgets/wai_text.dart';
import 'package:wai/screens/search_page/search_page.dart';

class SearchPageScreen extends StatefulWidget {
  const SearchPageScreen({Key? key}) : super(key: key);

  @override
  _SearchPageScreenState createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      Scaffold(
        appBar: const WaiAppbar(
          title: Text("검색"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Blank(height: 10,),
              _buildSearchButton(),
              const Blank(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text("최근 검색어", style: WaiTextStyle(fontSize: 16, color: Colors.grey).basic()),
                )
              ),
              _buildSearchList(),
              const Blank(height: 10,),
              const HorizontalBorderLine(height: 0.5)
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildSearchButton() {
    return SizedBox(
      height: 40,
      child: WaiButton(
        backgroundColor: Colors.grey.shade100,
        child: Row(
          children: [
            const Icon(Icons.search_outlined, size: 22, color: WaiColors.grey,),
            const Blank(width: 10,),
            WaiText(text: "검색할 내용을 입력해주세요.", style: WaiTextStyle(fontSize: 16, color: Colors.grey).basic())
          ],
        ),
        onPressed: () {
          Get.to(() => const SearchPage());
        }
      ),
    );
  }

  Flexible _buildSearchList() {
    return Flexible(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: SearchController.to.recentlySearchList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const HorizontalBorderLine(height: 0.5);
        },
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(SearchController.to.recentlySearchList.elementAt(index), style: WaiTextStyle().bodyText()),
                ),
                IconButton(
                  icon: const Icon(Icons.close_outlined, size: 18, color: Colors.black54),
                  onPressed: () {
                    SearchController.to.removerRecentlySearchList(SearchController.to.recentlySearchList.elementAt(index));
                  },
                )
              ],
            )
          );
        },
      ),
    );
  }

}
