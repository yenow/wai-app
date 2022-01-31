import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/screens/enneagram_page/enneagram_type_page_screen.dart';
import 'package:wai/widgets/black.dart';
import 'package:wai/widgets/block_text.dart';

class EnneagramDialog {

  static void showEnneagramType({required BuildContext context, required int enneagramType, void Function()? onPressed}) {

    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title : Text("나의 에니어그램은", style: CustomTextStyles.buildTextStyle(fontSize: 22), textAlign: TextAlign.center,),
            content: SizedBox(
              width: double.infinity,
              height: 350,
              child: Column(
                children: [
                  _buildMyEnneagramTypeImage(enneagramType: enneagramType),
                  _buildMyEnneagramExplain(enneagramType: enneagramType),
                  Blank(height: 10,),
                  _buildNavigationButton(
                      text: EnneagramController.to.enneagram![enneagramType]!.getFullName() + " 더 알아보기",
                      onPressed: () {
                        Navigator.pop(context);
                        onPressed!();
                        // MainController.to.goIntoPage();
                        // Navigator.push(mainContext,
                        //     MaterialPageRoute(builder: (mainContext) =>
                        //       EnneagramTypePageScreen(enneagramType: enneagramType,)
                        //     )
                        // );
                      }
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  static Widget _buildMyEnneagramTypeImage({required int? enneagramType}) {
    return ElevatedButton(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(EnneagramController.to.enneagram![enneagramType]!.imagePath), width: 130, height: 130,  fit: BoxFit.fill,
          ),
          Blank(height: 5),
          Text(EnneagramController.to.enneagram![enneagramType]!.getFullName(),
            style: CustomTextStyles.buildTextStyle(fontSize: 14),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      onPressed: () {},
      style: ButtonStyle(
          shape: MaterialStateProperty.all(CircleBorder()),
          padding: MaterialStateProperty.all(EdgeInsets.all(10)),
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
            child: BlockText(text: EnneagramController.to.enneagram![enneagramType]!.simpleExplain,)
        ),
        Blank(height: 10,),
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
                padding: MaterialStateProperty.all(EdgeInsets.all(10)),
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