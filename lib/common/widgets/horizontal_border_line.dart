
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/constants/constants.dart';

class HorizontalBorderLine extends StatelessWidget {
  const HorizontalBorderLine({Key? key, this.height = 0.5, this.color = const Color.fromARGB(200, 100, 100, 100)}) : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: Divider(thickness: 0.5, height: height, color: color),
        preferredSize: const Size.fromHeight(0.5)
    );
  }
}
