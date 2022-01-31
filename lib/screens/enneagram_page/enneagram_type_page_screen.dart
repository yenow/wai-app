import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wai/common/controller/app_controller.dart';
import 'package:wai/common/controller/enneagram_controller.dart';
import 'package:wai/common/controller/enneagram_test_controller.dart';
import 'package:wai/common/controller/main_controller.dart';
import 'package:wai/common/theme/custom_textstyles.dart';
import 'package:wai/models/enneagram/enneagram.dart';
import 'package:wai/widgets/black.dart';
import 'package:wai/widgets/block_text.dart';
import 'package:wai/widgets/horizontal_border_line.dart';

const Color tabColor = Color.fromRGBO(146, 169, 189, 1);
const Color selectedColor = Color.fromRGBO(211, 222, 220, 1);

class EnneagramTypePageScreen extends StatelessWidget {
  const EnneagramTypePageScreen({Key? key, required this.enneagramType}) : super(key: key);
  final int enneagramType;

  @override
  Widget build(BuildContext context) {


    return Obx(() =>
        SafeArea(
          child: Scaffold(
            appBar: _buildAppbar(),
            body: Column(
              children: [
                _buildTabButtonArea(),
                const HorizontalBorderLine(),
                Expanded(
                  child: SingleChildScrollView(
                    child: _buildContent(context)
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  PreferredSize _buildAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(50),   // MainController.to.appBarState.value.appbarSize
      child: AppBar(
        title: Text(EnneagramController.to.enneagram![enneagramType]!.getFullName(), style: CustomTextStyles.buildTextStyle(fontSize: 20),),
        /*elevation: 2.0,*/
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios_outlined, size: 20, color: Colors.blueGrey,),
          onTap: () {
            MainController.to.goOutOfPage();
            MainController.to.back();
          },
        ),
      ),
    );
  }

  Padding _buildTabButtonArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabButton(text: '기본', buttonIndex: 0, IconAndTextColor: tabColor),
          _buildTabButton(text: '날개', buttonIndex: 1, iconData: Icons.air_outlined, IconAndTextColor: tabColor),
          _buildTabButton(text: '장단점', buttonIndex: 2, iconData: Icons.thumb_up_off_alt_outlined, IconAndTextColor: tabColor),
          _buildTabButton(text: '관계', buttonIndex: 3, iconData: FontAwesomeIcons.handshake, IconAndTextColor: tabColor),
          _buildTabButton(text: '극복과제', buttonIndex: 4, iconData: Icons.fact_check_outlined, IconAndTextColor: tabColor),
          _buildTabButton(text: '기타', buttonIndex: 5, iconData: Icons.more_horiz_outlined, IconAndTextColor: tabColor),
        ],
      ),
    );
  }

  Column _buildTabButton({required String text,
    required int buttonIndex,
    IconData iconData = Icons.menu,
    Color buttonColor = Colors.white,
    Color IconAndTextColor = Colors.blueGrey
  }) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            EnneagramController.to.tabChange(buttonIndex);
          },
          child: Icon(iconData, color: IconAndTextColor,),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(CircleBorder()),
            padding: MaterialStateProperty.all(EdgeInsets.all(10)),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (EnneagramController.to.enneagramTypePageIndex == buttonIndex) {
                return selectedColor;
              } else {
                return Colors.white;
              }

            }), // Button color
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.pressed)) return Colors.blueGrey.shade100; // Splash color
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text, style: CustomTextStyles.buildTextStyle(color: IconAndTextColor)),
        )
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: IndexedStack(
        index: EnneagramController.to.enneagramTypePageIndex.value,
        children: [
          _buildTabPage1(context),
          _buildTabPage2(context),
          _buildTabPage3(context),
          _buildTabPage4(context),
          _buildTabPage5(context),
          _buildTabPage6(context),
        ],
      ),
    );
  }

  Widget _buildTabPage1(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.grey.shade100,
            boxShadow: [
              BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 2.0,
              ),
            ],
            /*image: DecorationImage(
              image: new AssetImage("assets/images/enneagram/enneagram_icon.png"),
              fit: BoxFit.cover,
              //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
            )*/
          ),
          child: Column(
            children: [
              Text(EnneagramController.to.enneagram![enneagramType]!.getFullName() + "란?", style: CustomTextStyles.headline1()),
              Align(
                alignment: Alignment.centerLeft,
                child: BlockText(text: EnneagramController.to.enneagram![enneagramType]!.simpleExplain)
              ),
              Text(EnneagramController.to.enneagram![enneagramType]!.simpleExplain2, style: CustomTextStyles.bodytext1(),)
              //_buildSubTitle(),
            ],
          )
        ),
        SizedBox(height: 10,),
        RichText(
          text: TextSpan(
            text: "1번 유형들은 크든 작든 자신이 미칠수 있는 영향력을 사용하여 세상을 개선시키고자 하는 사명감을 갖고 있기 때문에"
                " 개혁가라는 이름을 붙였습니다. 이들은 역경을 극복하려고 노력합니다. 이들은 큰 희생을 치르고라도 높은 이상을 "
                "실현시키기 위해 노력합니다.", style: CustomTextStyles.bodytext1(),
          ),
        ),
        //_buildWiseSayArea(),
        //_buildWiseSayArea(),

      ],
    );
  }

  Row _buildSubTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlockText(text: "교사",),
        BlockText(text: "활동가",),
        BlockText(text: "변혁 운동가",),
        BlockText(text: "도덕주의자",),
        BlockText(text: "완벽주이자",),
        Flexible(child: BlockText(text: "조직적인사람"),)
      ],
    );
  }

  Container _buildWiseSayArea() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                  text: "평화를 위해서라도 지불할 수 없는 대가가 있다. 그것은 바로 '자기존중'이라는 대가다.", style: CustomTextStyles.bodytext1(),
              ),
            ),
            Text("우드로 윌슨", style: CustomTextStyles.bodytext1()),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 2.0,
            ),
          ],
        )
      );
  }

  Widget _buildTabPage2(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.grey.shade100,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 2.0,
                ),
              ],
              /*image: DecorationImage(
              image: new AssetImage("assets/images/enneagram/enneagram_icon.png"),
              fit: BoxFit.cover,
              //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
            )*/
            ),
            child: Column(
              children: [
                Text("날개유형이란?", style: CustomTextStyles.headline1()),
                Text("자신의 유형 양 옆쪽에 있는 성격 유형을 말합니다. 날개는 자신의 성격유형을 좀 더 자세하고 정확하게 이해하는데"
                    " 도움이 될 뿐 아니라 기본적인 성향인 자신유형의 부족을 보완 해줄 수 있는 성향을 가지고 있습니다.", style: CustomTextStyles.bodytext1(),)
                //_buildSubTitle(),
              ],
            )
        ),
        SizedBox(
          width: double.infinity,
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "1번 날개" + "\n\n",
                  style: CustomTextStyles.headline2(),
                  children: [
                    TextSpan(text: "이 부속 유형의 사람들은 통찰력이 있고 현명하며 정중하다."
                        " 이들은 학구적이고 차분하다. 이들은 내향적이고 운둔적이어서 많은 사람들로부터 벗어나"
                        "자신만의 조용한 장소를 찾을수도 있다. 이들은 자신의 감정을 쉽게 드러내지는 않지만"
                        " 관대하고 친절하고 사려 깊으며, 대개 자연, 동물. 순수함을 사랑한다." + "\n", style : CustomTextStyles.bodytext1()),
                    TextSpan(text: "이 부속 유형의 사람들은 통찰력이 있고 현명하며 정중하다."
                        " 이들은 학구적이고 차분하다. 이들은 내향적이고 운둔적이어서 많은 사람들로부터 벗어나"
                        "자신만의 조용한 장소를 찾을수도 있다. 이들은 자신의 감정을 쉽게 드러내지는 않지만"
                        " 관대하고 친절하고 사려 깊으며, 대개 자연, 동물. 순수함을 사랑한다." + "\n", style: CustomTextStyles.bodytext1())
                  ]
                ),
                TextSpan(
                  text: "2번 날개" + "\n",
                  style: CustomTextStyles.headline2(),
                  children: [

                  ]
                )
              ]
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabPage3(BuildContext context) {
    return Column(
      children: [
        _buildHeadLine1(text: "장점"),
        /*ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: EnneagramController.to.enneagramExplain![enneagramType]!.merits!.length,
          itemBuilder: (BuildContext context, int index) {

            return _buildBodyTextList1(text: EnneagramController.to.enneagramExplain![enneagramType]!.merits![index]);
          }
        ),*/
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildBodyTextList1(text: "자기 훈련이 잘 되어 있으며 큰 일을 해낼 능력이 있다."),
          ],
        ),
        Blank(height: 10,),
        _buildHeadLine1(text: "단점"),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildBodyTextList1(text: "자기 훈련이 잘 되어 있으며 큰 일을 해낼 능력이 있다."),
          ],
        )
      ],
    );
  }

  Widget _buildTabPage4(BuildContext context) {
    return Column(
      children: [
        _buildHeadLine1(text: "인간관계"),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildBodyTextList1(text: "자기 훈련이 잘 되어 있으며 큰 일을 해낼 능력이 있다."),
          ],
        ),
        Blank(height: 10,),
        _buildHeadLine1(text: "주변사람들의 평가"),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildBodyTextList1(text: "자기 훈련이 잘 되어 있으며 큰 일을 해낼 능력이 있다."),
          ],
        ),
        Blank(height: 10,),
        _buildHeadLine1(text: "$enneagramType유형과 잘지내는법"),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildBodyTextList1(text: "자기 훈련이 잘 되어 있으며 큰 일을 해낼 능력이 있다."),
          ],
        )
      ],
    );
  }

  Widget _buildTabPage5(BuildContext context) {
    return Text("_buildTabPage5");
  }

  Widget _buildTabPage6(BuildContext context) {
    return Text("_buildTabPage6");
  }

  Widget _buildHeadLine1({required String text}) => SizedBox(
    width: double.infinity,
    child: Text(text, style: CustomTextStyles.headline1(), textAlign: TextAlign.center,)
  );

  Text _buildHeadLine2({required String text}) => Text(text, style: CustomTextStyles.headline2());

  Text _buildBodyText1({required String text}) => Text(text, style: CustomTextStyles.bodytext1());

  Text _buildBodyTextList1({required String text}) => Text("• " + text, style: CustomTextStyles.bodytext1());
}
