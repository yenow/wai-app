import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/constants/constants.dart';
import 'package:wai/common/constants/custom_colors.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';

class CustomAppbar extends StatelessWidget {

  final titleText;
  final isLeading;
  final leading;
  final isPopPage;
  final isBackgroundImage;
  final backgroundImage;
  final isBottom;
  final Bottom;

  CustomAppbar({
    this.titleText,
    this.isLeading = true,
    this.isBackgroundImage = false,
    this.backgroundImage,
    this.isBottom = false,
    this.Bottom,
    this.leading,
    this.isPopPage = false,
  });

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title : titleText == null ? const Text('WAI') : Text(titleText),
      elevation: 2.0,
      leading: isPopPage ? _pagePopIcon(context) : isLeading ? _getLeading(context: context) : null,
      backgroundColor: isBackgroundImage ? null : Colors.white,
      flexibleSpace: isBackgroundImage ? backgroundImage : null,
      actions: [],
    );
  }

  Widget _getLeading({required BuildContext context}) {

    return leading ?? IconButton(
      icon: const Icon(
        FontAwesomeIcons.alignJustify,
        color: appBarTitleTextColor,
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
        MainController.to.back();
      },
    );
  }
}
