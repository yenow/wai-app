import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/controller/permenent/enneagram_controller.dart';
import 'package:wai/controller/main_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/controller/user_profile_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/widgets/enneagram/enneagram_wing_type.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/data/dto/enneagram_test_request_dto.dart';
import 'package:wai/data/model/enneagram_test.dart';
import 'package:wai/net/user/user_api.dart';
import 'package:wai/screens/enneagram_page/enneagram_type_page_screen.dart';
import 'package:wai/common/utils/enneagram_dialog.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/block_text.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/screens/profile_page/my_action_page.dart';
import 'package:wai/ui/hard_enneagram_test_screen/hard_enneagram_test_screen.dart';

import '../../main.dart';
import 'components/enneagram_chart.dart';
import 'my_infomation_page.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }

  Widget _buildScaffold(BuildContext context) {
    logger.i("ProfilePageScreen build");

    return Obx(() =>
      Scaffold(
        backgroundColor: Colors.white,
        appBar: const WaiAppbar(
          title: Text("프로필"),
        ),
        body: _buildBody(context)
      ),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
        children: <Widget>[
          _buildTopBackground(context: context),
          // _buildMyInfomation(),
          _buildSetting(),
        ]
      )
    );
  }

  Container _buildTopBackground({required BuildContext context}) {
    return Container(
      // height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/images/background/mesh.png"),
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
          fit: BoxFit.fill,
        ),
      ),
      child: _buildEnneagramArea(context: context),
    );
  }

  Widget _buildEnneagramArea({required BuildContext context}) {
    int myEnneagramType = UserProfileController.to.currentEnneagram.value.myEnneagramType!;

    return Container(
      width: double.infinity,
      // height: 180,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color.fromRGBO(255, 255, 255, 0.8),
      ),
      child: Column(
        children: [
          _buildMyEnneagramTitle(),
          // Blank(height: 4,),
          _buildMyEnneagramContent(myEnneagramType),
          _buildEnneagramChart(),
          _buildNavigationButton(
              text: EnneagramController.to.enneagram![myEnneagramType]!.getFullName() + " 더 알아보기",
              onPressed: () {
                Get.to(() => EnneagramTypePageScreen(enneagramType: myEnneagramType));
              }
          ),
          const Blank(height: 5),
          _buildNavigationButton(
              text: "정밀테스트 하기",
              onPressed: () {
                Get.to(() => HardEnneagramTestScreen());
              }),
          const Blank(height: 5),
        ],
      ),
    );
  }

  Widget _buildEnneagramChart() => UserProfileController.to.currentEnneagram.value.testType == TestType.hard ?
      EnneagramChart(enneagramTest: UserProfileController.to.currentEnneagram.value)
      : Container();

  SizedBox _buildMyEnneagramTitle() {
    return SizedBox(
      child: Column(
        children: [
          const Blank(height: 3,),
          Align(
              alignment: Alignment.topCenter,
              child: Text("나의 에니어그램", style: CustomTextStyles.buildTextStyle(fontSize: 22))
          ),
          // _buildEnneagramTestDate(),
        ],
      )
    );
  }

  // Widget _buildEnneagramTestDate() {
  //   final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
  //
  //   if (UserProfileController.to.currentEnneagram.value.insertDate == null) {
  //     return const Blank();
  //   }
  //
  //   List<String> items = [];
  //   for (EnneagramTest temp in UserController.to.user.value.enneagramTests) {
  //     items.add(formatter.format(temp.insertDate!));
  //   }
  //
  //   return SizedBox(
  //     width: double.infinity,
  //     height: 14,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         const Icon(Icons.today_outlined, size: 14, color: Colors.grey),
  //         const Blank(width: 5,),
  //         DropdownButtonHideUnderline(
  //           child: DropdownButton(
  //             value: formatter.format(UserProfileController.to.currentEnneagram.value.insertDate!),
  //             style: CustomTextStyles.buildTextStyle(fontSize: 12, color : Colors.grey),
  //             items: items.map<DropdownMenuItem<String>>((String value) {
  //               return DropdownMenuItem<String>(
  //                 value: value,
  //                 child: Text(value),
  //               );
  //             }).toList(),
  //             onChanged: (String? insertDate) {
  //               UserProfileController.to.updateCurrentEnneagram(insertDate: insertDate!);
  //             },
  //             onTap: () {
  //
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
    int? wingType = UserProfileController.to.currentEnneagram.value.myWingType;

    return SizedBox(
      width: 110,
      child: ElevatedButton(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(EnneagramController.to.enneagram![myEnneagramType]!.imagePath), width: 60, height: 60,  fit: BoxFit.fill,
            ),
            const Blank(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( "$myEnneagramType유형", style: WaiTextStyle(fontSize: 15).basic()),
                wingType != null ? EnneagramWingText(wingType: wingType, fontSize: 15,) : Container()
              ],
            ),
            Text("[$subName]",
              style: WaiTextStyle(fontSize: 14).basic(),
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: double.infinity,
        height: 30,
        child: ElevatedButton(
            child: Text(text, style: CustomTextStyles.buildTextStyle(color: Colors.white),),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                shape : MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))
                )
            ),
            onPressed: onPressed
        ),
      ),
    );
  }

  // Widget _buildMyInfomation() {
  //   return Container(
  //     width: double.infinity,
  //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //     decoration: BoxDecoration(
  //       color: Colors.grey.shade200,
  //       borderRadius: const BorderRadius.all(Radius.circular(10))
  //     ),
  //     child: Column(
  //       children: [
  //         Text("내 활동", style: WaiTextStyle(fontSize: 22).bodyText(),),
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
  //           child: InkWell(
  //             onTap: () {
  //               Get.to(() => const MyActionPage());
  //             },
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.end,
  //               children: [
  //                 Text("자세히보기", style: WaiTextStyle(fontSize: 14).bodyText(),),
  //                 const Padding(
  //                   padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
  //                   child: Icon(Icons.arrow_forward_ios_outlined, size: 14, color: Colors.black54),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         const HorizontalBorderLine(),
  //         Padding(
  //           padding: const EdgeInsets.all(10.0),
  //           child: IntrinsicHeight (
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Text("내 게시글", style: WaiTextStyle(fontSize: 16).bodyText(),),
  //                 Text(UserController.to.user.value.posts.length.toString(), style: WaiTextStyle(fontSize: 16).bodyText(),),
  //                 const VerticalDivider(
  //                   color: Colors.grey,
  //                   thickness: 1,
  //                 ),
  //                 Text("내 댓글", style: WaiTextStyle(fontSize: 16).bodyText(),),
  //                 Text(UserController.to.user.value.replys.length.toString(), style: WaiTextStyle(fontSize: 16).bodyText(),),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildSetting() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          _buildSettingItem(
            text: "나의 활동 (게시글, 댓글)",
            onTap: () {
              Get.to(() => const MyActionPage());
            }
          ),
          const HorizontalBorderLine(height: 1,),
          _buildSettingItem(
            text: "닉네임 변경",
            onTap: () {
              Get.to(() => const MyInformationPage());
            }
          ),
          const HorizontalBorderLine(height: 1,),
          // const HorizontalBorderLine(height: 1,),
          // ElevatedButton(
          //   child: Text('show snackbar'),
          //   onPressed: () {
          //     AppController.to.showSnackBar(WaiSnackBar.basic(text: "게시물이 등록되었습니다."));
          //
          //     EnneagramDialog.showEnneagramType(
          //         context: context,
          //         myEnneagramTest : EnneagramTest(myEnneagramType: 1),
          //         onPressed: () {
          //           Get.to(() => EnneagramTypePageScreen(enneagramType: EnneagramTest(myEnneagramType: 1).myEnneagramType!));
          //         }
          //     );
          //   }
          // ),
          // _buildSettingItem(text: "앱 정보"),
          // const HorizontalBorderLine(height: 1,),
          // _buildSettingItem(text: "공지사항"),
          // const HorizontalBorderLine(height: 1,),
          // ElevatedButton(
          //     child: Text('userKey delete'),
          //     onPressed: ()  async {
          //       await AppController.to.removeUserKey();
          //       //var string = await AppController.to.getUserKey();
          //       Get.off(IntroductionScreen());
          //     }
          // ),
        ],
      ),
    );
  }

  SizedBox _buildSettingItem({required String text, void Function()? onTap}) {
    return SizedBox(
      height: 50,
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(text, style: WaiTextStyle().bodyText()),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(Icons.arrow_forward_ios_outlined, size: 15, color: Colors.black54),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}