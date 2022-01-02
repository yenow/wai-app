import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wai/screens/login_page/simple_login_page_screen.dart';
import 'package:wai/screens/login_screen.dart';

import 'screens/main_screens_back.dart';
import 'common/theme/theme.dart';

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
        home: SimpleLoginPageScreen(),
        theme: theme(),
      );
  }
}
