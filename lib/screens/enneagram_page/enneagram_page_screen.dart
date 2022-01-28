import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/constants/custom_colors.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/theme/custom_postpage_textstyle.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/enneagram/enneagram.dart';
import 'package:wai/widgets/custom_appbar.dart';

import '../../main.dart';
import 'enneagram_type_page_screen.dart';

class EnneagramPageScreen extends StatelessWidget {
  const EnneagramPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),   // MainController.to.appBarState.value.appbarSize
        child: AppBar(
          title: Text("에니어그램"),
          elevation: 2.0,
          backgroundColor: Colors.white,
        ),
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
                      Text("에니어그램이란?",
                          style: CustomTextStyles.buildTextStyle(fontSize: 25, color: Colors.white)),
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
              image: AssetImage("assets/images/background/pink-1311251_1920.jpg"),
              fit: BoxFit.fill,
            ),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [
                0.1,
                0.5,
                0.9,
              ],
              colors: [
                babyBlueShade100,
                babyBlueShade60,
                babyBlueShade30,
              ]
            ),
          ),
        );
  }

  Widget _buildEnneagramType(BuildContext context, int enneagramType) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: TextButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(EnneagramController.to.enneagram![enneagramType]!.imagePath), width: 50 * widthRatio, height: 50 * heightRatio,  fit: BoxFit.fill,),
            SizedBox(height: 5,),
            Text(
              '$enneagramType유형',
              style: GoogleFonts.jua(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey ),
            ),
            SizedBox(height: 3),
            Text(
              EnneagramController.to.enneagram![enneagramType]!.subName,
              style: GoogleFonts.jua(fontSize: 11, fontWeight: FontWeight.w400, color: Colors.grey),
            ),
          ],
        ),
        onPressed: () {
          MainController.to.goIntoPage();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
              EnneagramTypePageScreen(enneagramType: enneagramType,)
            )
          );
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
        childAspectRatio: 0.85,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(5),
        children: List.generate(9, (index) {
          int enneagramType = index + 1;

          return _buildEnneagramType(context, enneagramType);
        }),
      ),
    );
  }
}
