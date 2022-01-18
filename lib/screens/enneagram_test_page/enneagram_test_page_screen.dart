import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/controller/enneagram_test_controller.dart';
import 'package:wai/common/theme/custom_textStyles.dart';

import 'component/custom_radio_group_buton.dart';

class EnneagramTestPageScreen extends StatelessWidget {
  EnneagramTestPageScreen({Key? key}) : super(key: key);

  final _controller = PageController();

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
              itemBuilder: (BuildContext context, int index) {
                List questionIndexList = EnneagramTestController.to.enneagramPageList.value[index];

                return _buildPage(index, questionIndexList);
              }
            )
          )
        ]
      ),
    );
  }

  Widget _buildPage(int index, List questionIndexList) {

    /* 질문 리스트 */
    return ListView.builder(
        itemCount: EnneagramTestController.to.questionCount + 1,
        itemBuilder: (BuildContext context, int index) {

        if (index == EnneagramTestController.to.questionCount) {
          return Container(
            height: 100,
            color: Colors.grey,
          );
        }

        // questionIndexList[index] => question 번호

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
                  CustomRadioGroupButton(groupValue: 0,),
                ],
              ),
            ),
        );
    });
  }

  Padding _buildQuestion(int questionIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        EnneagramTestController.to.enneagramQuestionList.elementAt(questionIndex).question,
        style: GoogleFonts.jua(fontSize: 18, color: Colors.grey.shade800, fontWeight: FontWeight.w500),),
    );
  }
}
