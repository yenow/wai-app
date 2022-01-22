import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/enneagram_test/enneagram_question.dart';

import 'component/custom_radio_group_buton.dart';

class SimpleEnneagramTestPageScreen extends StatelessWidget {
  const SimpleEnneagramTestPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      body: Center(
          child: MyStatefulWidget(),
      ),
    );*/

    return Scaffold(
      // body: MyStatefulWidget(),
      body: Column(
        children: [
          SizedBox(width:double.infinity, height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              '간단테스트',
              style: CustomTextStyles.buildTextStyle(fontSize: 26),
            ),
          ),
          _buildProgressBar(),
          Flexible(
              fit: FlexFit.loose,
              child: ListView.builder(
                  //itemBuilder: (BuildContext context, int index) => const SizedBox(height: 5,),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {

                    if (index == 9) {
                      return Container(
                        height: 100,
                        color: Colors.grey,
                      );
                    }

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
                              _buildQuestion(index),
                              CustomRadioGroupButton(groupValue: 0,),
                              Text(
                                AppController.to.count.value.toString(),
                                style: GoogleFonts.jua(fontSize: 2, color: Colors.black, fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                    );
              }),
          ),
        ],
      ),
    );
  }

  Padding _buildQuestion(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        dummyEnneagramQuestionList.elementAt(index).question,
        style: GoogleFonts.jua(fontSize: 18, color: Colors.grey.shade800, fontWeight: FontWeight.w500),),
    );
  }

  Column _buildProgressBar() {
    return Column(
          children: <Widget>[
            Text(
              '진행률',
              style: CustomTextStyles.buildTextStyle(),
            ),
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
}