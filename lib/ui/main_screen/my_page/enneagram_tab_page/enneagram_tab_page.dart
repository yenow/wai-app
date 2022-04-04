import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/main_screen/components/my_enneagram_container.dart';
import 'package:wai/ui/main_screen/my_page/enneagram_tab_page/components/enneagram_char_container.dart';
import 'package:wai/ui/main_screen/my_page/enneagram_tab_page/components/test_list_view.dart';

import '../../../../main.dart';

class EnneagramTabPage extends StatelessWidget {
  const EnneagramTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EnneagramTest enneagramTest = UserController.to.currentEnneagramTest.value;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: WaiColors.deepDarkGrey,
          ),
          child: Column(
            children: [
              const Blank(height: 10,),
              const Center(child: Text('나의 에니어그램', style: TextStyle(fontSize: 20, color: WaiColors.white),)),
              Center(child: Text( DateFormat('yyyy년 MM월 dd일').format(enneagramTest.insertDate!), style: TextStyle(fontSize: 14, color: WaiColors.white),)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 110,
                  child: MyEnneagramContainer(
                    myEnneagramTest: enneagramTest,
                    fontSize: 15,
                    textColor: WaiColors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: WaiButton(
                    size: Size.fromHeight(30 * heightRatio),
                    backgroundColor: WaiColors.darkMainColor,
                    textColor: WaiColors.white,
                    title: '더 알아보기',
                    onPressed: () {
                      Map map = {"enneagramType" : enneagramTest.myEnneagramType};
                      Get.toNamed(WaiRoutes.enneagramType, arguments: map);
                    }
                ),
              ),
              EnneagramChartContainer(enneagramTest: enneagramTest)
            ],
          ),
        ),
        // EnneagramChartContainer(enneagramTest: enneagramTest)
      ],
    );
  }
}
