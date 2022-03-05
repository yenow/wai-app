import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/common/constants/wai_colors.dart';
import 'package:wai/controller/app_controller.dart';
import 'package:wai/common/controller/home_controller.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/common/widgets/wai_circular_progress_indicator.dart';
import 'package:wai/common/widgets/wai_snackbar.dart';
import 'package:wai/models/wise_saying/wise_saying.dart';
import 'package:wai/models/wise_saying/wise_saying_request_dto.dart';
import 'package:wai/net/wise_saying/wise_saying_api.dart';

class FadeInOutWiseSaying extends StatefulWidget {
  const FadeInOutWiseSaying({Key? key}) : super(key: key);

  @override
  _FadeInOutWiseSayingState createState() => _FadeInOutWiseSayingState();
}

class _FadeInOutWiseSayingState extends State<FadeInOutWiseSaying> {
  bool _visible = true;
  late Future<void> isInit;
  late WiseSaying wiseSaying;

  @override
  void initState() {
    isInit = initWiseSaying();
    super.initState();
  }

  Future<void> initWiseSaying() async {
    wiseSaying = await getWiseSaying(WiseSayingRequestDto());
    HomeController.to.wiseSayings.add(wiseSaying);
    // return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isInit,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const WaiCircularProgressIndicator();
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return _buildContent();
            }
        }
      },
    );
  }

  Widget _buildContent() {
    return Center(
      child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            child: const Icon(Icons.arrow_back_ios_outlined, color: WaiColors.grey, size: 16,),
                            onTap: () {
                              int currentIndex = HomeController.to.wiseSayings.indexOf(wiseSaying);
                              if (HomeController.to.wiseSayings.isNotEmpty && currentIndex > 0) {

                                 setState(() {
                                   wiseSaying = HomeController.to.wiseSayings.elementAt(currentIndex - 1);
                                 });
                              }
                            },
                          ),
                          Text(
                            wiseSaying.wiseSayingCategory!,
                            style: WaiTextStyle(fontSize: 16, color: WaiColors.grey).basic(),),
                          InkWell(
                            child: const Icon(Icons.arrow_forward_ios_outlined, color: WaiColors.grey, size: 16,),
                            onTap: () async {
                              int currentIndex = HomeController.to.wiseSayings.indexOf(wiseSaying);

                              setState(() {
                                _visible = !_visible;
                              });
                              await Future.delayed(const Duration(milliseconds: 300), () {});

                              /*  api 요청 */
                              if (currentIndex == HomeController.to.wiseSayings.length - 1) {
                                int lastId = HomeController.to.wiseSayings.elementAt(HomeController.to.wiseSayings.length - 1).id!;
                                WiseSaying tempWiseSaying = await getWiseSaying(WiseSayingRequestDto(lastId: lastId));

                                if (tempWiseSaying.wiseSaying == null) {
                                  AppController.to.snackBarKey.currentState!.showSnackBar(WaiSnackBar.basic(text: "더 이상 글이 없습니다."));
                                } else {
                                  wiseSaying = tempWiseSaying;
                                  HomeController.to.wiseSayings.add(tempWiseSaying);
                                }

                              /* api 요청 x */
                              } else {
                                wiseSaying = HomeController.to.wiseSayings.elementAt(currentIndex + 1);
                              }

                              setState(() {
                                _visible = !_visible;
                              });
                            },
                          ),
                        ],

                      ),
                      const Blank(height: 10,),
                      const HorizontalBorderLine(height: 0.5, color: Colors.grey,),
                      const Blank(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          wiseSaying.wiseSaying!,
                          style: WaiTextStyle(fontSize: 18, color: WaiColors.lightBlueGrey).basic(),),
                      ),
                      Text(
                        "- " + wiseSaying.author! + " -",
                        style: WaiTextStyle(fontSize: 16, color: WaiColors.lightBlueGrey).basic(),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.4),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
