import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/theme/custom_textStyles.dart';

import 'custom_radio_button.dart';

double largeSize = 35;
double mediumSize = 30;
double smallSize = 25;

class CustomRadioGroupButton extends StatefulWidget {
  CustomRadioGroupButton({Key? key, this.groupValue = 0}) : super(key: key);
  int groupValue;

  @override
  _CustomRadioGroupButtonState createState() => _CustomRadioGroupButtonState();
}

class _CustomRadioGroupButtonState extends State<CustomRadioGroupButton> {

  void setGroupValue (int value) {
    setState(() {
      widget.groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
            flex: 1,
            child: CustomRadioButton(
              buttonText: "그렇지않다",
              uniqueValue: 1,
              groupValue: widget.groupValue,
              mainColor: Colors.red.shade200,
              buttonSize: largeSize,
              onPressed: () {
                setGroupValue(1);
              },
            )
        ),
        Flexible(
            flex: 1,
            child: CustomRadioButton(
              buttonText: "",
              uniqueValue: 2,
              groupValue: widget.groupValue,
              mainColor: Colors.red.shade200,
              buttonSize: mediumSize,
              onPressed: () {
                setGroupValue(2);
              },
            )
        ),
        Flexible(
            flex: 1,
            child: CustomRadioButton(
              buttonText: "보통이다",
              uniqueValue: 3,
              groupValue: widget.groupValue,
              buttonSize: smallSize,
              onPressed: () {
                setGroupValue(3);
              },
            )
        ),
        Flexible(
            flex: 1,
            child: CustomRadioButton(
              buttonText: "",
              uniqueValue: 4,
              groupValue: widget.groupValue,
              mainColor: Colors.blue.shade200,
              buttonSize: mediumSize,
              onPressed: () {
                setGroupValue(4);
              },
            )
        ),
        Flexible(
            flex: 1,
            child: CustomRadioButton(
              buttonText: "그렇다",
              uniqueValue: 5,
              groupValue: widget.groupValue,
              mainColor: Colors.blue.shade200,
              buttonSize: largeSize,
              onPressed: () {
                setGroupValue(5);
              },
            )
        ),
      ],
    );
  }
}