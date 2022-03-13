import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/ui/main_screen/my_page/components/my_page_tab_bar.dart';

class MyPageProfileContainer extends StatelessWidget {
  const MyPageProfileContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
          color: WaiColors.profileBackground,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                WaiColors.deepLightBlueGrey,
                WaiColors.lightBlueGrey
              ]
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Blank(height: 50,),
          Column(
            children: [
              Center(
                child: Icon(
                  Icons.account_circle,
                  size: 70,
                  color: WaiColors.white,
                ),
              ),
              Blank(height: 5,),
              Text('닉네임', style: TextStyle(color: WaiColors.white),)
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(width: 0.5, color: WaiColors.white)
                )
            ),
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: MyPageTabBar(),
            ),
          )
        ],
      ),
    );
  }
}
