import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';

import '../../../controller/service_agree_controller.dart';
import '../../service_agree_screen/component/sevice_agree_scroll_text.dart';

class ServiceAgreePage extends StatelessWidget {
  const ServiceAgreePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const WaiAppbar(
            elevation: 0,
            isBackLeading: true,
            backgroundColor: WaiColors.mainColor,
            title: Text('이용약관', style: TextStyle(color: WaiColors.white),),
          ),
        body: Column(
          children: [
            const Blank(height: 15,),
            Expanded(
              child: ServiceAgreeScrollText(
                controller: ScrollController(),
                markdownUrl: "assets/markdown/serviceAgree.md",
              ),
            ),
            const Blank(height: 15,),
          ],
        ),
      ),
    );
  }
}
