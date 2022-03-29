import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/route.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: WaiButton(
          backgroundColor: WaiColors.white,
          overlayColor: WaiColors.white,
          child: Row(
            children: const [
              Blank(width: 10,),
              Icon(Icons.search_outlined, size: 22, color: WaiColors.grey,),
              Blank(width: 10,),
              Text("검색할 내용을 입력해주세요.", style: TextStyle(fontSize: 16, color: Colors.grey))
            ],
          ),
          onPressed: () {
            Get.toNamed(WaiRoutes.search);
          }
      ),
    );
  }
}
