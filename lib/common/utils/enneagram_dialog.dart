import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/enneagram/enneagram_wing_type.dart';
import 'package:wai/models/enneagram_test/enneagram_test.dart';
import 'package:wai/screens/enneagram_page/enneagram_type_page_screen.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/block_text.dart';

class EnneagramDialog {

  static void showEnneagramType({
    required BuildContext context,
    required EnneagramTest myEnneagramTest,
    void Function()? onPressed}) {

    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title : Text("나의 에니어그램은", style: CustomTextStyles.buildTextStyle(fontSize: 22), textAlign: TextAlign.center,),
            content: SizedBox(
              height: 350,
              child: Column(
                children: [
                  _buildMyEnneagramTypeImage(
                      enneagramType: myEnneagramTest.myEnneagramType,
                      wingType: myEnneagramTest.myWingType
                  ),
                  _buildMyEnneagramExplain(enneagramType: myEnneagramTest.myEnneagramType),
                  const Blank(height: 10,),
                  _buildNavigationButton(
                      text: EnneagramController.to.enneagram![myEnneagramTest.myEnneagramType]!.getFullName() + " 더 알아보기",
                      onPressed: () {
                        Navigator.pop(context);
                        onPressed!();
                      }
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  static Widget _buildMyEnneagramTypeImage({required int? enneagramType, int? wingType}) {
    String subName = EnneagramController.to.enneagram![enneagramType]!.subName;

    return ElevatedButton(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(EnneagramController.to.enneagram![enneagramType]!.imagePath), width: 130, height: 130,  fit: BoxFit.fill,
          ),
          const Blank(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "$enneagramType유형", style: WaiTextStyle(fontSize: 18).basic()),
              // Text(EnneagramController.to.enneagram![enneagramType]!.getFullName(),
              //   style: WaiTextStyle(fontSize: 18).basic(),
              //   textAlign: TextAlign.left,
              // ),
              wingType != null ? EnneagramWingText(wingType: wingType, fontSize: 18,) : Container(),
              Text("[$subName]",
                style: WaiTextStyle(fontSize: 18).basic(),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ],
      ),
      onPressed: () {},
      style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent), // Button
          shadowColor: MaterialStateProperty.all(Colors.transparent)
      ),
    );
  }

  static Widget _buildMyEnneagramExplain({required int? enneagramType}) {
    return Column(
      children: [
        Align(
            alignment: Alignment.center,
            child: BlockText(text: EnneagramController.to.enneagram![enneagramType]!.simpleExplain, fontSize: 14,)
        ),
        const Blank(height: 10,),
        Text(EnneagramController.to.enneagram![enneagramType]!.simpleExplain2,
          style: CustomTextStyles.buildTextStyle(fontSize: 16, color: Colors.black54),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  static Padding _buildNavigationButton({required String text, required void Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
            child: Text(text, style: CustomTextStyles.buildTextStyle(color: Colors.white),),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                shape : MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))
                )
            ),
            onPressed: onPressed
        ),
      ),
    );
  }
}