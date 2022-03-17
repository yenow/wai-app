
import 'package:dio/dio.dart';
import 'package:wai/common/interceptor/custom_log_interceptor.dart';
import 'package:wai/common/utils/logger.dart';
import 'package:wai/data/model/sign/sign.dart';
import 'package:wai/data/model/sign/sign_request_dto.dart';
import 'package:wai/data/client/sign_client.dart';

import '../../api/test_dio.dart';

main() async {
  SignClient signClient = SignClient(testDio);

  SignRequestDto signRequestDto = SignRequestDto(
    nickname: '테스트닉네임2'
  );

  await signClient.signUpAsNonMember(signRequestDto: signRequestDto).then((value) {
    logger.d(value);
  }).catchError((Object error) {
    if (error.runtimeType == DioError) {
      DioError dioError = error as DioError;
      logger.d(dioError.response?.data);
      logger.d(dioError.response?.data is Map);
    }

    // switch (error.runtimeType) {
    //   case DioError:
    //   // Here's the sample to get the failed response error code and message
    //     final DioError dioError = error as DioError;
    //     logger.d(dioError.response?.data);
    //     logger.d(dioError.response?.headers);
    //     logger.d(dioError.response?.statusCode);
    //     break;
    //   default:
    //     break;
    // }
  });
}