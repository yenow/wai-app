import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/ui/service_agree_screen/component/sevice_agree_scroll_text.dart';

class PrivateInformationAgreePage extends StatelessWidget {
  const PrivateInformationAgreePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const WaiAppbar(
          elevation: 0,
          isBackLeading: true,
          backgroundColor: WaiColors.deepDarkMainColor,
          title: Text('개인정보 처리방침', style: TextStyle(color: WaiColors.white),),
        ),
        body: Column(
          children: [
            const Blank(height: 15,),
            Expanded(
              child: ServiceAgreeScrollText(
                controller: ScrollController(),
                markdownUrl: "assets/markdown/privateInformation.md",
              ),
            ),
            const Blank(height: 15,),
          ],
        ),
      ),
    );
  }
}
