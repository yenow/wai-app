import 'package:flutter/cupertino.dart';
import 'package:wai/common/theme/custom_textstyles.dart';

class BlockText extends StatelessWidget {
  const BlockText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2,),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Color.fromRGBO(150, 150, 150, 0.3)
      ),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Text(text, style: CustomTextStyles.blockTextStyle(), maxLines: 1, overflow: TextOverflow.clip,),
      ),
    );
  }
}
