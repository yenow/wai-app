import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/controller/enneagram_test_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/common/controller/user_profile_controller.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/main.dart';
import 'package:wai/models/enneagram_test/enneagram_test.dart';
import 'package:wai/models/enneagram_test/api/enneagram_test_request_dto.dart';
import 'package:wai/screens/enneagram_test_page/simple_enneagram_test_page_screen.dart';
import 'package:wai/screens/main_screens.dart';
import 'package:wai/common/utils/function.dart';

import '../enneagram_test_page/enneagram_test_page_screen.dart';

class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({Key? key}) : super(key: key);

  _selectEnneagramType() async {
    int selectedEnneagramType = EnneagramTestController.to.selectedEnneagramType.value;

    if (selectedEnneagramType != 0) {
      EnneagramTestRequestDto enneagramTest = EnneagramTestRequestDto(
        userId: AppController.to.userId.value,
        testType: TestType.select,
        myEnneagramType: EnneagramTestController.to.selectedEnneagramType.value,
      );

      /* api request */
      var response = await postRequest("/api/saveSelectedEnneagramTestResult", json.encode(enneagramTest.toJson()));
      EnneagramTest myEnneagramTest = EnneagramTest.fromJson(json.decode(response));

      AppController.to.writeIsBuildIntroducePage("N");
      UserController.to.addEnneagramTestResult(myEnneagramTest);
      UserProfileController.to.setCurrentEnneagramTestResult(myEnneagramTest);
      MainController.to.setTabIndex(0);
      Get.offAll(() => MainScreens(myEnneagramTest: myEnneagramTest));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      SafeArea(
        child: Scaffold(
          appBar: const WaiAppbar(
            title: Text("WHO AM I"),
          ),
          body: Column(
            children: [
              _buildText(text: '내 에니어그램 성향이 뭔지 알고 있다면, 골라주세요'),
              _buildEnneagramTypeGridView(context),
              const Blank(height: 10,),
              _buildSelectEnneagramTypeButton(),
              const Blank(height: 15,),
              _buildText(text: '에니어그램을 처음 해보신다면, 테스트를 진행해주세요.'),
              _buildSimpleTestButton(),
              _buildHardTestButton(),
              const SizedBox(width:double.infinity, height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  Flexible _buildText({required String text}) {
    return Flexible(
        flex: 1,
        child: Center(
          child: Text(
          text,
          style: WaiTextStyle(fontSize: 17, color: WaiColors.darkGrey).basic(),
        )
      )
    );
  }

  Flexible _buildEnneagramTypeGridView(BuildContext context) {
    return Flexible(
      flex: 8,
      fit: FlexFit.loose,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: const EdgeInsets.all(5),
          children: List.generate(9, (index) {
            int enneagramType = index + 1;

            return _buildEnneagramType(enneagramType);
          }),
        ),
      ),
    );
  }

  Widget _buildEnneagramType(int enneagramType) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: enneagramType == EnneagramTestController.to.selectedEnneagramType.value ? WaiColors.lightYellow : Colors.white,
        boxShadow: const [
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
            const SizedBox(height: 5,),
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

  Flexible _buildSimpleTestButton() {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 3),
        child: WaiButton(
          title: "간단테스트",
          onPressed: () {
            Get.to(() => SimpleEnneagramTestPageScreen());
          }
        )
      ),
    );
  }

  Flexible _buildHardTestButton() {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 3),
        child: WaiButton(
          title: "정밀테스트 (20분 소요)",
          onPressed: () {
            Get.to(() => EnneagramTestPageScreen());
          }
        )
      ),
    );
  }

  Flexible _buildSelectEnneagramTypeButton() {
    return Flexible(
      flex: 1,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 3),
          child: WaiButton(
            title: EnneagramTestController.to.nextButtonText.value,
            backgroundColor: WaiColors.lightYellow,
            textColor: WaiColors.blueGrey,
            onPressed: _selectEnneagramType
          )
      ),
    );
  }
}
