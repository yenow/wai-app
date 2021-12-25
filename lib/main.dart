import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screens/main_screens.dart';
import 'theme.dart';

void main() {
  runApp(const WaiUI());
}

class WaiUI extends StatelessWidget {
  const WaiUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'wai_ui',
        debugShowCheckedModeBanner: false,
        home: MainScreens(),
        theme: theme(),
      );
  }
}
