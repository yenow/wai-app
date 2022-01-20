import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/controller/main_controller.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
          print(1);
          MainController.to.test();
        },
        child: Text('버튼'),
      ),
    );
  }
}
