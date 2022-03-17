import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_markdown.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permenent/enneagram_controller.dart';
import 'package:wai/ui/enneagram_screen/components/enneagram_image_and_type.dart';
import 'package:wai/ui/enneagram_screen/components/enneagram_tab_button_container.dart';
import 'package:wai/ui/enneagram_screen/components/enneagram_type_container.dart';
import 'package:wai/ui/main_screen/components/my_enneagram_container.dart';

import '../../common/widgets/horizontal_border_line.dart';

class EnneagramTypeScreen extends StatelessWidget {
  const EnneagramTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int enneagramType = Get.arguments["enneagramType"];

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: WaiAppbar(
          title: Text(EnneagramController.to.enneagram[enneagramType]!.getFullName(), style: const TextStyle(color: WaiColors.white),),
          elevation: 0,
          backgroundColor: WaiColors.lightMainColor,
          leading: InkWell(
            child: const Icon(Icons.arrow_back_ios_outlined, size: 20, color: Colors.white),
            onTap: () {
              Get.back();
            },
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            // EnneagramTypeContainer(enneagramType: enneagramType),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: WaiMarkdown(
                url: 'assets/markdown/basic/type$enneagramType.md',
                // scrollPhysics: AlwaysScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
