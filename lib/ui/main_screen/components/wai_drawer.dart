import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/permenent/enneagram_controller.dart';
import 'package:wai/controller/permenent/user_controller.dart';
import 'package:wai/route.dart';
import 'package:wai/ui/main_screen/components/my_enneagram_container.dart';

class WaiDrawer extends StatelessWidget {
  const WaiDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(5.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
              color: WaiColors.deepLightMainColor
            ),
            child: Column(
              children: [
                const Text('나의 에니어그램 성향', style: TextStyle(fontSize: 18,color: WaiColors.white),),
                Expanded(
                  child: MyEnneagramContainer(myEnneagramTest: UserController.to.currentEnneagramTest.value,)
                )
              ],
            ),
          ),
          ExpansionTile(
            title: const Text('에니어그램 알아보기'),
            leading: const Icon(Icons.apps_rounded),
            textColor: WaiColors.lightBlueGrey,
            iconColor: WaiColors.lightBlueGrey,
            collapsedIconColor: WaiColors.lightBlueGrey,
            collapsedTextColor: WaiColors.lightBlueGrey,
            children: <Widget>[
              for (var i = 1; i <= 9; i++)
                ListTile(
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Image(
                          image: AssetImage(EnneagramController.to.enneagram[i]!.imagePath),
                          width: 20,
                          height: 20,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(EnneagramController.to.enneagram[i]!.getFullName(), style: const TextStyle(color: WaiColors.lightMainColor),),
                    ],
                  ),
                  onTap: () {
                    Get.back();
                    Map map = {"enneagramType" : i};
                    Get.toNamed(WaiRoutes.enneagramType, arguments: map);
                  },
                ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded,),
            textColor: WaiColors.lightBlueGrey,
            iconColor: WaiColors.lightBlueGrey,
            title: const Text('설정'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
