import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/controller/enneagram_test_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/enneagram_question.dart';

import 'component/custom_radio_group_buton.dart';


class EnneagramTestPageScreen extends StatelessWidget {
  EnneagramTestPageScreen({Key? key}) : super(key: key);

  final _controller = PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(width:double.infinity, height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              '정밀테스트',
              style: CustomTextStyles.buildTextStyle(fontSize: 26),
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemCount: EnneagramTestController.to.enneagramPageList.value.length,
              controller: _controller,
              physics:const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int pageIndex) {
                Logger().d("pageIndex : $pageIndex");
                List questionIndexList = EnneagramTestController.to.enneagramPageList.value[pageIndex];

                return _buildPage(pageIndex, questionIndexList);
              }
            )
          )
        ]
      ),
    );
  }

  Widget _buildPage(int pageIndex, List questionIndexList) {

    /* 질문 리스트 */
    return ListView.builder(
        itemCount: EnneagramTestController.to.questionCount + 1,
        itemBuilder: (BuildContext context, int index) {

          // last
          if (index == EnneagramTestController.to.questionCount) {
            return Column(
              children: [
                _buildProgressBar(),
                _buildButtonArea(pageIndex),
              ],
            );
          }

          // questionIndexList[index] => question 번호
          return _buildQuestionList(questionIndexList, index);
    });
  }

  Column _buildProgressBar() {
    return Column(
      children: <Widget>[
        /*Text(
          '진행률',
          style: CustomTextStyles.buildTextStyle(),
        ),*/
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: 300,
          height: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: 0.4622,
              backgroundColor: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Obx _buildQuestionList(List<dynamic> questionIndexList, int index) {
    return Obx(() =>
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
      child: Text(
        EnneagramTestController.to.enneagramQuestionList.elementAt(questionIndex).question,
        style: GoogleFonts.jua(fontSize: 18, color: Colors.grey.shade800, fontWeight: FontWeight.w500),),
    );
  }

  Widget _buildButtonArea(int pageIndex) {
    const int initPageIndex = 0;
    int lastPageIndex = EnneagramTestController.to.enneagramPageList.length - 1;
    Logger().d("_buildButtonArea() pageIndex : $pageIndex");

    if (pageIndex == initPageIndex) {

      return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        width: double.infinity,
        child: _buildTestButton(
          buttonTitle: '다음',
          onPressed: () {
            _controller.nextPage(duration: _kDuration, curve: _kCurve);
          }
        ),
      );

    } else if (pageIndex == lastPageIndex) {

      return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        width: double.infinity,
        child: Row(
/*          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,*/

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
            SizedBox(width: 10,),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: _buildTestButton(
                  buttonTitle: '완료',
                  onPressed: () {
                    Logger().d(EnneagramTestController.to.enneagramQuestionList.value);

                    /* 유효성검사 */
                    if (!EnneagramTestController.to.checkEnneagramQuestionList()) {
                      Logger().d("checkEnneagramQuestionList() : false");
                      // alert

                    }

                    // Backend 요청 후
                    // 테스트결과 보여주기
                  }
              ),
            ),
          ],
        ),
      );

    } else {

      return Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        width: double.infinity,
        child: Row(
          children: [
            _buildTestButton(
                buttonTitle: '이전',
                onPressed: () {
                  _controller.previousPage(duration: _kDuration, curve: _kCurve);
                }
            ),
            _buildTestButton(
                buttonTitle: '다음',
                onPressed: () {
                  // 유효성검사

                  _controller.nextPage(duration: _kDuration, curve: _kCurve);
                }
            ),
          ],
        ),
      );
    }
  }

  ElevatedButton _buildTestButton({required String buttonTitle, required VoidCallback? onPressed}) {
    return ElevatedButton(
      child: Text(buttonTitle, style: CustomTextStyles.buildTextStyle(color: Colors.white)),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(double.infinity, 50)),
        backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              // side: BorderSide(color: Colors.red)
            )
        ),
      ),
      onPressed: onPressed,
    );
  }
}
