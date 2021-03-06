import 'package:flutter/cupertino.dart';
import 'package:wai/data/model/enneagram_test/enneagram_test.dart';
import 'package:wai/ui/main_screen/my_page/enneagram_tab_page/components/enneagram_chart.dart';

import '../../../../../data/model/enneagram_test/enneagram_test_request_dto.dart';

class EnneagramChartContainer extends StatelessWidget {
  const EnneagramChartContainer({Key? key, required this.enneagramTest}) : super(key: key);
  final EnneagramTest enneagramTest;

  @override
  Widget build(BuildContext context) {

    if (enneagramTest.testType == TestType.hard) {
      return EnneagramChart(enneagramTest: enneagramTest);
    }

    return Container();
  }
}
