
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/data/client/user_client.dart';
import 'package:wai/data/model/login/login_info.dart';
import 'package:wai/data/model/sign/sign.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:wai/data/model/user/user_request_dto.dart';

import '../../api/test_dio.dart';

main() async {

  Get.put<AppController>(AppController());
  LoginInfo loginInfo = LoginInfo(
    userKey: "userKey",
    password: "password",
  );
  var response = await testDio.post("/sign/signIn", data: loginInfo.toJson());
  AppController.to.setLoginInfo(Sign.fromJson(response.data));


  UserRequestDto userRequestDto = UserRequestDto(
    userId: int.parse(AppController.to.loginInfo.value.userId),
    userKey: AppController.to.loginInfo.value.userKey,
  );

  UserClient userClient = UserClient(testDio);

  await userClient.getUserInformation(userRequestDto: userRequestDto, token: AppController.to.getJwtToken())
      .then((value) {
        User user = value;
        logger.d(user);
      });

}