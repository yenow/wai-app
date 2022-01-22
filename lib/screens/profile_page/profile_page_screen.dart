import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/screens/introduction_screen.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            child: Text('ProfilePageScreen'),
          ),
        ),
        ElevatedButton(
          child: Text('userKey delete'),
          onPressed: ()  async {
            await AppController.to.removeUserKey();

            Get.off(IntroductionSrceen());
          }
        )
      ],
    );
  }
}
