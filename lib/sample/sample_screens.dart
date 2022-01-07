import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/screens/custom_appbar.dart';

class SampleScreens extends StatelessWidget {
  const SampleScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx(() =>  Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: new AssetImage("assets/images/background/night-4822906.png"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
              )
          ),
          child: Center(
            child: ListView(
              children: [
                TextButton(onPressed: () {}, child: Text('버튼')),
                TextButton(onPressed: () {}, child: Text(MainController.to.currentIndex.value.toString()))
              ],
            )
          ),
        )
    ));
  }
}
