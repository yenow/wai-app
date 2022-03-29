import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_button.dart';
import 'package:wai/common/widgets/wai_markdown.dart';
import 'package:wai/common/widgets/wai_text.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/service_agree_controller.dart';
import 'package:wai/ui/service_agree_screen/component/service_agree_check.dart';
import 'package:wai/ui/service_agree_screen/component/sevice_agree_scroll_text.dart';

class ServiceAgreeScreen extends StatelessWidget {
  const ServiceAgreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
      SafeArea(
        child: Scaffold(
          appBar: const WaiAppbar(
            title: Text("서비스 동의"),
          ),
          body: Column(
            children: [
              // Container(
              //   padding: const EdgeInsets.symmetric(vertical: 20),
              //   child: Text('이용약관', style: WaiTextStyle(fontSize: 20, color: WaiColors.lightBlueGrey).basic(), textAlign: TextAlign.center,),
              // ),
              const Blank(height: 30),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: ServiceAgreeScrollText(
                  controller: ServiceAgreeController.to.firstController,
                  markdownUrl: "assets/markdown/serviceAgree.md",
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: ServiceAgreeCheck(
                  agreeText: "이용 약관에 동의하시겠습니까?",
                  value: ServiceAgreeController.to.isServiceAgree.value,
                  onChanged: ServiceAgreeController.to.changeIsServiceAgree,
                ),
              ),
              // Container(
              //   padding: const EdgeInsets.symmetric(vertical: 20),
              //   child: Text('개인정보처리', style: WaiTextStyle(fontSize: 20, color: WaiColors.lightBlueGrey).basic(), textAlign: TextAlign.center,),
              // ),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: ServiceAgreeScrollText(
                  controller: ServiceAgreeController.to.firstController,
                  markdownUrl: "assets/markdown/privateInformation.md",
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: ServiceAgreeCheck(
                  agreeText: "개인정보처리에 동의하시겠습니까?",
                  value: ServiceAgreeController.to.isPrivateInformationAgree.value,
                  onChanged: ServiceAgreeController.to.changeIsPrivateInformationAgree,
                ),
              ),
              const Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Blank(),
              ),
              Flexible(
                flex: 1,
                child: WaiButton(
                  title: '다음',
                  onPressed: ServiceAgreeController.to.goToNextPage,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
