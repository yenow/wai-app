import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/permenent/enneagram_controller.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/controller/who_am_i_controller.dart';
import 'package:wai/main.dart';
import 'package:wai/data/model/enneagram_test.dart';
import 'package:wai/data/dto/enneagram_test_request_dto.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/simple_enneagram_test_screen/simple_enneagram_test_page_screen.dart';
import 'package:wai/ui/main_screen/main_screens.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/ui/who_am_i_screen/component/enneagram_type_grid_view.dart';
import 'package:wai/ui/who_am_i_screen/component/who_am_i_button.dart';


class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({Key? key}) : super(key: key);

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
              Flexible(
                flex: 5,
                fit: FlexFit.loose,
                child: EnneagramTypeGridView(
                  currentIndex: WhoAmIController.to.currentIndex.value,
                  changeCurrentIndex: WhoAmIController.to.changeCurrentIndex,
                )
              ),
              const Blank(height: 10,),
              Flexible(
                flex: 1,
                child: WhoAmIButton(
                  title: WhoAmIController.to.buttonText.value,
                  backgroundColor: WaiColors.deepDarkGrey,
                  onPressed: WhoAmIController.to.selectEnneagramType,
                ),
              ),
              const Blank(height: 15,),
              _buildText(text: '에니어그램을 처음 해보신다면, 테스트를 진행해주세요.'),
              Flexible(
                flex: 1,
                child: WhoAmIButton(
                  title: "간단 테스트",
                  backgroundColor: WaiColors.blueGrey,
                  onPressed: () {
                    Get.toNamed(WaiRoutes.simpleTest);
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: WhoAmIButton(
                  title: "정밀 테스트 (20분 소요)",
                  backgroundColor: WaiColors.blueGrey,
                  onPressed: () {
                    Get.toNamed(WaiRoutes.hardTest);
                  },
                ),
              ),
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
}
