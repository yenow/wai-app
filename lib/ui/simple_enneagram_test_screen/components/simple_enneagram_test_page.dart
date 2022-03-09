import 'package:flutter/cupertino.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/common/theme/wai_textstyle.dart';
import 'package:wai/ui/simple_enneagram_test_screen/components/simple_enneagram_test_button.dart';
import 'package:wai/ui/simple_enneagram_test_screen/components/simple_question_list.dart';
import 'package:wai/ui/simple_enneagram_test_screen/components/simple_test_notification.dart';

class SimpleEnneagramTestPage extends StatelessWidget {
  const SimpleEnneagramTestPage({Key? key, required this.pageIndex}) : super(key: key);
  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 13,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SimpleTestNotification(),
                SimpleQuestionList(pageIndex: pageIndex),
              ],
            ),
          ),
        ),
        const Flexible(
          flex: 1,
          child: SimpleEnneagramTestButton()
        ),
      ],
    );
  }
}
