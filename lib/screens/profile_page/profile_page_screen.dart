
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/controller/user_controller.dart';
import 'package:wai/common/controller/user_profile_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/enneagram_test/enneagram_test.dart';
import 'package:wai/screens/enneagram_page/enneagram_type_page_screen.dart';
import 'package:wai/screens/enneagram_test_page/enneagram_test_page_screen.dart';
import 'package:wai/screens/introduce_page/introduction_screen.dart';
import 'package:wai/common/utils/enneagram_dialog.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/block_text.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';

import '../../main.dart';

class ProfilePageScreen extends StatelessWidget {
  ProfilePageScreen({Key? key, this.enneagramType}) : super(key: key);
  int? enneagramType;

  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    loggerNoStack.d("build ProfilePage");

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (enneagramType != null && MainController.to.isShowEnneagramDialog.value == false
          /*&& MainController.to.currentTabIndex.value == TabItem.profilePageScreen.index*/) {
        MainController.to.setIsShowEnneagramDialog(true);

        EnneagramDialog.showEnneagramType(
            context: context,
            enneagramType: enneagramType!,
            onPressed: () {
              Get.to(() => EnneagramTypePageScreen(enneagramType: enneagramType!));
            }
        );
      }
    });

    return _buildScaffold(context);
  }

  Widget _buildScaffold(BuildContext context) {
    return Obx(() =>
      Scaffold(
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
      ),
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
                      Get.to(() => EnneagramTypePageScreen(enneagramType: enneagramType!));
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
    int myEnneagramType = UserProfileController.to.currentEnneagram.value.myEnneagramType!;

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
          // Blank(height: 4,),
          _buildMyEnneagramContent(myEnneagramType),
          _buildNavigationButton(
              text: EnneagramController.to.enneagram![myEnneagramType]!.getFullName() + " 더 알아보기",
              onPressed: () {
                Get.to(() => EnneagramTypePageScreen(enneagramType: myEnneagramType));
              }
          ),
          Blank(height: 5),
          _buildNavigationButton(
              text: "정밀테스트 하기",
              onPressed: () {
                Get.to(() => EnneagramTestPageScreen());
              }),
          Blank(height: 5),
        ],
      ),
    );
  }

  SizedBox _buildMyEnneagramTitle() {
    return SizedBox(
        // height: 55,
        child: Column(
          children: [
            Blank(height: 5,),
            Align(
                alignment: Alignment.topCenter,
                child: Text("나의 에니어그램", style: CustomTextStyles.buildTextStyle(fontSize: 22))
            ),
            Blank(height: 5,),
            _buildEnneagramTestDate(),
          ],
        )
    );
  }

  Widget _buildEnneagramTestDate() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');

    if (UserProfileController.to.currentEnneagram.value.insertDate == null) {
      return const Blank();
    }

    List<String> items = [];
    for (EnneagramTest temp in UserController.to.user.value.enneagramTests!) {
      items.add(formatter.format(temp.insertDate!));
    }

    return SizedBox(
      width: double.infinity,
      height: 14,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.today_outlined, size: 14, color: Colors.grey),
          Blank(width: 5,),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              value: formatter.format(UserProfileController.to.currentEnneagram.value.insertDate!),
              style: CustomTextStyles.buildTextStyle(fontSize: 12, color : Colors.grey),
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? insertDate) {
                UserProfileController.to.updateCurrentEnneagram(insertDate: insertDate!);
              },
              onTap: () {

              },
            ),
          ),
        ],
      ),
    );
  }

  Row _buildMyEnneagramContent(int myEnneagramType) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMyEnneagramTypeImage(myEnneagramType),
        _buildMyEnneagramExplain(myEnneagramType),
      ],
    );
  }

  Widget _buildMyEnneagramTypeImage(int myEnneagramType) {
    String subName = EnneagramController.to.enneagram![myEnneagramType]!.subName;
    
    return SizedBox(
      width: 110,
      child: ElevatedButton(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(EnneagramController.to.enneagram![myEnneagramType]!.imagePath), width: 60, height: 60,  fit: BoxFit.fill,
            ),
            Blank(height: 5),
            Text("$myEnneagramType유형",
              style: CustomTextStyles.buildTextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
            Text("[$subName]",
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
      ),
    );
  }

  Widget _buildMyEnneagramExplain(int myEnneagramType) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Blank(height: 15),
          Align(
              alignment: Alignment.centerLeft,
              child: BlockText(text: EnneagramController.to.enneagram![myEnneagramType]!.simpleExplain,)
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Text(EnneagramController.to.enneagram![myEnneagramType]!.simpleExplain2,
              style: CustomTextStyles.buildTextStyle(fontSize: 16),
              textAlign: TextAlign.left,
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
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.grey.shade300,
      child: Column(
        children: [

        ],
      ),
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
          _buildSettingItem(text: "내 정보"),
          const HorizontalBorderLine(height: 1,),
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
                Get.off(IntroductionScreen());
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
