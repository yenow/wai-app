
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/screens/enneagram_page/enneagram_type_page_screen.dart';
import 'package:wai/screens/introduction_screen.dart';
import 'package:wai/utils/enneagram_dialog.dart';
import 'package:wai/widgets/black.dart';
import 'package:wai/widgets/block_text.dart';
import 'package:wai/widgets/horizontal_border_line.dart';

import '../../main.dart';

class ProfilePageScreen extends StatelessWidget {
  ProfilePageScreen({Key? key, this.enneagramType}) : super(key: key);
  int? enneagramType;

  @override
  Widget build(BuildContext context) {
    Logger().d("=== build ProfilePage ===");

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (enneagramType != null && MainController.to.isShowEnneagramDialog.value == false
          && MainController.to.currentTabIndex.value == TabItem.profilePageScreen.index) {
        MainController.to.setIsShowEnneagramDialog(true);

        EnneagramDialog.showEnneagramType(
            context: context,
            enneagramType: enneagramType!,
            onPressed: () {
              MainController.to.goIntoPage();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                      EnneagramTypePageScreen(enneagramType: enneagramType!,)
                  )
              );
            }
        );
      }
    });

    return FutureBuilder(
      future: UserController.to.initUserInfo(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          /*요청을 기다리는중*/
          case ConnectionState.waiting:
            return Scaffold(
                body: Center(
                    child: const CircularProgressIndicator()
                )
            );
          default:
            if (snapshot.hasError) {    /*에러시*/
              return Scaffold(body : Text('Error: ${snapshot.error}'));
            } else {
              return _buildScaffold(context);
            }
        }
      }
    );

    return _buildScaffold(context);
  }

  Scaffold _buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),   // MainController.to.appBarState.value.appbarSize
        child: AppBar(
          title: Text("프로필"),
          elevation: 2.0,
          backgroundColor: Colors.white,
        ),
      ),
      body: _buildbody(context)
  );
  }

  SingleChildScrollView _buildbody(BuildContext context) {

    return SingleChildScrollView(
        child: Column(
        children: <Widget>[
          _buildTopBackground(context: context),
          // _buildMyInfoMation(),
          _buildSetting(),
          ElevatedButton(
              child: Text('show enneagramDialog'),
              onPressed: () {
                EnneagramDialog.showEnneagramType(
                    context: context,
                    enneagramType: 1,
                    onPressed: () {
                      MainController.to.goIntoPage();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                            EnneagramTypePageScreen(enneagramType: 1,)
                          )
                      );
                    }
                );
              }
          ),
        ]
      )
    );
  }

  Container _buildTopBackground({required BuildContext context}) {
    return Container(
      // height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background/mesh.png"),
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
          fit: BoxFit.fill,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: _buildEnneagramArea(context: context),
    );
  }

  Widget _buildEnneagramArea({required BuildContext context}) {
    return Container(
      width: double.infinity,
      // height: 180,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Color.fromRGBO(255, 255, 255, 0.8),
      ),
      child: Column(
        children: [
          _buildMyEnneagramTitle(),
          Blank(height: 8,),
          _buildMyEnneagramContent(),
          _buildNavigationButton(
              text: EnneagramController.to.enneagram![1]!.getFullName() + " 더 알아보기",
              onPressed: () {
                MainController.to.goIntoPage();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        EnneagramTypePageScreen(enneagramType: 1,)
                    )
                );
              }
          ),
          Blank(height: 5),
          _buildNavigationButton(
              text: "정밀테스트 하기",
              onPressed: () {

              }),
          Blank(height: 5),
        ],
      ),
    );
  }

  SizedBox _buildMyEnneagramTitle() {
    return SizedBox(
        height: 30,
        child: Stack(
          children: [
            _buildEnneagramTestDate(),
            Align(
                alignment: Alignment.topCenter,
                child: Text("나의 에니어그램", style: CustomTextStyles.buildTextStyle(fontSize: 22))
            )
          ],
        )
    );
  }

  Align _buildEnneagramTestDate() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Row(
          children: [
            Icon(Icons.today_outlined, size: 14, color: Colors.grey),
            Blank(width: 5,),
            DropdownButton(
              value: "2021-01-01",
              style: CustomTextStyles.buildTextStyle(fontSize: 12, color : Colors.grey),
              items:  <String>['2021-01-01', '2021-01-02', '2021-01-03', '2021-01-04'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                print(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Row _buildMyEnneagramContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildMyEnneagramTypeImage(),
        _buildMyEnneagramExplain(),
      ],
    );
  }

  Widget _buildMyEnneagramTypeImage() {
    return ElevatedButton(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(EnneagramController.to.enneagram![1]!.imagePath), width: 60, height: 60,  fit: BoxFit.fill,
          ),
          Blank(height: 5),
          Text(EnneagramController.to.enneagram![1]!.getFullName(),
            style: CustomTextStyles.buildTextStyle(fontSize: 14),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      onPressed: () {},
      style: ButtonStyle(
          shape: MaterialStateProperty.all(CircleBorder()),
          padding: MaterialStateProperty.all(EdgeInsets.all(10)),
          backgroundColor: MaterialStateProperty.all(Colors.transparent), // Button
          shadowColor: MaterialStateProperty.all(Colors.transparent)
      ),
    );
  }

  Widget _buildMyEnneagramExplain() {
    return Expanded(
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: BlockText(text: EnneagramController.to.enneagram![1]!.simpleExplain,)
          ),
          SizedBox(
            height: 50,
            child: Scrollbar(
              child: ListView(
                children: [
                  Text(EnneagramController.to.enneagram![1]!.simpleExplain2,
                    style: CustomTextStyles.buildTextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildNavigationButton({required String text, required void Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        height: 30,
        child: ElevatedButton(
            child: Text(text, style: CustomTextStyles.buildTextStyle(color: Colors.white),),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                shape : MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))
                )
            ),
            onPressed: onPressed
        ),
      ),
    );
  }

  Widget _buildMyInfoMation() {
    return Column(
      children: [
      ],
    );
  }

  Widget _buildSetting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          _buildSettingItem(text: "앱 설정"),
          const HorizontalBorderLine(height: 1,),
          _buildSettingItem(text: "앱 정보"),
          const HorizontalBorderLine(height: 1,),
          _buildSettingItem(text: "공지사항"),
          const HorizontalBorderLine(height: 1,),
          ElevatedButton(
              child: Text('userKey delete'),
              onPressed: ()  async {
                await AppController.to.removeUserKey();
                //var string = await AppController.to.getUserKey();
                Get.off(IntroductionSrceen());
              }
          ),
        ],
      ),
    );
  }

  SizedBox _buildSettingItem({required String text, void Function()? onTap}) {
    return SizedBox(
          height: 50,
          child: GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(text, style: CustomTextStyles.buildTextStyle(),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Icon(Icons.arrow_forward_ios_outlined, size: 15, color: Colors.blueGrey),
                ),
              ],
            ),
            onTap: onTap,
          ),
        );
  }

  InkWell _buildTextButton() {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(EnneagramController.to.enneagram![1]!.getFullName() + "더 알아보기",
              style: CustomTextStyles.buildTextStyle(fontSize: 16),
              // textAlign: TextAlign.right,
            ),
            Icon(Icons.arrow_forward_ios_outlined, size: 16, color: Colors.blueGrey),
          ],
        ),
      ),
    );
  }
}


/*
ElevatedButton(
  child: Text('userKey delete'),
  onPressed: ()  async {
  await AppController.to.removeUserKey();

  var string = await AppController.to.getUserKey();
  Logger().d(string);

  Get.off(IntroductionSrceen());
  }
)*/
