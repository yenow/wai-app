import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/enneagram_test_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/common/controller/user_profile_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/models/enneagram_test/enneagram_test.dart';
import 'package:wai/models/enneagram_test/api/enneagram_test_request_dto.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/widgets/wai_dialog.dart';

import '../main_screens.dart';
import 'component/custom_radio_group_buton.dart';


class EnneagramTestPageScreen extends StatelessWidget {
  EnneagramTestPageScreen({Key? key}) : super(key: key);

  final _controller = PageController();
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const WaiAppbar(
          title: Text("정밀테스트"),
          isBackLeading: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: EnneagramTestController.to.enneagramPageList.length,
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int pageIndex) {
                  List questionIndexList = EnneagramTestController.to.enneagramPageList[pageIndex];
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

    return Column(
      children: [
        Flexible(
          flex: 11,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildNotification(pageIndex),
                _buildProgressBar(),
                const Blank(height: 5),
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

  Container _buildNotification(int pageIndex) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: WaiColors.lightBlueGrey,
      ),
      child: Column(
        children: [
          Text(
            notificationList[pageIndex % 9],
            style: WaiTextStyle(color: WaiColors.white).basic(),
          ),
          ElevatedButton(
              child: Text('임시버튼'),
              onPressed: () {
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
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: double.infinity,
          height: 5,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: EnneagramTestController.to.getProgressPercent(),
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation<Color>(WaiColors.lightBlueGrey),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionListView(List<dynamic> questionIndexList) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: EnneagramTestController.to.questionCount,
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: HorizontalBorderLine(),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          /* questionIndexList[index] => question 번호 */
          return _buildQuestionList(questionIndexList, index);
      }),
    );
  }

  Obx _buildQuestionList(List<dynamic> questionIndexList, int index) {
    return Obx(() =>
        Column(
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
    );
  }

  Padding _buildQuestion(int questionIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          EnneagramTestController.to.enneagramQuestionList.elementAt(questionIndex).getFullQuestion(),
          style: WaiTextStyle().enneagramQuestion(),
        ),
      ),
    );
  }

  Widget _buildButtonArea(int pageIndex, {required BuildContext context}) {
    const int initPageIndex = 0;
    int lastPageIndex = EnneagramTestController.to.enneagramPageList.length - 1;

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

                  if (!EnneagramTestController.to.checkEnneagramQuestionList()) {
                    AppController.to.snackbarKey.currentState!.showSnackBar(WaiSnackBar.basic(text: "선택하지 않은 문항이 있습니다."));
                  } else {
                    EnneagramTestRequestDto dto = EnneagramTestRequestDto(
                      userId: AppController.to.userId.value,
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
                    EnneagramTest myEnneagramTest = EnneagramTest.fromJson(json.decode(response));

                    AppController.to.writeIsBuildIntroducePage("N");
                    MainController.to.isShowEnneagramDialog.value = false;
                    UserController.to.addEnneagramTestResult(myEnneagramTest);
                    UserProfileController.to.setCurrentEnneagramTestResult(myEnneagramTest);
                    MainController.to.setTabIndex(0);
                    Get.offAll(MainScreens(myEnneagramTest: myEnneagramTest)
                    );
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
        fixedSize: MaterialStateProperty.all(const Size.fromHeight(50)),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0))
        )),
        backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
      ),
      onPressed: onPressed,
    );
  }
}

List<String> notificationList = [
  "가능한 보통이다는 피해주는게 좋아요!",
  "너무 깊게 생각하지말고 체크해주세요!",
  "솔직하게 체크해주세요!",
  "세상에 사람을 완벽하게 이해할 수 있는 도구는 없어요! 개인마다 모두 차이가 있어요!",
  "에니어그램은 내 단점을 통해 찾는게 더 쉬울수 있어요!",
  "에니어그램을 통해 내 단점을 마주할수 있어요. 하지만 자신의 단점을 마주하면서 너무 자책하지 않아도 되요. 고쳐나가면 되니까요!",
  "너무 질문이 많으신가요? 그래도 조금만 참아주세요! 더 정확한 결과를 위해서니까요.",
  "에니어그램을 통해 남을 평가할 필요는 없어요.",
  "에니어그램은 표지판이에요. 가는 길은 본인이 정해요!",
];