import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

enum ButtonSize {
  small, medium, large
}

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({Key? key,
    required this.uniqueValue,
    this.groupValue,
    required this.onPressed,
    this.buttonText = "",
    this.mainColor = Colors.grey,
    this.overlayColor = Colors.grey,
    this.buttonSize = 30
  }) : super(key: key);

  final String buttonText;
  final int uniqueValue;
  final int? groupValue;
  final VoidCallback onPressed;
  final Color mainColor;
  final Color overlayColor;
  final double buttonSize;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Text(
          buttonText,
          style: uniqueValue == groupValue ?
          TextStyle(fontSize: 12, color: mainColor) :
          TextStyle(fontSize: 12, color: mainColor)
        ),
        const SizedBox(height: 2,),
        ElevatedButton(
          child: const SizedBox(width: 10, height: 10,),
          onPressed: onPressed,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(overlayColor),
            minimumSize: MaterialStateProperty.all(Size(buttonSize, buttonSize)),
            backgroundColor: MaterialStateProperty.resolveWith((states) {

              if (uniqueValue == groupValue) {
                return mainColor;
              } else {
                return Colors.white;
              }
            }),
            shape: MaterialStateProperty.all(CircleBorder(
              side: BorderSide(
                color: mainColor,
                width: 1,
              ),

            ))
          ),
        )
      ],
    );
  }
}