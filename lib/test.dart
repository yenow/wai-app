import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wai/screens/reply_page/components/reply_form.dart';

import 'common/theme/theme.dart';

void main() {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(    // CupertinoApp, GetMaterialApp
      title: 'wai_ui',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(

        ),
      ),
      theme: theme(),
    );
  }
}