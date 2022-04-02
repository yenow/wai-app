import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/controller/permernent/enneagram_controller.dart';
import 'package:wai/controller/permernent/enneagram_test_controller.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/controller/who_am_i_controller.dart';
import 'package:wai/main.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test_request_dto.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/simple_enneagram_test_screen/simple_enneagram_test_page_screen.dart';
import 'package:wai/ui/main_screen/main_screens.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/ui/who_am_i_screen/component/enneagram_type_grid_view.dart';
import 'package:wai/ui/who_am_i_screen/component/wai_icon_text.dart';
import 'package:wai/ui/who_am_i_screen/component/who_am_i_button.dart';


class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      SafeArea(
        child: Scaffold(
          appBar: const WaiAppbar(
            elevation: 0,
            isBackLeading: true,
            backgroundColor: WaiColors.deepDarkMainColor,
            title: Text("WHO AM I", style: TextStyle(color: WaiColors.white)),
          ),
          body: Column(
            children: [
              const Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: IconText(text: '내 에니어그램 성향이 뭔지 알고 있다면, 골라주세요.',),
              ),
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
                  backgroundColor: WaiColors.darkMainColor,
                  onPressed: WhoAmIController.to.selectEnneagramType,
                ),
              ),
              const Blank(height: 15,),
              const Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: IconText(text: '에니어그램을 처음 해보신다면, 테스트를 진행해주세요.',),
              ),
              Flexible(
                flex: 1,
                child: WhoAmIButton(
                  title: "간단 테스트",
                  backgroundColor: WaiColors.darkMainColor,
                  onPressed: () {
                    Get.toNamed(WaiRoutes.simpleTest);
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: WhoAmIButton(
                  title: "정밀 테스트 (20분 소요)",
                  backgroundColor: WaiColors.darkMainColor,
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
}
