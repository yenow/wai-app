import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/controller/enneagram_test_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/wai_markdown.dart';
import 'package:wai/models/enneagram/enneagram.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/block_text.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';

class EnneagramTypePageScreen extends StatelessWidget {
  const EnneagramTypePageScreen({Key? key, required this.enneagramType}) : super(key: key);
  final int enneagramType;

  @override
  Widget build(BuildContext context) {

    return Obx(() =>
        SafeArea(
          child: Scaffold(
            appBar: _buildAppbar(),
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

  PreferredSize _buildAppbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),   // MainController.to.appBarState.value.appbarSize
      child: AppBar(
        title: Text(EnneagramController.to.enneagram![enneagramType]!.getFullName(), style: CustomTextStyles.buildTextStyle(fontSize: 20, color: Colors.white),),
        /*elevation: 2.0,*/
        backgroundColor: lightBlueGrey,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios_outlined, size: 20, color: Colors.white),
          onTap: () {
            Get.back();
          },
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
          _buildTabButton(text: '관계', buttonIndex: 3, iconData: FontAwesomeIcons.handshake),
          _buildTabButton(text: '극복과제', buttonIndex: 4, iconData: Icons.fact_check_outlined),
          _buildTabButton(text: '기타', buttonIndex: 5, iconData: Icons.more_horiz_outlined),
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
          _buildTabPage1(context),
          _buildExplainWings(context),
          _buildMeritAndDemerit(context),
          _buildRelationShip(context),
          _buildHardWork(context),
          _buildEtc(context),
        ],
      ),
    );
  }

  Widget _buildTabPage1(BuildContext context) {
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
        RichText(
          text: TextSpan(
            text: "1번 유형들은 크든 작든 자신이 미칠수 있는 영향력을 사용하여 세상을 개선시키고자 하는 사명감을 갖고 있기 때문에"
                " 개혁가라는 이름을 붙였습니다. 이들은 역경을 극복하려고 노력합니다. 이들은 큰 희생을 치르고라도 높은 이상을 "
                "실현시키기 위해 노력합니다.", style: WaiTextStyle().bodyText2(),
          ),
        ),
      ],
    );
  }

  Widget _buildExplainWings(BuildContext context) {
    return const WaiMarkdown(url: "");
  }

  Widget _buildMeritAndDemerit(BuildContext context) {
    return const WaiMarkdown(url: "");
  }

  Widget _buildRelationShip(BuildContext context) {
    return const WaiMarkdown(url: "");
  }

  Widget _buildHardWork(BuildContext context) {
    return const WaiMarkdown(url: "");
  }

  Widget _buildEtc(BuildContext context) {
    return const WaiMarkdown(url: "");
  }
}
