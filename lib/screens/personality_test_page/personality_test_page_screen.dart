import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalityTestPageScreen extends StatelessWidget {
  const PersonalityTestPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 200,
            color: Colors.red,
          )
          ,ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Container(
                height: 200,
                color: Colors.orange,
              )
            ],
          )
        ],
      )
    );
  }
}
