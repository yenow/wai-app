import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:uuid/uuid.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/main.dart';
import 'package:wai/models/introduction_message.dart';
import 'package:wai/models/user/user.dart';
import 'package:wai/screens/introduce_page/who_am_i_screen.dart';
import 'package:http/http.dart' as http;
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/widgets/wai_dialog.dart';

import 'nickname_input_page.dart';

class IntroductionScreen extends StatelessWidget {
  IntroductionScreen({Key? key}) : super(key: key);
  
  final _items = [
    IntroductionMessage(
        titleText: "환영합니다!",
        subText : "에니어그램은 사람을 9가지 성격으로 분류하는 성격유형 이론입니다.",
        imageUrl: "assets/images/background/welcome-back.png"),
    IntroductionMessage(
        titleText: "나는 어떤 사람?",
        subText : "에니어그램 테스트를 통해 내가 어떤 유형의 사람인지 알아보아요.",
        imageUrl: "assets/images/background/test.png"),
    IntroductionMessage(
        titleText: "나와 비슷한 사람이 있을까?",
        subText : "게시글에서 나와 비슷한 사람끼리 이야기를 나눠보아요",
        imageUrl: "assets/images/background/social-network.png"),
  ];

  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  void _onPressStartButton() async {

    logger.d(AppController.to.userId.value);
    logger.d(AppController.to.userKey.value);
    if (AppController.to.userId.value == "" && AppController.to.userKey.value == "") {
      User user = User();

      /* create userKey */
      String userKey = const Uuid().v1();
      /* store security */
      AppController.to.writeUserKey(userKey);

      /* save DB */
      var responseBody = await postRequest("/api/saveUserKey",userKey);
      int userId = json.decode(responseBody);

      /* save userId */
      user.userId = userId;
      await AppController.to.writeUserId(userId.toString());

      UserController.to.user.value.userId = userId;
      UserController.to.user.value.userKey = userKey;
    }

    Get.off(() => const NicknameInputPage());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Blank(height: 10),
            _buildCircleIndicator(),
            Expanded(
              child: PageView.builder(
                  itemCount: _items.length,
                  controller: _pageController,
                  itemBuilder: (BuildContext context, int index) {

                    return _buildPage(index);
                  },
                  onPageChanged: (int index) {
                    _currentPageNotifier.value = index;
                  }),
            ),
            _buildButton(context),
          ],
        ),
      ),
    );
  }

  Column _buildPage(index) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Center(child: Text(_items.elementAt(index).titleText, style: WaiTextStyle(fontSize: 30, color: Colors.black54).basic(),))
        ),
        SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: AutoSizeText(
                _items[index].subText,
                maxLines: 4,
                style: WaiTextStyle(fontSize: 20, color: Colors.black54).basic(),
              ),
            )
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(80, 0, 80, 80),
            child: Image(image: AssetImage(_items[index].imageUrl),  height: double.infinity,  fit: BoxFit.contain,),
          ),
        )
      ],
    );
  }

  Widget _buildCircleIndicator() {
    return SizedBox(
      height: 40,
      child: Center(
        child: CirclePageIndicator(
          itemCount: _items.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        child: Text('시작하기', style: WaiTextStyle(fontSize: 18, color: Colors.white).basic()),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size.infinite),
          backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
        ),
        onPressed: _onPressStartButton,
      ),
    );
  }
}
