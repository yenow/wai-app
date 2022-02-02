import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/controller/enneagram_test_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/main.dart';
import 'package:wai/models/enneagram_test/enneagram_test.dart';
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

    return Obx(() =>
      SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),   // MainController.to.appBarState.value.appbarSize
            child: AppBar(
              title: Text("WHO AM I"),
              elevation: 2.0,
              backgroundColor: Colors.white,
            ),
          ),
          body: Column(
            children: [
              _buildText(text: '내 에니어그램 성향이 뭔지 알고 있다면, 골라주세요'),
              _buildEnneagramTypeGridView(context),
              _buildNextButton(),
              _buildText(text: '에니어그램을 처음 해보신다면, 테스트를 진행해주세요.'),
              _buildSimpleTestButton(),
              _buildHardTestButton(),
              // _buildText(text: '기존 아이디가 있으시다면, 로그인 해주세요.'),
              // _buildHardTestButton(),
              SizedBox(width:double.infinity, height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  Flexible _buildText({required String text, double fontSize = 15  }) {
    return Flexible(flex: 1, child: Center(
        child: Text(
            text,
            style: _buildTextStyle(fontSize: fontSize),
          )
      )
    );
  }

  Flexible _buildEnneagramTypeGridView(BuildContext context) {
    return Flexible(
          flex: 7,
          // fit: FlexFit.loose,
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/9),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: EdgeInsets.all(5),
                children: List.generate(9, (index) {
                  int enneagramType = index + 1;

                  return _buildEnneagramType(enneagramType);
                }),
              ),
            ),
          ),
        );
  }

  Widget _buildEnneagramType(int enneagramType) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: enneagramType == EnneagramTestController.to.selectedEnneagramType.value ? Colors.blueGrey.shade200 : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 1.0,
          ),
        ],
      ),
      child: TextButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(EnneagramController.to.enneagram![enneagramType]!.imagePath), width: 40 * widthRatio, height: 40 * heightRatio,  fit: BoxFit.fill,),
            SizedBox(height: 5,),
            Text(
              '$enneagramType유형',
              style: GoogleFonts.jua(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.blueGrey ),
            ),
          ],
        ),
        onPressed: () {

          EnneagramTestController.to.selectEnneagramType(enneagramType: enneagramType);
          /*Get.defaultDialog(
            title: "알림",
            middleText: "$enneagramType유형으로 진행하시겠습니까?",
            radius: 20,
            barrierDismissible: false,
            // content: Text("content"),
            cancel: _buildCancelButton(),
            confirm: _buildConfirmButton(enneagramType : enneagramType),
            titleStyle: CustomTextStyles.buildTextStyle(fontSize: 20),
            middleTextStyle: CustomTextStyles.buildTextStyle(fontSize: 15),
          );*/
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

  Flexible _buildSimpleTestButton() {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 3),
        child: _buildButton(title: "간단테스트", onPressed: () {
          // /* DB 조회 */
          // getRequest("/api/getSimpleEnneagramQuestion");
          //
          // EnneagramTestController.to.setEnneagramQuestion(dummyEnneagramQuestionList);
          // /*print(EnneagramTestController.to.enneagramQuestionList.value);
          //       print(EnneagramTestController.to.enneagramPageList.value);*/

          Get.to(() => SimpleEnneagramTestPageScreen());
        })
      ),
    );
  }

  Flexible _buildHardTestButton() {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 3),
        child: _buildButton(
          title: "정밀테스트 (20분 소요)",
          onPressed: () {
            Get.to(() => EnneagramTestPageScreen());
          })
      ),
    );
  }

  Flexible _buildNextButton() {
    return Flexible(
      flex: 1,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 3),
          child: _buildButton(
            title: EnneagramTestController.to.nextButtonText.value,
            color: Colors.blueGrey,
            onPressed: () async {
              int selectedEnneagramType = EnneagramTestController.to.selectedEnneagramType.value;

              if (selectedEnneagramType != 0) {
                EnneagramTestRequestDto enneagramTest = EnneagramTestRequestDto(
                  userId: AppController.to.userId.value!,
                  testType: TestType.select,
                  myEnneagramType: EnneagramTestController.to.selectedEnneagramType.value,
                );

                // api request
                var response = await postRequest("/api/saveSelectEnneagramTestResult", json.encode(enneagramTest.toJson()));
                EnneagramTest responseEnneagramTest = EnneagramTest.fromJson(json.decode(response));

                AppController.to.writeIsBuildIntroducePage("N");
                Get.offAll(() => MainScreens(enneagramType: responseEnneagramTest.myEnneagramType));
              }
          })
      ),
    );
  }

  Widget _buildButton({required String title,required void Function() onPressed,
    Color color = Colors.blueGrey, Color textColor = Colors.white}) {
    return ElevatedButton(
      child: Text(title, style: _buildTextStyle(color: textColor)),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size.infinite),
        backgroundColor: MaterialStateProperty.all(color),
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
