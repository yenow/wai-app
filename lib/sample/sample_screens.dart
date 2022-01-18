import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/theme/theme.dart';
import 'package:wai/sample/page/sample_button_page.dart';
import 'package:wai/screens/custom_appbar.dart';
import 'package:wai/screens/enneagram_test_page/component/custom_radio_button.dart';
import 'package:wai/screens/enneagram_test_page/component/custom_radio_group_buton.dart';

class SampleScreens extends StatelessWidget {
  const SampleScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx(() =>  Scaffold(
        body: Container(
          child: Center(
            child: ListView(
              children: [
                TextButton(
                  child: Text('버튼', style: textTheme().bodyText1,),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)
                  ),
                  onPressed: () {
                    Get.to(SampleButtonPage());
                  }
                ),
                TextButton(
                    child: Text(MainController.to.currentIndex.value.toString()),
                    onPressed: () {}
                ),
                CustomRadioGroupButton(groupValue: 0,),
                Row(
                  children: [
                    CustomRadioButton(
                      uniqueValue: 1,
                      groupValue: 1,
                      onPressed: () {

                      },
                    ),
                    CustomRadioButton(
                      uniqueValue: 2,
                      groupValue: 1,
                      onPressed: () {

                      },
                    )
                  ],
                ),
              ],
            )
          ),
        )
    ));
  }
}
