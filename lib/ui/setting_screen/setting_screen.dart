import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/setting_screen/components/sign_out_action_button.dart';
import 'package:wai/ui/setting_screen/components/setting_list.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: WaiAppbar(
            title: const Text('설정', style: TextStyle(color: WaiColors.white),),
            borderColor: WaiColors.white,
            backgroundColor: WaiColors.mainColor,
            elevation: 0,
            leading: InkWell(
              child: const Icon(Icons.arrow_back_ios_outlined, size: 20, color: WaiColors.white),
              onTap: () {
                Get.back();
              },
            ),
            actions: const [
              /*SignOutActionButton()*/
            ],
          ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
            /*  SettingList(text: '이메일 등록'),
              HorizontalBorderLine(height: 0.5, color: WaiColors.mainColor,),*/
              SettingList(text: '이용약관', onTap: () { Get.toNamed(WaiRoutes.serviceAgreePage); }),
              const HorizontalBorderLine(height: 0.5, color: WaiColors.mainColor,),
              SettingList(text: '개인정보 처리방침', onTap: () { Get.toNamed(WaiRoutes.privateInformationAgreePage); }),
              const HorizontalBorderLine(height: 0.5, color: WaiColors.mainColor,),
            ],
          ),
        )
      )
    );
  }
}
