import 'package:flutter/material.dart';
import 'package:wai/common/widgets/blank.dart';
import 'package:wai/common/widgets/horizontal_border_line.dart';
import 'package:wai/common/widgets/wai_appbar.dart';
import 'package:wai/constants/wai_colors.dart';
import 'package:wai/controller/ban_user_controller.dart';

class BanUserPage extends StatelessWidget {
  const BanUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const WaiAppbar(
          elevation: 0,
          isBackLeading: true,
          backgroundColor: WaiColors.deepDarkMainColor,
          title: Text('차단회원', style: TextStyle(color: WaiColors.white),),
        ),
        body: Column(
          children: [
            const Blank(height: 15,),
            Expanded(
              child: ListView.separated(
                itemCount: BanUserController.to.banUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      const Blank(width: 15,),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Icon(
                          Icons.account_circle,
                          size: 20,
                          color: WaiColors.darkMainColor,
                        ),
                      ),
                      const Blank(width: 5,),
                      Expanded(
                          child: Text(BanUserController.to.banUsers[index].banNickname!,style: const TextStyle(fontSize: 17, color: WaiColors.darkMainColor),)
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 20, color: WaiColors.darkMainColor),
                        onPressed: () {
                        },
                      ),
                      const Blank(width: 5,),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const HorizontalBorderLine(height: 0.5, color: WaiColors.darkMainColor);
                },
              )
            ),
            const Blank(height: 15,),
          ],
        ),
      ),
    );
  }
}
