import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:wai/common/components/image_container.dart';
import 'package:wai/common/theme/theme.dart';
import 'package:wai/screens/test_select_screen.dart';

class IntroductionSrceen extends StatelessWidget {

  final _items = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.pink,
  ];
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return /*Obx(() =>*/
      Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: SizedBox(height: 20)),
            Flexible(
              flex: 10,
              fit: FlexFit.loose,
              child: Container(
                height: 500,
                child: PageView.builder(
                    itemCount: _items.length,
                    controller: _pageController,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Flexible(
                            flex : 1,
                            child: Text("설명입니다.", style: textTheme().headline1,)
                          ),
                          // Text("hello wolrd", style: TextStyle(color: _items[index]),),
                          Flexible(
                            flex : 10,
                            fit : FlexFit.loose,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 30),
                                child: Image(image: AssetImage('assets/images/phone_image.png'),  height: double.infinity,  fit: BoxFit.fill,),
                              )
                            ),
                          )
                        ],
                      );
                    },
                    onPageChanged: (int index) {
                      _currentPageNotifier.value = index;
                    }),
              ),
            ),
            _buildCircleIndicator(),
            _buildButtonArea(),
          ],
        ),
      /*),*/
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

  Flexible _buildButtonArea() {
    return Flexible(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {

            },
          ),
          ElevatedButton(
            child: Text('건너뛰기'),
            style: ButtonStyle(),
            onPressed: () {
              Get.to(TestSelectScreen());
            }
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.arrowRight),
            onPressed: () {

            },
          )
        ],
      ),
    );
  }
}
