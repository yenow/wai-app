import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/main.dart';
import 'package:wai/widgets/custom_appbar.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background/snow_trees.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),   // MainController.to.appBarState.value.appbarSize
          child: CustomAppbar(
            titleText: "wai",
            backgroundColor: Colors.transparent,
            // backgroundImage: const Image(
            //   image: AssetImage("assets/images/background/trees-4741364_1920.png"),
            //   fit: BoxFit.fill,
            // ),
          ),
        ),
        body: SingleChildScrollView(
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Text(
                      "습관의 사슬은 너무 가벼워서 깨지기 전까지는 느껴지지 않는다",
                      style: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.blueGrey.shade400),),
                    Text(
                      "- 워런 버핏 -",
                      style: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.blueGrey.shade400), textAlign: TextAlign.right),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.4),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
