import 'package:flutter/cupertino.dart';
import 'package:wai/common/theme/wai_textstyle.dart';

class WaiText extends StatelessWidget {
  const WaiText({Key? key, required this.text, this.style}) : super(key: key);
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? WaiTextStyle().basic(),
    );
  }
}
