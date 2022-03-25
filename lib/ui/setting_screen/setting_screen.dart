import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/ui/setting_screen/components/setting_list.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: WaiAppbar(
            title: const Text('설정', style: TextStyle(color: WaiColors.white70),),
            borderColor: WaiColors.white70,
            backgroundColor: WaiColors.lightMainColor,
            elevation: 0,
            leading: InkWell(
              child: const Icon(Icons.arrow_back_ios_outlined, size: 20, color: WaiColors.white70),
              onTap: () {
                Get.back();
              },
            ),
          ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              SettingList(text: '이메일 등록')
            ],
          ),
        )
      )
    );
  }
}
