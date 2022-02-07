import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/blank.dart';
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
    return Scaffold(
      appBar: const WaiAppbar(
        title: Text("검색"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Blank(height: 10,),
            _buildSearchButton(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("최근 검색어", style: WaiTextStyle(fontSize: 16, color: Colors.grey).basic())
              )
            )
          ],
        ),
      ),
    );
  }

  SizedBox _buildSearchButton() {
    return SizedBox(
      height: 50,
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
}
