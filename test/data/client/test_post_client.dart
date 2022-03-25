
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permernent/app_controller.dart';
import 'package:wai/data/client/post_client.dart';
import 'package:wai/data/client/post_client.dart';
import 'package:wai/data/client/user_client.dart';
import 'package:wai/data/model/login/login_info.dart';
import 'package:wai/data/model/post/post_request_dto.dart';
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


  PostRequestDto postRequestDto = PostRequestDto(
    maxPostsSize: 10,
    postSearchType: PostSearchType.all
  );

  PostClient postClient = PostClient(testDio);

  await postClient.getPosts(
    postRequestDto: postRequestDto,
  ).then((value) {
    logger.d(value);
  });

  PostRequestDto postRequestDto2 = PostRequestDto(
      postId: 1,
  );

  await postClient.getPost(
    postRequestDto: postRequestDto2,
    token: AppController.to.getJwtToken()
  ).then((value) {
    logger.d(value);
  });
}

