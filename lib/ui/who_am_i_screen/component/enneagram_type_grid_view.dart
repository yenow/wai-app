import 'package:flutter/material.dart';
import 'package:wai/controller/who_am_i_controller.dart';
import 'package:wai/ui/who_am_i_screen/component/enneagram_type_card.dart';

class EnneagramTypeGridView extends StatelessWidget {
  const EnneagramTypeGridView({Key? key,
    required this.currentIndex,
    required this.changeCurrentIndex
  }) : super(key: key);

  final int currentIndex;
  final Function(int newIndex) changeCurrentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/10),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(5),
        children: List.generate(9, (index) {
          int enneagramTypeIndex = index + 1;
          return EnneagramTypeCard(
              enneagramTypeIndex: enneagramTypeIndex,
              currentIndex: currentIndex,
              changeCurrentIndex: changeCurrentIndex,
          );
        }),
      ),
    );
  }
}
