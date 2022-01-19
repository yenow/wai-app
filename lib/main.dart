import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wai/screens/introduction_screen.dart';
import 'package:wai/screens/main_screens.dart';
import 'package:wai/screens/posts_page/post_page_screen.dart';
import 'common/theme/theme.dart';

double deviceWidth = 411.42857142857144;
double deviceHeight = 683.4285714285714;
double standardDeviceWidth = 411.42857142857144;
double standardDeviceHeight = 683.4285714285714;
double widthRatio = 1.0;
double heightRatio = 1.0;

void main() {
  runApp(const WaiUI());
}

class WaiUI extends StatelessWidget {
  const WaiUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(    // CupertinoApp, GetMaterialApp
      title: 'wai_ui',
      debugShowCheckedModeBanner: false,
      home: AutoLoginState()/*IntroductionSrceen()*/ /*: MainScreens()*/,
      getPages: [
        /*GetPage(name : '/PostPageScreen', page: () => PostPage())*/
      ],
      theme: theme(),
    );
  }
}

class AutoLoginState extends StatefulWidget {
  const AutoLoginState({Key? key}) : super(key: key);

  @override
  _AutoLoginStateState createState() => _AutoLoginStateState();
}

class _AutoLoginStateState extends State<AutoLoginState> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String?> userKey;

  @override
  void initState() {
    userKey = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('userKey');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: userKey,
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        switch (snapshot.connectionState) {
          /*요청을 기다리는중*/
          case ConnectionState.waiting:
            return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ));
          default:
            if (snapshot.hasError) {    /*에러시*/
              return Text('Error: ${snapshot.error}');
            } else {
              Logger().d("userKey : $snapshot.data");
              return snapshot.data == null ? IntroductionSrceen() : MainScreens();
            }
        }
    });
  }
}

Future<String?> getUserKey () async {
  final prefs = await SharedPreferences.getInstance();
  final String? counter = prefs.getString("userKey");
  Logger().d(counter);
  return counter;
}
