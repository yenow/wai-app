import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wai/controller/simple_enneagram_test_controller.dart';
import 'package:wai/data/model/enneagram/enneagram_question.dart';

import '../../../common/theme/wai_textstyle.dart';
import '../../../controller/permernent/enneagram_test_controller.dart';

class SimpleQuestion extends StatelessWidget {
  const SimpleQuestion({Key? key, required this.pageIndex, required this.index, required this.simpleQuestionList,
    required this.uniqueString,required this.currentUniqueString}) : super(key: key);
  final int pageIndex;
  final int index;
  final String uniqueString;
  final String currentUniqueString;
  final List<EnneagramQuestion> simpleQuestionList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: ElevatedButton(
        onPressed: () {
          SimpleEnneagramTestController.to.changeCurrentUniqueString(uniqueString);
          SimpleEnneagramTestController.to.setSimpleTestSelectMap(pageIndex: pageIndex, uniqueString: uniqueString);
        },
        child: Column(
          children: [
            Text(
                simpleQuestionList[index].getFullSimpleQuestion(),
                style: WaiTextStyle(fontSize: 16, color: Colors.black54).basic()
            ),
            Visibility(
              child: Text(currentUniqueString),
              visible: false,
            )
          ],
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
          padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10))
          )),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (currentUniqueString == uniqueString) {
              return Colors.blueGrey.shade100;
            } else {
              return Colors.white;
            }
          }), // Button color
          overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.pressed)) return Colors.blueGrey.shade100; // Splash color
          }),
        ),
      ),
    );
  }
}
