import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:wai/common/components/image_container.dart';
import 'package:wai/common/theme/theme.dart';
import 'package:wai/main.dart';
import 'package:wai/models/introduction_message.dart';
import 'package:wai/screens/who_am_i_screen.dart';

class IntroductionSrceen extends StatelessWidget {

  final _items = [
    IntroductionMessage(titleText: "환영합니다!", subText : "에니어그램은 사람을 9가지 성격으로 분류하는 성격유형 이론입니다.", imageUrl: ""),
    IntroductionMessage(titleText: "1", subText : "1", imageUrl: ""),
    IntroductionMessage(titleText: "2", subText : "2", imageUrl: ""),
    IntroductionMessage(titleText: "3", subText : "3", imageUrl: ""),
  ];

  final _items2 = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey
  ];
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return /*Obx(() =>*/
      Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20),
            _buildCircleIndicator(),
            Flexible(
              flex: 11,
              fit: FlexFit.loose,
              child: Container(
                height: 500,
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
            ),
            /*_buildCircleIndicator(),*/
            _buildButton(),
          ],
        ),
      /*),*/
    );
  }

  Column _buildPage(index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex : 1,
          child: Text(_items.elementAt(index).titleText, style: _buildTextStyle(fontSize: 25),)
        ),
        Flexible(
            flex : 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceWidth/12),
              child: Text(_items[index].subText, style: _buildTextStyle(fontSize: 20),),
            )
        ),
        Flexible(
          flex : 8,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image(image: AssetImage('assets/images/phone_image.png'),  height: double.infinity,  fit: BoxFit.fill,),
            )
          ),
        )
      ],
    );
  }

  Flexible _buildCircleIndicator() {
    return Flexible(
      flex: 1,
      child: CirclePageIndicator(
        itemCount: _items.length,
        currentPageNotifier: _currentPageNotifier,
      ),
    );
  }

  Flexible _buildButton() {
    return Flexible(
      flex: 1,
      child: ElevatedButton(
        child: Text('시작하기', style: _buildTextStyle(color: Colors.white)),
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size.infinite),
          backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
        ),
        onPressed: () {
          Get.off(WhoAmIScreen());
        },
      )
    );
  }

  TextStyle _buildTextStyle({double fontSize = 15, color = Colors.blueGrey}) {
    return GoogleFonts.jua(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color
    );
  }
}
