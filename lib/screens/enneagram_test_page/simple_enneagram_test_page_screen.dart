import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/controller/enneagram_test_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/enneagram_test/api/enneagram_test.dart';
import 'package:wai/models/enneagram_test/api/enneagram_test_request_dto.dart';
import 'package:wai/models/enneagram_test/enneagram_question.dart';
import 'package:wai/screens/main_screens.dart';
import 'package:wai/utils/function.dart';
import 'package:wai/widgets/black.dart';
import 'package:wai/widgets/wai_dialog.dart';

import 'component/custom_radio_group_buton.dart';

class SimpleEnneagramTestPageScreen extends StatelessWidget {
  SimpleEnneagramTestPageScreen({Key? key}) : super(key: key);

  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),   // MainController.to.appBarState.value.appbarSize
          child: AppBar(
            title: Text("간단테스트"),
            elevation: 2.0,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              child: Icon(Icons.arrow_back_ios_outlined, size: 20, color: Colors.blueGrey,),
              onTap: () {
                Get.back();
              },
            ),
          ),
        ),
        body: PageView.builder(
          itemCount: 2,
          controller: _pageController,
          physics:const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {

            return _buildPage(context,index);
          },
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          }),
      ),
    );
  }

  Widget _buildPage(BuildContext context, int index) {
    int pageIndex = index+1;

    return Obx(() =>
      Column(
        children: [
          Flexible(
            flex: 11,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildNotification(),
                  _buildSimleQuestionList(pageIndex),
                ],
              ),
            ),
          ),
          _buildButton(context, pageIndex)
        ],
      ),
    );
  }

  ListView _buildSimleQuestionList(int pageIndex) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: EnneagramTestController.to.getSimpleQuestionsByPageIndex(pageIndex).length,
        // separatorBuilder: (BuildContext context, int questionIndex) => Blank(height: 10),
        itemBuilder: (BuildContext context, int questionIndex) {
          List<EnneagramQuestion> list = EnneagramTestController.to.getSimpleQuestionsByPageIndex(pageIndex);
          String uniqueString = list[questionIndex].uniqueString!;

          return _buildSimpeEnneagramQuestion(uniqueString, pageIndex, questionIndex, list);
        }
      );
  }

  Container _buildNotification() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      height: 50,
      child: Center(child: Text("세가지 질문중 나에게 가장 가까운 질문 하나를 선택해주세요.", style: CustomTextStyles.buildTextStyle())),
    );
  }

  Widget _buildSimpeEnneagramQuestion(String uniqueString, int pageIndex, int questionIndex, List<EnneagramQuestion> list) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          print(uniqueString);
          EnneagramTestController.to.setSimpleTestSelectMap(pageIndex: pageIndex, uniqueString: uniqueString);
        },
        child: Text(
            list[questionIndex].getFullSimpleQuestion(),
            style: CustomTextStyles.buildTextStyle(color: Colors.black54)
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10))
          )),
          padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (EnneagramTestController.to.selectSimpleTestMap[pageIndex] == uniqueString) {
              return Colors.blueGrey.shade300;
            } else {
              return Colors.white;
            }

          }), // Button color
          overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.pressed)) return Colors.blueGrey.shade100; // Splash color
          }),
        ),
      ),
    );
  }


  Widget _buildButton(BuildContext context, int pageIndex) {
    if (pageIndex == 1) {

      return Flexible(
        flex: 1,
        child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  child: Text(EnneagramTestController.to.selectSimpleTestMap[pageIndex]!),
                  visible: false,
                ),
                Text("선택", style: CustomTextStyles.buildTextStyle(color: Colors.white)),
              ],
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size.infinite),
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            ),
            onPressed: () {
              _pageController.nextPage(duration: _kDuration, curve: _kCurve);
            }
        ),
      );
    } else {

      return Flexible(
        flex: 1,
        child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  child: Text(EnneagramTestController.to.selectSimpleTestMap[pageIndex]!),
                  visible: false,
                ),
                Text("완료", style: CustomTextStyles.buildTextStyle(color: Colors.white)),
              ],
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size.infinite),
              backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            ),
            onPressed: () async {

              /* 1. 유효성 검사 */
              if (EnneagramTestController.to.checkSimpleEnneagramTestValue()) {

                /* api request*/
                EnneagramTestRequestDto dto = EnneagramTestRequestDto(
                  userId: AppController.to.userId.value!,
                  testType: TestType.simple,
                  uniqueString: EnneagramTestController.to.makeUniqueString(),
                );

                var response = await postRequest("/api/saveSimpleEnneagramTestResult", json.encode(dto.toJson()));
                EnneagramTest enneagramTest = EnneagramTest.fromJson(json.decode(response));
                Logger().d(enneagramTest);

                Get.to(MainScreens());

                // show Dialog enneagramType
              } else {

                WaiDialog.showMessage(
                  context: context,
                  content: "문항을 선택해주세요.",
                );
              }

              // 2.
            }
        ),
      );
    }
  }
}