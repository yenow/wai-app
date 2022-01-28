
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/constants/constants.dart';

class HorizontalBorderLine extends StatelessWidget {
  const HorizontalBorderLine({Key? key, this.height = 0.5}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: Divider(thickness: 0.5, height: height, color: bodyBorderColor),
        preferredSize: const Size.fromHeight(0.5)
    );
    }
}
