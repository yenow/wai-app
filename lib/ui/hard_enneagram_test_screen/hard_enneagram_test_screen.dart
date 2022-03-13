import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/permenent/enneagram_test_controller.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/data/model/enneagram_test.dart';
import 'package:wai/data/dto/enneagram_test_request_dto.dart';
import 'package:wai/common/utils/function.dart';
import 'package:wai/common/widgets/wai_dialog.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/hard_enneagram_test_screen/component/hard_enneagram_test_page_view.dart';

import '../main_screen/main_screens.dart';
import '../../screens/enneagram_test_page/component/custom_radio_group_buton.dart';

class HardEnneagramTestScreen extends StatelessWidget {
  const HardEnneagramTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return /*Obx(() =>*/
      SafeArea(
        child: Scaffold(
          appBar: const WaiAppbar(
            title: Text("정밀테스트"),
            isBackLeading: true,
          ),
          body: Column(
            children: const [
              Expanded(
                child: HardEnneagramTestPageView()
              )
            ]
          ),
        ),
      /*),*/
    );
  }
}