import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/widgets/wai_markdown.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/service_agree_controller.dart';

class ServiceAgreeScrollText extends StatelessWidget {
  const ServiceAgreeScrollText({Key? key, required this.markdownUrl, required this.controller}) : super(key: key);
  final ScrollController controller;
  final String markdownUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          padding: const EdgeInsets.all(20),
          child: WaiMarkdown(
            shrinkWrap: false,
            url: markdownUrl,
            scrollController: controller,
            scrollPhysics: const AlwaysScrollableScrollPhysics(),
          ),
          decoration: BoxDecoration(
            color: WaiColors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 2.0,
              ),
            ],
          )
      ),
    );
  }
}
