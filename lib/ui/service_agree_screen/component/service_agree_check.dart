import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/theme/wai_textstyle.dart';

import '../../../common/utils/logger.dart';
import '../../../constants/wai_colors.dart';
import '../../../controller/service_agree_controller.dart';

class ServiceAgreeCheck extends StatelessWidget {
  const ServiceAgreeCheck({Key? key, this.value, this.onChanged, required this.agreeText}) : super(key: key);
  final bool? value;
  final void Function(bool?)? onChanged;
  final String agreeText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Checkbox(
            side: const BorderSide(width: 1.0, color: WaiColors.lightBlueGrey),
            shape: const CircleBorder(),
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all(WaiColors.lightBlueGrey),
            value: value,
            onChanged: onChanged,
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SizedBox(
                height: constraints.maxHeight,
                child: Align(
                  alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                  child: AutoSizeText(
                    agreeText,
                    maxLines: 1,
                    style: WaiTextStyle(color: WaiColors.lightBlueGrey).basic(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
