
import 'package:get/get.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/controller/permenent/app_controller.dart';
import 'package:wai/data/client/enneagram_client.dart';
import 'package:wai/data/client/user_client.dart';
import 'package:wai/data/model/enneagram/enneagram.dart';
import 'package:wai/data/model/login/login_info.dart';
import 'package:wai/data/model/sign/sign.dart';
import 'package:wai/data/model/user/user.dart';
import 'package:wai/data/model/user/user_request_dto.dart';

import '../../api/test_dio.dart';

main() async {

  EnneagramClient enneagramClient = EnneagramClient(testDio);
  await enneagramClient.getEnneagramInformation().then((value) {
    List<Enneagram> enneagrams = value;
    logger.d(enneagrams);
  });
}