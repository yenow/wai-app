import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/controller/user/user_controller.dart';
import 'package:wai/ui/main_screen/my_page/enneagram_tab_page/components/season_image_button.dart';

import '../../../../../common/utils/logger.dart';

class TestListView extends StatelessWidget {
  const TestListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Opacity(
        opacity: 0.5,
        child: SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: UserController.to.userEnneagramTests.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Blank(width: 10);
            },
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Expanded(
                    child: SeasonImageButton(dateTime: UserController.to.userEnneagramTests[index].insertDate!)
                  ),
                  const Blank(height: 5),
                  Text(DateFormat('yyyy.MM.dd').format(UserController.to.userEnneagramTests[index].insertDate!), style: TextStyle(fontSize: 11),),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
