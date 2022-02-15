import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/theme/custom_postpage_textstyle.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/models/enneagram/enneagram.dart';
import 'package:wai/common/widgets/custom_appbar.dart';

import '../../main.dart';
import 'enneagram_type_page_screen.dart';

class EnneagramPageScreen extends StatelessWidget {
  const EnneagramPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WaiAppbar(
        title: Text("에니어그램"),
      ),
      body: _buildbody(size, context)
    );
  }


  SingleChildScrollView _buildbody(Size size, BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          _buildTopBackground(size),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    children: [
                      const Blank(height: 5,),
                      Text("에니어그램이란?",
                          style: CustomTextStyles.buildTextStyle(fontSize: 22, color: Colors.white)),
                      const Blank(height: 5,),
                      Text("애니어그램은 9가지 유형으로 이루어진 성격 테스트입니다. 어떤 유형들이 있는지 알아보아요.",
                          style: CustomTextStyles.buildTextStyle(fontSize: 18, color: Colors.white )),
                    ],
                  ),
                ),
                _buildEnneagramTypeGridView(context),
              ],
            ),
          )
        ]
      ),
    );
  }

  Container _buildTopBackground(Size size) {
    return Container(
          height: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/images/background/mesh.png"), // pink-1311251_1920.jpg
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
              fit: BoxFit.fill,
            ),
          ),
        );
  }

  Widget _buildEnneagramType(BuildContext context, int enneagramType) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      child: TextButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(EnneagramController.to.enneagram![enneagramType]!.imagePath), width: 50 * widthRatio, height: 50 * heightRatio,  fit: BoxFit.fill,),
            const SizedBox(height: 3,),
            Text(
              '$enneagramType유형',
              style: WaiTextStyle(fontSize: 16, fontWeight: FontWeight.w500).bodyText(),
            ),
            // const SizedBox(height: 3),
            Text(
              EnneagramController.to.enneagram![enneagramType]!.subName,
              style: WaiTextStyle(fontSize: 13).bodyText(),
            ),
          ],
        ),
        onPressed: () {
          Get.to(() => EnneagramTypePageScreen(enneagramType: enneagramType));
        },
      ),
    );
  }

  Widget _buildEnneagramTypeGridView(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 0.9,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(5),
        children: List.generate(9, (index) {
          int enneagramType = index + 1;
          return _buildEnneagramType(context, enneagramType);
        }),
      ),
    );
  }
}
