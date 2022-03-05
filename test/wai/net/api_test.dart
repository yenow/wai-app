
import 'package:http/http.dart' as http;
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:uuid/uuid.dart';
import 'package:wai/common/utils/api.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/data/model/login_info.dart';

main() async {

  LoginInfo loginInfo = LoginInfo(
    userKey: const Uuid().v4(),
    password: const Uuid().v4(),
  );

  http.Response response = await postApiRequest("/api/sign/signUpAsNonMember", loginInfo.toJson());
  logger.d(response.headers);
  logger.d(response.body);
  logger.d(response.statusCode);

  logger.d("==================");

  http.Response response2 = await postApiRequest("/api/sign/signUpAsNonMember", loginInfo.toJson());
  logger.d(response2.headers);
  logger.d(response2.body);
  logger.d(response2.statusCode);

}