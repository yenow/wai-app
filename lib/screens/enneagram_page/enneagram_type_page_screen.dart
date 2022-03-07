import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/controller/app_controller.dart';
import 'package:wai/controller/enneagram_controller.dart';
import 'package:wai/controller/enneagram_test_controller.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_markdown.dart';
import 'package:wai/data/model/enneagram.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/block_text.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';

class EnneagramTypePageScreen extends StatelessWidget {
  const EnneagramTypePageScreen({Key? key, required this.enneagramType}) : super(key: key);
  final int enneagramType;

  @override
  Widget build(BuildContext context) {
    EnneagramController.to.enneagramTypePageIndex.value = 0;

    return Obx(() =>
        SafeArea(
          child: Scaffold(
            appBar: WaiAppbar(
              title: Text(EnneagramController.to.enneagram![enneagramType]!.getFullName(), style: CustomTextStyles.buildTextStyle(fontSize: 20, color: Colors.white),),
              elevation: 0,
              backgroundColor: WaiColors.lightBlueGrey,
              leading: InkWell(
                child: const Icon(Icons.arrow_back_ios_outlined, size: 20, color: Colors.white),
                onTap: () {
                  Get.back();
                },
              ),
            ),
            body: Column(
              children: [
                _buildTabButtonArea(),
                const HorizontalBorderLine(),
                Expanded(
                  child: SingleChildScrollView(
                    child: _buildContent(context)
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Padding _buildTabButtonArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabButton(text: '기본', buttonIndex: 0),
          _buildTabButton(text: '날개', buttonIndex: 1, iconData: Icons.air_outlined),
          _buildTabButton(text: '장단점', buttonIndex: 2, iconData: Icons.thumb_up_off_alt_outlined),
          // _buildTabButton(text: '관계', buttonIndex: 3, iconData: FontAwesomeIcons.handshake),
          // _buildTabButton(text: '극복과제', buttonIndex: 4, iconData: Icons.fact_check_outlined),
          _buildTabButton(text: '설명', buttonIndex: 3, iconData: Icons.more_horiz_outlined),
        ],
      ),
    );
  }

  Column _buildTabButton({required String text,
    required int buttonIndex,
    IconData iconData = Icons.menu,
    Color buttonColor = Colors.white,
    Color iconAndTextColor = WaiColors.lightBlueGrey
  }) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            EnneagramController.to.tabChange(buttonIndex);
          },
          child: Icon(iconData, color: iconAndTextColor),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (EnneagramController.to.enneagramTypePageIndex == buttonIndex) {
                return WaiColors.lightYellow;
              } else {
                return Colors.white;
              }

            }), // Button color
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.pressed)) return WaiColors.lightYellow; // Splash color
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text, style: WaiTextStyle(color: iconAndTextColor).basic()),
        )
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: IndexedStack(
        index: EnneagramController.to.enneagramTypePageIndex.value,
        children: [
          _buildBasic(context),
          _buildExplainWings(context),
          _buildMeritAndDemerit(context),
          // _buildRelationShip(context),
          // _buildHardWork(context),
          _buildEtc(context),
        ],
      ),
    );
  }

  Widget _buildBasic(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey.shade100,
            boxShadow: const [
              BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Text(EnneagramController.to.enneagram![enneagramType]!.getFullName() + "란?", style: CustomTextStyles.headline1()),
              const Blank(height: 10,),
              Align(
                alignment: Alignment.center,
                child: BlockText(text: EnneagramController.to.enneagram![enneagramType]!.simpleExplain)
              ),
              const Blank(height: 10,),
              Image(
                image: AssetImage(EnneagramController.to.enneagram![enneagramType]!.imagePath), width: 120, height: 120,  fit: BoxFit.fill,
              ),
              const Blank(height: 10,),
              Text(EnneagramController.to.enneagram![enneagramType]!.simpleExplain2, style: WaiTextStyle(fontSize: 18).bodyText(),)
              //_buildSubTitle(),
            ],
          )
        ),
        const SizedBox(height: 10,),
        WaiMarkdown(url: "assets/markdown/basic/type$enneagramType.md")
      ],
    );
  }

  Widget _buildExplainWings(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey.shade100,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 2.0,
                ),
              ],
              /*image: DecorationImage(
              image: new AssetImage("assets/images/enneagram/enneagram_icon.png"),
              fit: BoxFit.cover,
              //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
            )*/
            ),
            child: Column(
              children: [
                Text("날개유형이란?", style: CustomTextStyles.headline1()),
                Text("자신의 유형 양 옆쪽에 있는 성격 유형을 말합니다. 날개는 자신의 성격유형을 좀 더 자세하고 정확하게 이해하는데"
                    " 도움이 될 뿐 아니라 기본적인 성향인 자신유형의 부족을 보완 해줄 수 있는 성향을 가지고 있습니다.", style: CustomTextStyles.bodytext1(),)
                //_buildSubTitle(),
              ],
            )
        ),
        WaiMarkdown(url: "assets/markdown/wings/type$enneagramType.md"),
      ],
    );
  }

  Widget _buildMeritAndDemerit(BuildContext context) {
    return WaiMarkdown(url: "assets/markdown/meritAndDemerit/type$enneagramType.md");
  }

  // Widget _buildRelationShip(BuildContext context) {
  //   return const WaiMarkdown(url: "");
  // }
  //
  // Widget _buildHardWork(BuildContext context) {
  //   return const WaiMarkdown(url: "");
  // }

  Widget _buildEtc(BuildContext context) {
    return WaiMarkdown(url: "assets/markdown/etc/type$enneagramType.md");
  }
}
