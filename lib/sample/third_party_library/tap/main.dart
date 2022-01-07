import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_cupertino_app.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wai/screens/login_page/simple_login_page_screen.dart';
import 'package:wai/screens/login_screen.dart';
import 'package:wai/screens/main_screens_back.dart';

void main() {
  runApp(const WaiUI());
}

class WaiUI extends StatelessWidget {
  const WaiUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(    // CupertinoApp, GetMaterialApp
        title: 'wai_ui',
        debugShowCheckedModeBanner: false,
        home: MainScreens2(),
        // theme: theme(),
      );
  }
}
