import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:wai/constants/constants.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/permenent/enneagram_controller.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test_request_dto.dart';
import 'package:wai/data/model/enneagram/enneagram_question.dart';
import 'package:wai/ui/main_screen/main_screens.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/ui/simple_enneagram_test_screen/components/simple_enneagram_test_page_view.dart';

import '../hard_enneagram_test_screen/component/custom_radio_group_buton.dart';

class SimpleEnneagramTestScreen extends StatelessWidget {
  SimpleEnneagramTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: const WaiAppbar(
          title: Text("간단테스트"),
          isBackLeading: true,
        ),
        body: SimpleEnneagramTestPageView(),
      ),
    );
  }
}