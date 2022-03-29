import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';

class PostBackgroundImageController extends GetxController {
  static PostBackgroundImageController get to => Get.find();

  final backgroundImageList = [].obs;

  Future<void> initImage() async {
    String jsonData = await rootBundle.loadString('AssetManifest.json');
    Map<String,dynamic> map = json.decode(jsonData);
    final imageList =  map.keys.where((String key) => key.contains('images/post_background_image')).toList();
    backgroundImageList(imageList);
  }

  Future<void> precacheImages(BuildContext context) async {
    for (String element in backgroundImageList) {
      precacheImage(
        AssetImage(element),
        context,
      );
    }
  }

  String getRandomImageUrl() {
    var rng = Random();
    int randomIndex = rng.nextInt(backgroundImageList.length);
    return backgroundImageList[randomIndex];
  }

}