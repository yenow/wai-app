import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:uuid/uuid.dart';
import 'package:wai/constants/constants.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/controller/introduction_controller.dart';
import 'package:wai/main.dart';
import 'package:wai/data/model/introduction_message.dart';
import 'package:wai/data/model/user/user_request_dto.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:wai/ui/introduce_screen/component/introduction_button.dart';
import 'package:wai/ui/introduce_screen/component/introduction_circle_indicator.dart';
import 'package:wai/ui/introduce_screen/component/introduction_page_view.dart';
import 'package:wai/ui/who_am_i_screen/who_am_i_screen.dart';
import 'package:http/http.dart' as http;
import 'package:wai/common/utils/function.dart';



class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx(() =>
      SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Blank(height: 50),
              const IntroductionCircleIndicator(),
              const Expanded(child: IntroductionPageView()),
              IntroductionButton(pageIndex: IntroductionController.to.introductionPageIndex.value)
            ],
          ),
        ),
      ),
    );
  }
}
