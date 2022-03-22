import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/wai_appbar.dart';

class ImageSelectScreen extends StatelessWidget {
  const ImageSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: rootBundle.loadString('AssetManifest.json'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          String jsonData = snapshot.data.toString();
          Map<String,dynamic> map = json.decode(jsonData);
          // logger.d(map);
          final imageList =  map.keys.where((String key) => key.contains('images/background')).toList();
          logger.d(imageList);

          return SafeArea(
            child: Scaffold(
              appBar: WaiAppbar(
                title: Text('선택'),
              ),
              body: Container(
                child: Text(snapshot.data.toString()),
              ),
            ),
          );
        } else if (snapshot.hasError) {

          return Text(snapshot.error.toString());
        } else {
          return  const SizedBox(
            child: CircularProgressIndicator(),
            width: 60,
            height: 60,
          );
        }
      }
    );
  }
}
