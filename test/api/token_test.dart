

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:wai/common/utils/logger.dart';

main() {

  String token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ1c2VyS2V5IiwiYXV0aCI6IlJPTEVfVVNFUiIsImV4cCI6MTY0NzUzMTM3MywiaWF0IjoxNjQ3NDQ0OTczfQ.rWOGmbk9lxNEQAV-dnQaUgcu9G7y90EXMHOmJ-Wea_qOA2IdjIik1gKO9EDEKUMHFHtE-DZZkNAHmZiGEAIXyA";
  var response = JwtDecoder.decode(token);
  DateTime expirationDate = JwtDecoder.getExpirationDate(token);
  bool hasExpired = JwtDecoder.isExpired(token);
  Duration tokenTime = JwtDecoder.getTokenTime(token);


  logger.d(response);
  logger.d(expirationDate);
  logger.d(hasExpired);
  logger.d(tokenTime);
  logger.d(tokenTime.inDays);
}