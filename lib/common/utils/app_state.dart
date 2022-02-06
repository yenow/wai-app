import 'dart:ui';

import 'package:flutter/material.dart';

class AppState {
  Color? backgroundColor;
  String? backgroundImageUrl;
  Color? bottomNavigationBackgroundColor;
  Color? fontColor;
  double appbarSize;
  String appbarTitle;
  bool isPopPage;
  bool isBackgroundImage;

  AppState({
    this.appbarSize = 50,
    this.appbarTitle = "wai",
    this.isPopPage = false,
    this.isBackgroundImage = true,
    this.backgroundColor = Colors.white, // const Color.fromRGBO(187, 225, 250, 1)
    this.bottomNavigationBackgroundColor = Colors.white
  });

  updateIsPopPage() {
    isPopPage = !isPopPage;
  }
}