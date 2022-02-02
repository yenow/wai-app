import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/enneagram_test_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/enneagram_test/enneagram_test.dart';
import 'package:wai/models/enneagram_test/api/enneagram_test_request_dto.dart';
import 'package:wai/models/enneagram_test/enneagram_question.dart';
import 'package:wai/utils/function.dart';
import 'package:wai/widgets/wai_dialog.dart';

import '../main_screens.dart';
import 'component/custom_radio_group_buton.dart';


class EnneagramTestPageScreen extends StatelessWidget {
  EnneagramTestPageScreen({Key? key}) : super(key: key);

  final _controller = PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),   // MainController.to.appBarState.value.appbarSize
          child: AppBar(
            title: Text("정밀테스트"),
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
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: EnneagramTestController.to.enneagramPageList.value.length,
                controller: _controller,
                physics:const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int pageIndex) {
                  // Logger().d("pageIndex : $pageIndex");
                  List questionIndexList = EnneagramTestController.to.enneagramPageList.value[pageIndex];

                  return _buildPage(pageIndex, questionIndexList, context: context);
                }
              )
            )
          ]
        ),
      ),
    );
  }

  Widget _buildPage(int pageIndex, List questionIndexList, {required BuildContext context}) {

    /* 질문 리스트 */
    return Column(
      children: [
        Flexible(
          flex: 11,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildNotification(),
                _buildProgressBar(),
                _buildQuestionListView(questionIndexList),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: _buildButtonArea(pageIndex, context: context)
        ),
      ],
    );
  }

  Container _buildNotification() {
    return Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 2.0,
                ),
              ]
          ),
          child: Column(
            children: [
              Text(
                "가능한 보통이다는 피해주는게 좋아요!",
                style: CustomTextStyles.buildTextStyle(),
              ),
              ElevatedButton(
                child: Text('임시버튼'),
                onPressed: () {
                  //
                  EnneagramTestController.to.randomInputScore();
                  _controller.jumpToPage(EnneagramTestController.to.enneagramPageList.length - 1);
                }
              )
            ],
          ),
        );
  }

  Column _buildProgressBar() {
    return Column(
      children: <Widget>[
        // Text(
        //   '진행률',
        //   style: CustomTextStyles.buildTextStyle(),
        // ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: double.infinity,
          height: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: EnneagramTestController.to.getProgressPercent(),
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
            ),
          ),
        ),
      ],
    );
  }

  ListView _buildQuestionListView(List<dynamic> questionIndexList) {
    return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: EnneagramTestController.to.questionCount,
          itemBuilder: (BuildContext context, int index) {
            /* questionIndexList[index] => question 번호 */
            return _buildQuestionList(questionIndexList, index);
        });
  }

  Obx _buildQuestionList(List<dynamic> questionIndexList, int index) {
    return Obx(() =>
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 2.0,
                ),
              ]
          ),
          child: Column(
            children: [
              _buildQuestion(questionIndexList[index]),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CustomRadioGroupButton(
                  groupValue: EnneagramTestController.to.enneagramQuestionList.value[questionIndexList[index]].score,
                  changeState: (int score) {
                    EnneagramTestController.to.setScore(questionIndex: questionIndexList[index], score: score);
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }

  Padding _buildQuestion(int questionIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          EnneagramTestController.to.enneagramQuestionList.elementAt(questionIndex).getFullQuestion(),
          style: GoogleFonts.jua(fontSize: 18, color: Colors.grey.shade800, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildButtonArea(int pageIndex, {required BuildContext context}) {
    const int initPageIndex = 0;
    int lastPageIndex = EnneagramTestController.to.enneagramPageList.length - 1;
    // Logger().d("_buildButtonArea() pageIndex : $pageIndex");

    if (pageIndex == initPageIndex) {

      return _buildOnlyNextButton(pageIndex, context: context);

    } else if (pageIndex == lastPageIndex) {

      return _buildPreviousAndCompleteButton(context: context);

    } else {

      return _buildPreviousAndNextButton(pageIndex, context: context);
    }
  }

  SizedBox _buildPreviousAndNextButton(int pageIndex,{required BuildContext context}) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: _buildTestButton(
                buttonTitle: '이전',
                onPressed: () {
                  _controller.previousPage(duration: _kDuration, curve: _kCurve);
                }
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: _buildTestButton(
                buttonTitle: '다음',
                onPressed: () {
                  if (EnneagramTestController.to.checkCurrentPageEnneagramQuestionList(pageIndex)) {
                    _controller.nextPage(duration: _kDuration, curve: _kCurve);
                  } else {
                    WaiDialog.showMessage(
                        context: context,
                        content: "선택하지 않은 문항이 있습니다."
                    );
                  }
                }
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildPreviousAndCompleteButton({required BuildContext context}) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: SizedBox(
              width: double.infinity,
              child: _buildTestButton(
                buttonTitle: '이전',
                onPressed: () {
                  _controller.previousPage(duration: _kDuration, curve: _kCurve);
                }
              ),
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: _buildTestButton(
                buttonTitle: '완료',
                onPressed: () async {

                  /* 유효성검사 */
                  if (!EnneagramTestController.to.checkEnneagramQuestionList()) {
                    WaiDialog.showMessage(
                        context: context,
                        content: "선택하지 않은 문항이 있습니다."
                    );
                  } else {
                    EnneagramTestRequestDto dto = EnneagramTestRequestDto(
                      userId: AppController.to.userId.value!,
                      testType: TestType.hard,
                      type1Score: EnneagramTestController.to.getScoreByEneagramType(1),
                      type2Score: EnneagramTestController.to.getScoreByEneagramType(2),
                      type3Score: EnneagramTestController.to.getScoreByEneagramType(3),
                      type4Score: EnneagramTestController.to.getScoreByEneagramType(4),
                      type5Score: EnneagramTestController.to.getScoreByEneagramType(5),
                      type6Score: EnneagramTestController.to.getScoreByEneagramType(6),
                      type7Score: EnneagramTestController.to.getScoreByEneagramType(7),
                      type8Score: EnneagramTestController.to.getScoreByEneagramType(8),
                      type9Score: EnneagramTestController.to.getScoreByEneagramType(9),
                    );

                    /* api request */
                    var response = await postRequest("/api/saveHardEnneagramTestResult", json.encode(dto.toJson()));
                    EnneagramTest enneagramTest = EnneagramTest.fromJson(json.decode(response));
                    Logger().d(enneagramTest);

                    AppController.to.writeIsBuildIntroducePage("N");
                    MainController.to.isShowEnneagramDialog.value = false;
                    Get.offAll(MainScreens(enneagramType : enneagramTest.myEnneagramType));
                  }
                }
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildOnlyNextButton(int pageIndex, {required BuildContext context}) {
    return SizedBox(
      width: double.infinity,
      child: _buildTestButton(
        buttonTitle: '다음',
        onPressed: () {
          if (EnneagramTestController.to.checkCurrentPageEnneagramQuestionList(pageIndex)) {
            _controller.nextPage(duration: _kDuration, curve: _kCurve);
          } else {
            WaiDialog.showMessage(
                context: context,
                content: "선택하지 않은 문항이 있습니다."
            );
          }
        }
      ),
    );
  }

  ElevatedButton _buildTestButton({required String buttonTitle, required VoidCallback? onPressed}) {
    return ElevatedButton(
      child: Text(buttonTitle, style: CustomTextStyles.buildTextStyle(color: Colors.white)),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size.fromHeight(50)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0))
        )),
        backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
      ),
      onPressed: onPressed,
    );
  }
}
