import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/constants/constants.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';

class CustomAppbar extends StatelessWidget {

  final titleText;
  final leading;
  final backgroundImage;
  final isBottom;
  final Bottom;
  final backgroundColor;
  final elevation;

  CustomAppbar({
    this.titleText,
    this.backgroundImage = null,
    this.isBottom = false,
    this.backgroundColor = Colors.transparent,
    this.Bottom,
    this.leading = null,
    this.elevation = 0.0
  });

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title : titleText == null ? const Text('WAI') : Text(titleText),
      elevation: elevation, // 2.0
      leading: leading,
      backgroundColor: backgroundColor,
      flexibleSpace: backgroundImage,
      actions: [],
    );
  }

  Widget _getLeading({required BuildContext context}) {

    return leading ?? IconButton(
      icon: const Icon(
        FontAwesomeIcons.alignJustify,
        color: WaiColors.blueGrey,
        size: 24.0,
        semanticLabel: 'Text to announce in accessibility modes',
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }

  Widget _pagePopIcon(BuildContext context) {
    return GestureDetector(
      child: Icon(FontAwesomeIcons.arrowLeft, size: 20, color: Colors.blueGrey,),
      onTap: () {

      },
    );
  }
}
