import 'package:flutter/material.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test.dart';
import 'package:wai/ui/main_screen/components/my_enneagram_container.dart';
import 'package:wai/ui/main_screen/my_page/enneagram_tab_page/components/enneagram_char_container.dart';
import 'package:wai/ui/main_screen/my_page/enneagram_tab_page/components/test_list_view.dart';

class EnneagramTabPage extends StatelessWidget {
  const EnneagramTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EnneagramTest enneagramTest = UserController.to.currentEnneagramTest.value;

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Center(child: Text('나의 에니어그램', style: TextStyle(fontSize: 20, color: WaiColors.black80),)),
        TestListView(),
        HorizontalBorderLine(),
        // Padding(
        //   padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
        //   child: MyEnneagramContainer(
        //     myEnneagramTest: enneagramTest,
        //     fontSize: 15,
        //     textColor: WaiColors.black50,
        //   ),
        // ),
        SizedBox(
          height: 120,
          child: MyEnneagramContainer(
            myEnneagramTest: enneagramTest,
            fontSize: 15,
            textColor: WaiColors.black50,
          ),
        ),
        EnneagramChartContainer(enneagramTest: enneagramTest)
      ],
    );
  }
}
