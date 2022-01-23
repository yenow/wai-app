import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/enneagram_test_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/main.dart';
import 'package:wai/models/enneagram_test/enneagram_question.dart';
import 'package:wai/models/enneagram_test/api/enneagram_test_request_dto.dart';
import 'package:wai/models/enneagram/enneagram.dart';
import 'package:wai/screens/enneagram_test_page/simple_enneagram_test_page_screen.dart';
import 'package:wai/screens/main_screens.dart';
import 'package:wai/utils/function.dart';

import 'enneagram_test_page/enneagram_test_page_screen.dart';

class WhoAmIScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     // double padding = MediaQuery.of(context).size.width/10;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(width:double.infinity, height: 30,),
          Flexible(
              flex: 1,
              child: Center(
                  child: Text(
                    'WHO AM I ',
                    style: _buildTextStyle(fontSize: 26),
                  )
              )
          ),
          Flexible(
            flex: 1,
            child: Center(
                child: Text(
                  '내 에니어그램 성향이 뭔지 알고 있다면, 골라주세요',
                  style: _buildTextStyle(),
                )
            )
          ),
          _buildEnneagramTypeGridView(context),
          Flexible(
            flex: 1,
            child: Center(
              child: Text('에니어그램을 처음 해보신다면, 테스트를 진행해주세요.', style: _buildTextStyle(),)
            )
          ),
          _buildSimpleTestButton(),
          _buildTestButton(),
          SizedBox(width:double.infinity, height: 30,),
        ],
      ),
    );
  }

  Flexible _buildTestButton() {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 3),
        child: ElevatedButton(
          child: Text('정밀테스트', style: _buildTextStyle(color: Colors.white)),
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(Size.infinite),
            backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  // side: BorderSide(color: Colors.red)
                )
            ),
          ),
          onPressed: () {

            EnneagramTestController.to.setEnneagramQuestion(dummyEnneagramQuestionList);

            Get.to(EnneagramTestPageScreen());
          },
        ),
      ),
    );
  }
  
  Flexible _buildSimpleTestButton() {
    return Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 3),
            child: ElevatedButton(
              child: Text('간단테스트', style: _buildTextStyle(color: Colors.white)),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size.infinite),
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      // side: BorderSide(color: Colors.red)
                    )
                ),
              ),
              onPressed: () {
                /* DB 조회 */
                EnneagramTestController.to.setEnneagramQuestion(dummyEnneagramQuestionList);
                /*print(EnneagramTestController.to.enneagramQuestionList.value);
                print(EnneagramTestController.to.enneagramPageList.value);*/

                Get.to(SimpleEnneagramTestPageScreen());
              },
            ),
          ),    
        );
  }

  Flexible _buildEnneagramTypeGridView(BuildContext context) {
    return Flexible(
          flex: 6,
          // fit: FlexFit.loose,
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/9),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  padding: EdgeInsets.all(0),
                  children: List.generate(9, (index) {
                    int enneagramType = index + 1;

                    return _buildEnneagramType(enneagramType);
                  }),
                ),
              ),
            ),
          ),
        );
  }

  Center _buildEnneagramType(int enneagramType) {
    return Center(
      child: TextButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(enneagramTypeList[enneagramType]!.path), width: 50 * widthRatio, height: 50 * heightRatio,  fit: BoxFit.fill,),
            SizedBox(height: 5,),
            Text(
              '$enneagramType유형',
              style: GoogleFonts.jua(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.blueGrey ),
            ),
          ],
        ),
        onPressed: () {
          
          Get.defaultDialog(
            title: "알림",
            middleText: "$enneagramType유형으로 진행하시겠습니까?",
            radius: 20,
            barrierDismissible: false,
            // content: Text("content"),
            cancel: _buildCancelButton(),
            confirm: _buildConfirmButton(enneagramType : enneagramType),
            titleStyle: CustomTextStyles.buildTextStyle(fontSize: 20),
            middleTextStyle: CustomTextStyles.buildTextStyle(fontSize: 15),
          );
        },
      ),
    );
  }

  TextStyle _buildTextStyle({double fontSize = 15, color = Colors.blueGrey}) {
    return GoogleFonts.jua(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: color
    );
  }

  Widget _buildConfirmButton({required int enneagramType}) {
    return ElevatedButton(
      child: Text("확인", style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.white),),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
      ),
      onPressed: () async {

        // create RequestDto
        EnneagramTestRequestDto enneagramTest = EnneagramTestRequestDto(
          userId: int.parse(AppController.to.userId.value!),
          testType: TestType.select,
          selectedEnneagramType: enneagramType,
        );

        // api request
        var response = await postRequest("/api/enneagramTest", json.encode(enneagramTest.toJson()));
        Logger().d(json.decode(response));
        Map responseMap = json.decode(response);

        if (responseMap["success"] == true) {
          Get.to(MainScreens());
        } else {
          Get.back();
        }
      },
    );
  }

  Widget _buildCancelButton() {
    return ElevatedButton(
      child: Text("취소", style: CustomTextStyles.buildTextStyle(fontSize: 15, color: Colors.white),),
      onPressed: () {
        Get.back();
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
      ),
    );
  }
}
